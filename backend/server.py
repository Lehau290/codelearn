"""
CodeLearn C++ - Full Backend API & Static Web Server
File: backend/server.py
"""
import os
import sys

# Force UTF-8 encoding on Windows console
if sys.stdout and hasattr(sys.stdout, "reconfigure"):
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
        sys.stderr.reconfigure(encoding="utf-8", errors="replace")
    except Exception:
        pass

import json
import mimetypes
import urllib.parse
from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler
from datetime import datetime, timedelta
import uuid
import hashlib

# Add root directory to sys.path
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if BASE_DIR not in sys.path:
    sys.path.insert(0, BASE_DIR)

from backend.database import get_connection, init_db, hash_password, verify_password
from backend.auth import (
    get_user_from_token,
    register_user,
    authenticate_user,
    delete_session
)
from backend.compiler import compile_and_run, evaluate_exercise, get_compiler_version, get_ai_mentor_reply, normalize_text
import time
import threading

PORT = int(os.environ.get("PORT", 5000))
MAX_BODY_BYTES = 10 * 1024 * 1024  # 10 MB maximum request payload

class SimpleRateLimiter:
    """Sliding-window IP rate limiter to mitigate DoS & brute-force attacks."""
    def __init__(self):
        self._history = {}
        self._lock = threading.Lock()

    def is_allowed(self, key: str, max_requests: int, window_seconds: int) -> tuple[bool, int]:
        now = time.time()
        with self._lock:
            records = self._history.get(key, [])
            cutoff = now - window_seconds
            valid_records = [t for t in records if t > cutoff]
            if len(valid_records) >= max_requests:
                oldest = valid_records[0]
                retry_after = max(1, int(oldest + window_seconds - now))
                self._history[key] = valid_records
                return False, retry_after
            valid_records.append(now)
            self._history[key] = valid_records
            return True, 0

rate_limiter = SimpleRateLimiter()

class CodeLearnHandler(SimpleHTTPRequestHandler):
    """Handles both REST API endpoints (/api/*) and static files."""

    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=BASE_DIR, **kwargs)

    # ---------------------------------------------------------
    # Helper Utilities
    # ---------------------------------------------------------
    def send_cors_headers(self):
        """Sends permissive CORS headers."""
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type, Authorization, X-Requested-With")

    def do_OPTIONS(self):
        """Handles CORS preflight requests."""
        self.send_response(204)
        self.send_cors_headers()
        self.end_headers()

    def send_json(self, status_code: int, data: dict | list):
        """Sends a JSON response with status and CORS."""
        response_bytes = json.dumps(data, ensure_ascii=False).encode("utf-8")
        self.send_response(status_code)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(response_bytes)))
        self.send_cors_headers()
        self.end_headers()
        self.wfile.write(response_bytes)

    def read_json_body(self) -> dict | None:
        """Parses JSON request body safely with payload size limit."""
        content_length_str = self.headers.get("Content-Length", "0")
        try:
            content_length = int(content_length_str)
        except ValueError:
            return {}
        if content_length <= 0:
            return {}
        if content_length > MAX_BODY_BYTES:
            return None  # Exceeds max payload limit
        try:
            body = self.rfile.read(content_length).decode("utf-8")
            return json.loads(body)
        except Exception:
            return {}

    def get_auth_user(self) -> dict | None:
        """Extracts user from Authorization: Bearer <token> or ?token=<token>."""
        auth_header = self.headers.get("Authorization", "")
        token = ""
        if auth_header.startswith("Bearer "):
            token = auth_header[7:].strip()
        else:
            # Check URL query param
            query = urllib.parse.urlparse(self.path).query
            params = urllib.parse.parse_qs(query)
            token = params.get("token", [""])[0]

        if not token:
            return None
        return get_user_from_token(token)

    # ---------------------------------------------------------
    # Routing: GET
    # ---------------------------------------------------------
    def do_GET(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path
        query = urllib.parse.parse_qs(parsed.query)

        # Route /api/*
        if path.startswith("/api/"):
            return self.handle_api_get(path, query)

        # Serve index.html or home.html on root
        if path == "/" or path == "":
            self.path = "/home.html"

        return super().do_GET()

    def handle_api_get(self, path: str, query: dict):
        user = self.get_auth_user()
        user_id = user["id"] if user else None

        # 1. Health check & compiler info
        if path == "/api/health":
            return self.send_json(200, {
                "status": "online",
                "compiler": get_compiler_version(),
                "time": datetime.now().isoformat()
            })

        # API Documentation & Capabilities metadata (/api or /api/docs)
        if path in ("/api", "/api/docs"):
            return self.send_json(200, {
                "name": "CodeLearn C++ Backend API",
                "version": "2.1.0",
                "status": "online",
                "compiler": get_compiler_version(),
                "endpoints": [
                    {"method": "GET", "path": "/api/health", "desc": "Kiểm tra trạng thái server & g++"},
                    {"method": "GET", "path": "/api/docs", "desc": "Tài liệu danh sách API"},
                    {"method": "GET", "path": "/api/leaderboard", "desc": "Bảng vàng thi đua học viên thực tế"},
                    {"method": "POST", "path": "/api/auth/register", "desc": "Đăng ký tài khoản mới"},
                    {"method": "POST", "path": "/api/auth/login", "desc": "Đăng nhập và nhận session token"},
                    {"method": "POST", "path": "/api/auth/logout", "desc": "Đăng xuất khỏi hệ thống"},
                    {"method": "GET", "path": "/api/auth/me", "desc": "Lấy thông tin người dùng hiện tại"},
                    {"method": "GET", "path": "/api/lessons", "desc": "Danh sách bài học kèm tiến độ cá nhân"},
                    {"method": "GET", "path": "/api/lessons/{id}", "desc": "Chi tiết lý thuyết, code mẫu và bài tập"},
                    {"method": "POST", "path": "/api/compile", "desc": "Biên dịch và chạy mã C++ an toàn qua g++"},
                    {"method": "POST", "path": "/api/submit-exercise", "desc": "Nộp bài tập và chấm điểm tự động"},
                    {"method": "POST", "path": "/api/ai/ask", "desc": "Trợ lý AI Trợ giảng C++ hỗ trợ học viên"},
                    {"method": "GET/POST", "path": "/api/progress", "desc": "Xem và lưu tiến độ học tập"},
                    {"method": "GET/PUT", "path": "/api/user/profile", "desc": "Cập nhật hồ sơ & ảnh đại diện"},
                    {"method": "PUT", "path": "/api/user/password", "desc": "Đổi mật khẩu người dùng"},
                    {"method": "GET/POST/PUT/DELETE", "path": "/api/admin/*", "desc": "Quản trị bài học, người dùng và CSDL"}
                ]
            })

        # 2. Leaderboard (/api/leaderboard)
        if path == "/api/leaderboard":
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("""
                SELECT 
                    u.id, 
                    u.username, 
                    u.full_name, 
                    u.avatar, 
                    u.role,
                    u.created_at,
                    COALESCE(SUM(p.score), 0) AS total_score,
                    COUNT(CASE WHEN p.status = 'completed' THEN 1 END) AS completed_lessons,
                    MAX(p.updated_at) AS last_active
                FROM users u
                LEFT JOIN progress p ON u.id = p.user_id
                GROUP BY u.id
                ORDER BY total_score DESC, completed_lessons DESC, u.created_at ASC
                LIMIT 50
            """)
            rows = cursor.fetchall()
            leaderboard = []
            for idx, r in enumerate(rows, 1):
                completed = r["completed_lessons"]
                if completed >= 10:
                    rank_title = "C++ Master"
                elif completed >= 5:
                    rank_title = "Lập trình viên C++"
                elif completed >= 2:
                    rank_title = "Coder Tập sự"
                else:
                    rank_title = "Học viên Mới"

                streak = max(1, completed) if completed > 0 else 0
                leaderboard.append({
                    "rank": idx,
                    "id": r["id"],
                    "username": r["username"],
                    "fullName": r["full_name"] or r["username"],
                    "avatar": r["avatar"] or "",
                    "role": r["role"],
                    "rankTitle": rank_title,
                    "points": int(r["total_score"]),
                    "completedLessons": completed,
                    "streak": streak,
                    "isCurrentUser": (user_id == r["id"]) if user_id else False
                })
            conn.close()
            return self.send_json(200, {
                "leaderboard": leaderboard,
                "total": len(leaderboard),
                "generatedAt": datetime.now().isoformat()
            })

        # 3. Current user (/api/auth/me)
        if path == "/api/auth/me":
            if not user:
                return self.send_json(401, {"error": "Chưa đăng nhập hoặc phiên làm việc đã hết hạn."})
            return self.send_json(200, {"user": user})

        # 3b. AI Status & Provider Config (/api/ai/config)
        if path == "/api/ai/config":
            from backend.compiler import get_api_key_from_env_or_config
            provider, key = get_api_key_from_env_or_config()
            return self.send_json(200, {
                "hasApiKey": bool(key),
                "provider": provider or "builtin",
                "model": "Gemini 1.5/2.0 Flash" if provider == "gemini" else ("GPT-4o Mini / Llama" if provider in ("openai", "groq") else "CodeLearn C++ Neural Tutor")
            })

        # 3c. Get AI Chat History (/api/ai/history)
        if path == "/api/ai/history":
            if not user_id:
                return self.send_json(200, {"messages": []})
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("""
                SELECT id, role, content, persona, code_snippet, lesson_id, created_at
                FROM ai_chat_messages
                WHERE user_id = ?
                ORDER BY created_at ASC
                LIMIT 50
            """, (user_id,))
            rows = [dict(r) for r in cursor.fetchall()]
            conn.close()
            return self.send_json(200, {"messages": rows})

        # 3d. VNOI Real Articles API (/api/vnoi/articles)
        if path == "/api/vnoi/articles":
            category = query.get("category", [None])[0]
            search_q = query.get("q", [None])[0]
            try:
                conn = get_connection()
                cursor = conn.cursor()
                sql = "SELECT id, title, category, author, source_url, keywords, summary, updated_at FROM vnoi_real_knowledge WHERE 1=1"
                params = []
                if category:
                    sql += " AND category = ?"
                    params.append(category)
                if search_q:
                    sql += " AND (title LIKE ? OR summary LIKE ? OR keywords LIKE ?)"
                    wildcard = f"%{search_q}%"
                    params.extend([wildcard, wildcard, wildcard])
                sql += " ORDER BY category, title"
                cursor.execute(sql, params)
                rows = [dict(r) for r in cursor.fetchall()]
                for r in rows:
                    try:
                        r["keywords"] = json.loads(r["keywords"])
                    except Exception:
                        pass
                conn.close()
                return self.send_json(200, {
                    "count": len(rows),
                    "source": "VNOI Wiki Official Repository",
                    "articles": rows
                })
            except Exception as e:
                return self.send_json(500, {"error": f"Lỗi truy vấn dữ liệu VNOI: {str(e)}"})

        # 4. All lessons (/api/lessons)
        if path == "/api/lessons":
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM lessons ORDER BY order_num ASC")
            lessons_rows = cursor.fetchall()

            # If user is logged in, attach progress
            user_progress = {}
            if user_id:
                cursor.execute("SELECT lesson_id, status, score FROM progress WHERE user_id = ?", (user_id,))
                for prow in cursor.fetchall():
                    user_progress[prow["lesson_id"]] = {
                        "status": prow["status"],
                        "score": prow["score"]
                    }

            result = []
            for r in lessons_rows:
                lid = r["id"]
                item = {
                    "id": lid,
                    "title": r["title"],
                    "chapter": r["chapter"],
                    "description": r["description"],
                    "level": r["level"],
                    "duration": r["duration"],
                    "order": r["order_num"],
                    "createdAt": r["created_at"]
                }
                if user_id and lid in user_progress:
                    item["userProgress"] = user_progress[lid]
                result.append(item)

            conn.close()
            return self.send_json(200, {"lessons": result})

        # 4. Lesson Comments (/api/lessons/{id}/comments)
        if path.startswith("/api/lessons/") and path.endswith("/comments"):
            lid = path.split("/")[3]
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("""
                SELECT c.id, c.lesson_id, c.user_id, c.parent_id, c.content, c.created_at,
                       u.username, u.full_name, u.avatar, u.role
                FROM comments c
                JOIN users u ON c.user_id = u.id
                WHERE c.lesson_id = ?
                ORDER BY c.created_at DESC
                LIMIT 100
            """, (lid,))
            comments = [dict(r) for r in cursor.fetchall()]
            conn.close()
            return self.send_json(200, {"comments": comments, "total": len(comments)})

        # 5. Single lesson (/api/lessons/<id>)
        if path.startswith("/api/lessons/"):
            lesson_id = path[len("/api/lessons/"):].strip()
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM lessons WHERE id = ?", (lesson_id,))
            lesson = cursor.fetchone()

            if not lesson:
                conn.close()
                return self.send_json(404, {"error": "Không tìm thấy bài học."})

            # Fetch 3 exercises
            cursor.execute("SELECT * FROM exercises WHERE lesson_id = ? ORDER BY order_num ASC", (lesson_id,))
            ex_rows = cursor.fetchall()
            exercises = []
            for ex in ex_rows:
                exercises.append({
                    "id": ex["id"],
                    "title": ex["title"],
                    "level": ex["level"],
                    "difficulty": ex["difficulty"],
                    "points": ex["points"],
                    "description": ex["description"],
                    "starterCode": ex["starter_code"],
                    "expectedOutput": ex["expected_output"],
                    "hint": ex["hint"],
                    "testKeywords": json.loads(ex["test_keywords"] or "[]"),
                    "order": ex["order_num"]
                })

            # User progress for this lesson
            prog = None
            if user_id:
                cursor.execute("SELECT * FROM progress WHERE user_id = ? AND lesson_id = ?", (user_id, lesson_id))
                prow = cursor.fetchone()
                if prow:
                    prog = {
                        "status": prow["status"],
                        "code": prow["code"],
                        "score": prow["score"],
                        "comprehensionLevel": prow["comprehension_level"],
                        "completedAt": prow["completed_at"]
                    }

            conn.close()
            return self.send_json(200, {
                "lesson": {
                    "id": lesson["id"],
                    "title": lesson["title"],
                    "chapter": lesson["chapter"],
                    "description": lesson["description"],
                    "level": lesson["level"],
                    "duration": lesson["duration"],
                    "content": lesson["content"],
                    "example": lesson["example"],
                    "exerciseTitle": lesson["exercise_title"],
                    "exerciseDescription": lesson["exercise_description"],
                    "starterCode": lesson["starter_code"],
                    "order": lesson["order_num"],
                    "exercises": exercises,
                    "progress": prog
                }
            })

        # 5. User progress (/api/progress)
        if path == "/api/progress":
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập để xem tiến độ."})
            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute("SELECT COUNT(*) as total FROM lessons")
            total_lessons = cursor.fetchone()["total"]

            cursor.execute("SELECT * FROM progress WHERE user_id = ?", (user_id,))
            all_prog = cursor.fetchall()

            completed_count = sum(1 for p in all_prog if p["status"] == "completed")
            started_count = len(all_prog)
            scores = [p["score"] for p in all_prog if p["score"] > 0]
            avg_score = round(sum(scores) / len(scores), 1) if scores else 0
            percent = round((completed_count / total_lessons * 100), 1) if total_lessons > 0 else 0

            lesson_dict = {}
            for p in all_prog:
                lesson_dict[p["lesson_id"]] = {
                    "status": p["status"],
                    "score": p["score"],
                    "code": p["code"],
                    "comprehensionLevel": p["comprehension_level"],
                    "completedAt": p["completed_at"]
                }

            conn.close()
            return self.send_json(200, {
                "stats": {
                    "totalLessons": total_lessons,
                    "completedCount": completed_count,
                    "startedCount": started_count,
                    "progressPercent": percent,
                    "averageScore": avg_score
                },
                "lessons": lesson_dict
            })

        # 6. User Profile (/api/user/profile)
        if path == "/api/user/profile":
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập."})
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT COUNT(*) as total FROM lessons")
            total_lessons = cursor.fetchone()["total"]
            cursor.execute("SELECT COUNT(*) as completed FROM progress WHERE user_id = ? AND status = 'completed'", (user_id,))
            completed = cursor.fetchone()["completed"]
            cursor.execute("SELECT AVG(score) as avg_score FROM progress WHERE user_id = ? AND score > 0", (user_id,))
            avg_row = cursor.fetchone()
            avg_score = round(avg_row["avg_score"], 1) if avg_row["avg_score"] else 0

            conn.close()
            return self.send_json(200, {
                "user": user,
                "stats": {
                    "completedLessons": completed,
                    "totalLessons": total_lessons,
                    "percent": round(completed / total_lessons * 100, 1) if total_lessons else 0,
                    "averageScore": avg_score
                }
            })

        # 7. Admin Statistics (/api/admin/stats)
        if path == "/api/admin/stats":
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ dành cho Quản trị viên."})
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT COUNT(*) as count FROM users")
            total_users = cursor.fetchone()["count"]
            cursor.execute("SELECT COUNT(*) as count FROM lessons")
            total_lessons = cursor.fetchone()["count"]
            cursor.execute("SELECT COUNT(*) as count FROM progress WHERE status = 'completed'")
            total_completed = cursor.fetchone()["count"]
            cursor.execute("SELECT COUNT(*) as count FROM submissions")
            total_submissions = cursor.fetchone()["count"]

            conn.close()
            return self.send_json(200, {
                "totalUsers": total_users,
                "totalLessons": total_lessons,
                "totalCompleted": total_completed,
                "totalSubmissions": total_submissions
            })

        # 8. Admin Users list (/api/admin/users)
        if path == "/api/admin/users":
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ dành cho Quản trị viên."})
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT id, username, email, full_name, role, avatar, created_at FROM users ORDER BY created_at DESC")
            rows = cursor.fetchall()
            users_list = []
            for r in rows:
                users_list.append({
                    "id": r["id"],
                    "username": r["username"],
                    "email": r["email"],
                    "fullName": r["full_name"],
                    "role": r["role"],
                    "avatar": r["avatar"] or "",
                    "createdAt": r["created_at"]
                })
            conn.close()
            return self.send_json(200, {"users": users_list})

        # 9. Admin Database Stats (/api/admin/database/stats)
        if path == "/api/admin/database/stats":
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ dành cho Quản trị viên."})
            import backend.database_manager as dbm
            stats = dbm.get_stats()
            integ = dbm.check_integrity()
            return self.send_json(200, {"stats": stats, "integrity": integ})

        # 10. Verify Certificate (/api/certificates/verify?code=...)
        if path == "/api/certificates/verify":
            code = query.get("code", [""])[0].strip()
            if not code:
                return self.send_json(400, {"error": "Thiếu mã chứng chỉ cần tra cứu."})
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("""
                SELECT c.cert_code, c.course_name, c.final_score, c.issued_at, c.verification_hash,
                       u.full_name, u.username, u.avatar
                FROM certificates c
                JOIN users u ON c.user_id = u.id
                WHERE c.cert_code = ?
            """, (code,))
            row = cursor.fetchone()
            conn.close()
            if not row:
                return self.send_json(404, {"valid": False, "error": f"Không tìm thấy chứng chỉ với mã {code}."})
            return self.send_json(200, {
                "valid": True,
                "certCode": row["cert_code"],
                "courseName": row["course_name"],
                "studentName": row["full_name"] or row["username"],
                "username": row["username"],
                "finalScore": row["final_score"],
                "issuedAt": row["issued_at"],
                "verificationHash": row["verification_hash"]
            })

        # 11. My Certificates (/api/certificates/me)
        if path == "/api/certificates/me":
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập."})
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM certificates WHERE user_id = ? ORDER BY issued_at DESC", (user["id"],))
            certs = [dict(r) for r in cursor.fetchall()]
            conn.close()
            return self.send_json(200, {"certificates": certs})

        # 12. Achievements with unlock status (/api/achievements)
        if path == "/api/achievements":
            conn = get_connection()
            cursor = conn.cursor()
            if user:
                cursor.execute("""
                    SELECT a.id, a.code, a.title, a.description, a.points, a.order_num,
                           ua.unlocked_at, CASE WHEN ua.unlocked_at IS NOT NULL THEN 1 ELSE 0 END as unlocked
                    FROM achievements a
                    LEFT JOIN user_achievements ua ON a.id = ua.achievement_id AND ua.user_id = ?
                    ORDER BY a.order_num ASC
                """, (user["id"],))
            else:
                cursor.execute("SELECT id, code, title, description, points, order_num, 0 as unlocked, NULL as unlocked_at FROM achievements ORDER BY order_num ASC")
            ach_rows = [dict(r) for r in cursor.fetchall()]
            conn.close()
            return self.send_json(200, {"achievements": ach_rows})

        return self.send_json(404, {"error": "Endpoint không tồn tại."})

    # ---------------------------------------------------------
    # Routing: POST
    # ---------------------------------------------------------
    def do_POST(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path
        body = self.read_json_body()
        user = self.get_auth_user()

        if body is None:
            return self.send_json(413, {"error": "Dung lượng dữ liệu gửi lên vượt quá giới hạn cho phép (10MB)."})

        client_ip = self.client_address[0] if self.client_address else "127.0.0.1"

        # Rate limiting cho biên dịch code và nộp bài (30 req / phút / IP)
        if path in ("/api/compile", "/api/submit-exercise"):
            allowed, retry_sec = rate_limiter.is_allowed(f"compile:{client_ip}", max_requests=30, window_seconds=60)
            if not allowed:
                return self.send_json(429, {
                    "error": f"Bạn đang gửi yêu cầu biên dịch quá nhanh. Vui lòng thử lại sau {retry_sec} giây.",
                    "retryAfter": retry_sec
                })

        # Rate limiting cho đăng nhập chống tấn công dò mật khẩu (10 req / phút / IP)
        if path == "/api/auth/login":
            allowed, retry_sec = rate_limiter.is_allowed(f"login:{client_ip}", max_requests=10, window_seconds=60)
            if not allowed:
                return self.send_json(429, {
                    "error": f"Quá nhiều lần thử đăng nhập. Vui lòng chờ {retry_sec} giây trước khi thử lại.",
                    "retryAfter": retry_sec
                })

        # 1. Register (/api/auth/register)
        if path == "/api/auth/register":
            username = body.get("username", "")
            email = body.get("email", "")
            password = body.get("password", "")
            full_name = body.get("fullName", "")
            ok, msg_or_token, user_data = register_user(username, email, password, full_name)
            if not ok:
                return self.send_json(400, {"error": msg_or_token})
            return self.send_json(201, {
                "token": msg_or_token,
                "user": user_data,
                "message": "Đăng ký tài khoản thành công!"
            })

        # 2. Login (/api/auth/login)
        if path == "/api/auth/login":
            identity = body.get("username") or body.get("email") or ""
            password = body.get("password", "")
            ok, msg_or_token, user_data = authenticate_user(identity, password)
            if not ok:
                return self.send_json(400, {"error": msg_or_token})
            return self.send_json(200, {
                "token": msg_or_token,
                "user": user_data,
                "message": "Đăng nhập thành công!"
            })

        # 3. Logout (/api/auth/logout)
        if path == "/api/auth/logout":
            token = self.headers.get("Authorization", "").replace("Bearer ", "").strip()
            delete_session(token)
            return self.send_json(200, {"message": "Đã đăng xuất."})

        # 4. Real C++ Compiler Sandbox (/api/compile)
        if path == "/api/compile":
            code = body.get("code", "")
            stdin_val = body.get("input", "")
            timeout = min(10, max(2, int(body.get("timeout", 5))))

            result = compile_and_run(code, stdin_input=stdin_val, timeout_sec=timeout)
            return self.send_json(200, result)

        # 5. Automated AI Exercise Submission (/api/submit-exercise)
        if path == "/api/submit-exercise":
            user = self.get_auth_user()
            user_id = user["id"] if user else None

            code = body.get("code", "")
            lesson_id = body.get("lessonId", "")
            exercise_id = body.get("exerciseId", "")
            stdin_val = body.get("input", "")

            conn = get_connection()
            cursor = conn.cursor()

            expected_output = body.get("expectedOutput", "")
            test_keywords = body.get("testKeywords", [])

            # Check test cases from database
            cursor.execute("""
                SELECT id, input_data, expected_output, is_hidden, weight_points, order_num
                FROM test_cases
                WHERE lesson_id = ? AND exercise_id = ?
                ORDER BY order_num ASC
            """, (lesson_id, exercise_id))
            db_test_cases = [dict(r) for r in cursor.fetchall()]

            # If not provided, fetch from database exercises
            if not expected_output and lesson_id and exercise_id:
                cursor.execute("SELECT expected_output, test_keywords FROM exercises WHERE lesson_id = ? AND id = ?", (lesson_id, exercise_id))
                ex_row = cursor.fetchone()
                if ex_row:
                    expected_output = ex_row["expected_output"]
                    test_keywords = json.loads(ex_row["test_keywords"] or "[]")

            # Lấy tiêu đề bài học để đối chiếu với dữ liệu thật VNOI
            lesson_title = ""
            if lesson_id:
                try:
                    cursor.execute("SELECT title FROM lessons WHERE id = ?", (lesson_id,))
                    l_row = cursor.fetchone()
                    if l_row:
                        lesson_title = l_row["title"]
                except Exception:
                    pass

            eval_res = evaluate_exercise(
                code, 
                expected_output, 
                test_keywords, 
                stdin_input=stdin_val, 
                test_cases=db_test_cases,
                lesson_title=lesson_title,
                lesson_id=lesson_id
            )

            # Record submission in database
            now = datetime.now().isoformat()
            sub_id = "sub-" + str(uuid.uuid4())[:8]
            if user_id:
                try:
                    cursor.execute("""
                        INSERT INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                    """, (
                        sub_id,
                        user_id,
                        lesson_id,
                        exercise_id,
                        code,
                        eval_res.get("output", ""),
                        1 if eval_res.get("passed") else 0,
                        eval_res.get("score", 0),
                        eval_res.get("execution", {}).get("execution_time_ms", 0),
                        json.dumps(eval_res.get("strengths", []) + eval_res.get("improvements", []), ensure_ascii=False),
                        now
                    ))
                except Exception as ex:
                    print(f"[Submission log] Không thể ghi bản ghi submission: {ex}")

            # Streak tracking & Progress updating
            new_achievements = []
            if user_id:
                # 1. Update streak
                today_str = datetime.now().strftime("%Y-%m-%d")
                cursor.execute("SELECT current_streak, longest_streak, last_study_date FROM users WHERE id = ?", (user_id,))
                u_row = cursor.fetchone()
                if u_row:
                    curr_s = u_row["current_streak"] or 0
                    long_s = u_row["longest_streak"] or 0
                    last_d = u_row["last_study_date"]
                    if last_d != today_str:
                        yesterday_str = (datetime.now() - timedelta(days=1)).strftime("%Y-%m-%d")
                        if last_d == yesterday_str:
                            curr_s += 1
                        else:
                            curr_s = 1
                        long_s = max(long_s, curr_s)
                        cursor.execute("UPDATE users SET current_streak = ?, longest_streak = ?, last_study_date = ? WHERE id = ?", (curr_s, long_s, today_str, user_id))

                # 2. Update progress
                if lesson_id:
                    cursor.execute("SELECT id, status, score FROM progress WHERE user_id = ? AND lesson_id = ?", (user_id, lesson_id))
                    prog_row = cursor.fetchone()
                    new_status = "completed" if eval_res["passed"] else "in_progress"
                    new_score = max(eval_res["score"], prog_row["score"] if prog_row else 0)

                    if prog_row:
                        cursor.execute("""
                            UPDATE progress
                            SET status = ?, code = ?, score = ?, comprehension_level = ?, updated_at = ?, completed_at = CASE WHEN ? = 'completed' AND completed_at IS NULL THEN ? ELSE completed_at END
                            WHERE user_id = ? AND lesson_id = ?
                        """, (new_status, code, new_score, eval_res["comprehensionLevel"], now, new_status, now, user_id, lesson_id))
                    else:
                        cursor.execute("""
                            INSERT INTO progress (id, user_id, lesson_id, status, code, score, comprehension_level, completed_at, updated_at)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
                        """, ("prog-" + str(uuid.uuid4())[:8], user_id, lesson_id, new_status, code, new_score, eval_res["comprehensionLevel"], now if new_status == "completed" else None, now))

                # 3. Check and unlock achievements
                if eval_res.get("passed"):
                    cursor.execute("SELECT COUNT(DISTINCT lesson_id) as cnt FROM progress WHERE user_id = ? AND status = 'completed'", (user_id,))
                    comp_cnt = cursor.fetchone()["cnt"] or 0

                    cursor.execute("SELECT achievement_id FROM user_achievements WHERE user_id = ?", (user_id,))
                    unlocked_ids = {r["achievement_id"] for r in cursor.fetchall()}

                    candidates = []
                    if comp_cnt >= 1:
                        candidates.append("first_lesson")
                    if comp_cnt >= 3:
                        candidates.append("three_lessons")
                    if comp_cnt >= 5:
                        candidates.append("five_lessons")
                    if comp_cnt >= 10:
                        candidates.append("half_way")
                    if comp_cnt >= 20:
                        candidates.append("master")
                    if eval_res.get("score", 0) >= 100:
                        candidates.append("high_score")

                    for code_name in candidates:
                        cursor.execute("SELECT id, title, description, points FROM achievements WHERE code = ?", (code_name,))
                        ach = cursor.fetchone()
                        if ach and ach["id"] not in unlocked_ids:
                            cursor.execute("INSERT INTO user_achievements (user_id, achievement_id, unlocked_at) VALUES (?, ?, ?)", (user_id, ach["id"], now))
                            new_achievements.append(dict(ach))

                # 4. Activity log
                cursor.execute("""
                    INSERT INTO activity_logs (id, user_id, action, ip_address, details, created_at)
                    VALUES (?, ?, ?, ?, ?, ?)
                """, (
                    str(uuid.uuid4()),
                    user_id,
                    "submit_exercise",
                    client_ip,
                    f"Lesson: {lesson_id}, Ex: {exercise_id}, Score: {eval_res.get('score', 0)}, Passed: {eval_res.get('passed')}",
                    now
                ))

            conn.commit()
            conn.close()

            eval_res["newAchievements"] = new_achievements
            return self.send_json(200, eval_res)

        # 6. Save User Progress Draft (/api/progress)
        if path == "/api/progress":
            user = self.get_auth_user()
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập."})

            lesson_id = body.get("lessonId", "")
            code = body.get("code", "")
            status = body.get("status", "in_progress")
            score = int(body.get("score", 0))

            if not lesson_id:
                return self.send_json(400, {"error": "Thiếu lessonId."})

            now = datetime.now().isoformat()
            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute("SELECT id, status, score FROM progress WHERE user_id = ? AND lesson_id = ?", (user["id"], lesson_id))
            prog = cursor.fetchone()
            if prog:
                cursor.execute("""
                    UPDATE progress
                    SET status = ?, code = ?, score = MAX(score, ?), updated_at = ?, completed_at = CASE WHEN ? = 'completed' AND completed_at IS NULL THEN ? ELSE completed_at END
                    WHERE user_id = ? AND lesson_id = ?
                """, (status, code, score, now, status, now, user["id"], lesson_id))
            else:
                cursor.execute("""
                    INSERT INTO progress (id, user_id, lesson_id, status, code, score, comprehension_level, completed_at, updated_at)
                    VALUES (?, ?, ?, ?, ?, ?, '', ?, ?)
                """, ("prog-" + str(datetime.now().timestamp()), user["id"], lesson_id, status, code, score, now if status == "completed" else None, now))

            conn.commit()
            conn.close()
            return self.send_json(200, {"message": "Đã lưu tiến độ thành công."})

        # 7. Reset User Progress (/api/progress/reset)
        if path == "/api/progress/reset":
            user = self.get_auth_user()
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập."})

            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("DELETE FROM progress WHERE user_id = ?", (user["id"],))
            conn.commit()
            conn.close()
            return self.send_json(200, {"message": "Đã đặt lại toàn bộ tiến độ học tập."})

        # 8. AI Mentor Ask (/api/ai/ask)
        if path == "/api/ai/ask":
            from backend.compiler import get_ai_mentor_reply
            message = body.get("message", "")
            code = body.get("code", "")
            lesson_id = body.get("lessonId", "")
            history = body.get("history", [])
            persona = body.get("persona", "tutor")

            # 1. User Context (Tên, tiến độ, điểm số, streak)
            user_context = None
            if user:
                try:
                    conn = get_connection()
                    cursor = conn.cursor()
                    cursor.execute("""
                        SELECT 
                            u.full_name, u.username, u.current_streak,
                            COUNT(CASE WHEN p.status = 'completed' THEN 1 END) as completed_lessons,
                            COALESCE(AVG(p.score), 0) as avg_score
                        FROM users u
                        LEFT JOIN progress p ON u.id = p.user_id
                        WHERE u.id = ?
                        GROUP BY u.id
                    """, (user["id"],))
                    u_row = cursor.fetchone()
                    if u_row:
                        user_context = dict(u_row)
                    conn.close()
                except Exception as ex:
                    print(f"[AI Ask] Lỗi lấy context người dùng: {ex}")

            # 2. Detailed Lesson Context (Nội dung lý thuyết, bài tập)
            lesson_info = None
            if lesson_id:
                try:
                    conn = get_connection()
                    cursor = conn.cursor()
                    cursor.execute("SELECT id, title, chapter, description, content, starter_code FROM lessons WHERE id = ?", (lesson_id,))
                    row = cursor.fetchone()
                    if row:
                        lesson_info = dict(row)
                        cursor.execute("SELECT id, title, description, expected_output, test_keywords FROM exercises WHERE lesson_id = ?", (lesson_id,))
                        lesson_info["exercises"] = [dict(ex) for ex in cursor.fetchall()]
                    conn.close()
                except Exception as ex:
                    print(f"[AI Ask] Lỗi truy vấn bài học: {ex}")

            try:
                ai_resp = get_ai_mentor_reply(
                    message, 
                    code=code, 
                    lesson_info=lesson_info, 
                    history=history,
                    persona=persona,
                    user_context=user_context
                )
            except Exception as ex:
                print(f"[AI Ask] Lỗi get_ai_mentor_reply: {ex}")
                ai_resp = {
                    "reply": "Xin lỗi, đã có gián đoạn xử lý tạm thời. Bạn hãy thử lại câu hỏi nhé!",
                    "provider": "builtin"
                }

            # 3. Lưu tin nhắn vào Database (Persistent Chat History)
            if user and user.get("id"):
                now_str = datetime.now().isoformat()
                try:
                    conn = get_connection()
                    cursor = conn.cursor()
                    # Tin nhắn người dùng
                    cursor.execute("""
                        INSERT INTO ai_chat_messages (id, user_id, role, content, persona, code_snippet, lesson_id, created_at)
                        VALUES (?, ?, 'user', ?, ?, ?, ?, ?)
                    """, (
                        str(uuid.uuid4()), user["id"], message, persona, code or '', lesson_id or '', now_str
                    ))
                    # Phản hồi của AI
                    cursor.execute("""
                        INSERT INTO ai_chat_messages (id, user_id, role, content, persona, code_snippet, lesson_id, created_at)
                        VALUES (?, ?, 'assistant', ?, ?, '', ?, ?)
                    """, (
                        str(uuid.uuid4()), user["id"], ai_resp.get("reply", ""), persona, lesson_id or '', datetime.now().isoformat()
                    ))
                    conn.commit()
                    conn.close()
                except Exception as ex:
                    print(f"[AI Chat log] Lỗi lưu tin nhắn chat: {ex}")

            return self.send_json(200, ai_resp)

        # 8b. Configure AI Key (/api/ai/config)
        if path == "/api/ai/config":
            gemini_key = body.get("geminiKey", "").strip()
            openai_key = body.get("openaiKey", "").strip()
            groq_key = body.get("groqKey", "").strip()
            cfg_path = os.path.join(os.path.dirname(__file__), "config.json")
            cfg = {}
            if os.path.exists(cfg_path):
                try:
                    with open(cfg_path, "r", encoding="utf-8") as f:
                        cfg = json.load(f)
                except Exception:
                    pass
            if gemini_key:
                cfg["GEMINI_API_KEY"] = gemini_key
            if openai_key:
                cfg["OPENAI_API_KEY"] = openai_key
            if groq_key:
                cfg["GROQ_API_KEY"] = groq_key
            with open(cfg_path, "w", encoding="utf-8") as f:
                json.dump(cfg, f, indent=2)
            return self.send_json(200, {"message": "Đã lưu cấu hình AI thành công."})

        # 8. Admin Create Lesson (/api/lessons)
        if path == "/api/lessons":
            user = self.get_auth_user()
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ Quản trị viên mới có quyền tạo bài học."})

            title = body.get("title", "").strip()
            chapter = body.get("chapter", "").strip()
            if not title:
                return self.send_json(400, {"error": "Tiêu đề bài học không được để trống."})

            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT MAX(order_num) as max_order FROM lessons")
            max_order = cursor.fetchone()["max_order"] or 0
            order_num = max_order + 1
            lid = f"lesson-{order_num:02d}"
            now = datetime.now().isoformat()

            cursor.execute("""
                INSERT INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (
                lid,
                title,
                chapter or "Chương mới",
                body.get("description", ""),
                body.get("level", "Cơ bản"),
                body.get("duration", "20 phút"),
                body.get("content", ""),
                body.get("example", ""),
                body.get("exerciseTitle", "Bài tập thực hành"),
                body.get("exerciseDescription", ""),
                body.get("starterCode", "#include <iostream>\nusing namespace std;\n\nint main() {\n    return 0;\n}"),
                order_num,
                now
            ))
            conn.commit()
            conn.close()
            return self.send_json(201, {"message": "Tạo bài học thành công!", "id": lid})

        # 9. Admin Database Backup (/api/admin/database/backup)
        if path == "/api/admin/database/backup":
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ dành cho Quản trị viên."})
            import backend.database_manager as dbm
            result = dbm.backup_database()
            return self.send_json(200, result)

        # 10. Admin Database Export (/api/admin/database/export)
        if path == "/api/admin/database/export":
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ dành cho Quản trị viên."})
            import backend.database_manager as dbm
            sql_p = dbm.export_sql()
            json_p = dbm.export_json()
            return self.send_json(200, {
                "message": "Xuất dữ liệu Database thành công!",
                "sql": os.path.basename(sql_p),
                "json": os.path.basename(json_p)
            })

        # 10b. Admin Sync Real Data from VNOI Wiki (/api/admin/sync-real-data)
        if path == "/api/admin/sync-real-data":
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ dành cho Quản trị viên."})
            try:
                from backend.real_data_sync import sync_real_data
                count = sync_real_data()
                return self.send_json(200, {
                    "success": True,
                    "count": count,
                    "message": f"Đã đồng bộ thành công {count} tài liệu C++ & Thuật toán chính thức từ VNOI Wiki."
                })
            except Exception as e:
                return self.send_json(500, {"error": f"Lỗi đồng bộ dữ liệu VNOI: {str(e)}"})

        # 11. Claim Certificate (/api/certificates/claim)
        if path == "/api/certificates/claim":
            if not user:
                return self.send_json(401, {"error": "Bạn cần đăng nhập để cấp chứng chỉ."})

            conn = get_connection()
            cursor = conn.cursor()

            # Check existing certificate
            cursor.execute("""
                SELECT c.cert_code, c.course_name, c.final_score, c.issued_at, c.verification_hash,
                       u.full_name, u.username
                FROM certificates c
                JOIN users u ON c.user_id = u.id
                WHERE c.user_id = ?
            """, (user["id"],))
            existing = cursor.fetchone()
            if existing:
                conn.close()
                return self.send_json(200, {
                    "claimed": True,
                    "isNew": False,
                    "certCode": existing["cert_code"],
                    "courseName": existing["course_name"],
                    "studentName": existing["full_name"] or existing["username"],
                    "finalScore": existing["final_score"],
                    "issuedAt": existing["issued_at"],
                    "verificationHash": existing["verification_hash"]
                })

            # Calculate user's average score across completed lessons
            cursor.execute("""
                SELECT COUNT(DISTINCT lesson_id) as comp_cnt, AVG(score) as avg_score
                FROM progress
                WHERE user_id = ? AND status = 'completed'
            """, (user["id"],))
            stats = cursor.fetchone()
            comp_cnt = stats["comp_cnt"] or 0
            avg_score = round(stats["avg_score"] or 90) if stats["avg_score"] is not None else 90

            # Check total lessons in curriculum
            cursor.execute("SELECT COUNT(*) as total_lessons FROM lessons")
            total_row = cursor.fetchone()
            total_lessons = total_row["total_lessons"] if total_row and total_row["total_lessons"] > 0 else 20

            # Require completing all lessons (unless admin preview)
            if comp_cnt < total_lessons and user.get("role") != "admin":
                conn.close()
                return self.send_json(403, {
                    "error": f"Bạn cần hoàn thành tất cả {total_lessons} bài học để được cấp Giấy Chứng Nhận Tốt Nghiệp C++ Master. (Hiện tại: {comp_cnt}/{total_lessons} bài)",
                    "completed": comp_cnt,
                    "total": total_lessons,
                    "unlocked": False
                })

            # Generate unique cert code and sha256 hash
            cert_uuid = str(uuid.uuid4()).replace("-", "").upper()[:6]
            cert_code = f"CERT-CPP-2026-{cert_uuid}"
            now = datetime.now().isoformat()
            verify_payload = f"{user['id']}:{cert_code}:{now}"
            verification_hash = hashlib.sha256(verify_payload.encode("utf-8")).hexdigest()

            course_name = body.get("courseName", "Khóa học Lập trình C++ Toàn diện")

            cursor.execute("""
                INSERT INTO certificates (id, cert_code, user_id, course_name, final_score, issued_at, verification_hash)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            """, (
                str(uuid.uuid4()),
                cert_code,
                user["id"],
                course_name,
                avg_score,
                now,
                verification_hash
            ))

            # Activity log
            cursor.execute("""
                INSERT INTO activity_logs (id, user_id, action, ip_address, details, created_at)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (
                str(uuid.uuid4()),
                user["id"],
                "claim_certificate",
                client_ip,
                f"CertCode: {cert_code}, Score: {avg_score}",
                now
            ))

            conn.commit()
            conn.close()

            return self.send_json(201, {
                "claimed": True,
                "isNew": True,
                "certCode": cert_code,
                "courseName": course_name,
                "studentName": user.get("fullName") or user.get("username"),
                "finalScore": avg_score,
                "issuedAt": now,
                "verificationHash": verification_hash
            })

        # 12. Add Lesson Comment (/api/lessons/{id}/comments)
        if path.startswith("/api/lessons/") and path.endswith("/comments"):
            if not user:
                return self.send_json(401, {"error": "Bạn cần đăng nhập để gửi bình luận thảo luận."})

            lid = path.split("/")[3]
            content = body.get("content", "").strip()
            parent_id = body.get("parentId") or None

            if not content or len(content) < 2:
                return self.send_json(400, {"error": "Nội dung bình luận quá ngắn (tối thiểu 2 ký tự)."})

            now = datetime.now().isoformat()
            cid = "cmt-" + str(uuid.uuid4())[:8]

            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO comments (id, lesson_id, user_id, parent_id, content, created_at)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (cid, lid, user["id"], parent_id, content, now))

            cursor.execute("""
                INSERT INTO activity_logs (id, user_id, action, ip_address, details, created_at)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (
                str(uuid.uuid4()),
                user["id"],
                "post_comment",
                client_ip,
                f"Lesson: {lid}, CommentId: {cid}",
                now
            ))

            conn.commit()
            conn.close()

            return self.send_json(201, {
                "message": "Đã gửi bình luận thành công!",
                "comment": {
                    "id": cid,
                    "lesson_id": lid,
                    "user_id": user["id"],
                    "parent_id": parent_id,
                    "content": content,
                    "created_at": now,
                    "username": user["username"],
                    "full_name": user.get("fullName") or user["username"],
                    "avatar": user.get("avatar") or "",
                    "role": user.get("role", "student")
                }
            })

        return self.send_json(404, {"error": "Endpoint POST không tồn tại."})

    # ---------------------------------------------------------
    # Routing: PUT
    # ---------------------------------------------------------
    def do_PUT(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path
        body = self.read_json_body()
        user = self.get_auth_user()

        if body is None:
            return self.send_json(413, {"error": "Dung lượng dữ liệu gửi lên vượt quá giới hạn cho phép (10MB)."})

        # 1. Update Profile (/api/user/profile)
        if path == "/api/user/profile":
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập."})

            username = body.get("username", user.get("username", "")).strip()
            full_name = body.get("fullName", user.get("fullName", "")).strip() or username
            email = body.get("email", user.get("email", "")).strip().lower()
            avatar = body.get("avatar", user.get("avatar", ""))
            password = body.get("password")

            if avatar and len(avatar) > 5 * 1024 * 1024:
                return self.send_json(400, {"error": "Dung lượng ảnh đại diện vượt quá giới hạn 5MB."})

            conn = get_connection()
            cursor = conn.cursor()
            # Check duplicate email
            if email:
                cursor.execute("SELECT id FROM users WHERE email = ? AND id != ?", (email, user["id"]))
                if cursor.fetchone():
                    conn.close()
                    return self.send_json(400, {"error": "Email này đã được sử dụng bởi tài khoản khác."})

            # Check duplicate username
            if username:
                cursor.execute("SELECT id FROM users WHERE username = ? AND id != ?", (username, user["id"]))
                if cursor.fetchone():
                    conn.close()
                    return self.send_json(400, {"error": "Tên người dùng này đã có người sử dụng."})

            now = datetime.now().isoformat()
            if password and len(password) >= 6:
                pwd_hash = hash_password(password)
                cursor.execute("""
                    UPDATE users
                    SET username = ?, full_name = ?, email = ?, avatar = ?, password_hash = ?, updated_at = ?
                    WHERE id = ?
                """, (username, full_name, email, avatar, pwd_hash, now, user["id"]))
            else:
                cursor.execute("""
                    UPDATE users
                    SET username = ?, full_name = ?, email = ?, avatar = ?, updated_at = ?
                    WHERE id = ?
                """, (username, full_name, email, avatar, now, user["id"]))
            conn.commit()
            conn.close()

            user["username"] = username
            user["fullName"] = full_name
            user["email"] = email
            user["avatar"] = avatar
            return self.send_json(200, {"message": "Cập nhật hồ sơ thành công!", "user": user})

        # 2. Change Password (/api/user/password)
        if path == "/api/user/password":
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập."})

            old_pass = body.get("oldPassword", "")
            new_pass = body.get("newPassword", "")
            if len(new_pass) < 6:
                return self.send_json(400, {"error": "Mật khẩu mới phải có ít nhất 6 ký tự."})

            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT password_hash FROM users WHERE id = ?", (user["id"],))
            db_user = cursor.fetchone()

            if not verify_password(old_pass, db_user["password_hash"]):
                conn.close()
                return self.send_json(400, {"error": "Mật khẩu hiện tại không chính xác."})

            cursor.execute("UPDATE users SET password_hash = ?, updated_at = ? WHERE id = ?", (hash_password(new_pass), datetime.now().isoformat(), user["id"]))
            conn.commit()
            conn.close()
            return self.send_json(200, {"message": "Đổi mật khẩu thành công!"})

        # 3. Admin Update Lesson (/api/lessons/<id>)
        if path.startswith("/api/lessons/"):
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ Quản trị viên mới có quyền cập nhật."})

            lid = path[len("/api/lessons/"):].strip()
            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute("""
                UPDATE lessons
                SET title = COALESCE(?, title),
                    chapter = COALESCE(?, chapter),
                    description = COALESCE(?, description),
                    level = COALESCE(?, level),
                    duration = COALESCE(?, duration),
                    content = COALESCE(?, content),
                    example = COALESCE(?, example),
                    exercise_title = COALESCE(?, exercise_title),
                    exercise_description = COALESCE(?, exercise_description),
                    starter_code = COALESCE(?, starter_code)
                WHERE id = ?
            """, (
                body.get("title"),
                body.get("chapter"),
                body.get("description"),
                body.get("level"),
                body.get("duration"),
                body.get("content"),
                body.get("example"),
                body.get("exerciseTitle"),
                body.get("exerciseDescription"),
                body.get("starterCode"),
                lid
            ))
            conn.commit()
            conn.close()
            return self.send_json(200, {"message": "Cập nhật bài học thành công!"})

        return self.send_json(404, {"error": "Endpoint PUT không tồn tại."})

    # ---------------------------------------------------------
    # Routing: DELETE
    # ---------------------------------------------------------
    def do_DELETE(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path
        user = self.get_auth_user()

        # Clear AI Chat History (/api/ai/history)
        if path == "/api/ai/history":
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập."})
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("DELETE FROM ai_chat_messages WHERE user_id = ?", (user["id"],))
            conn.commit()
            conn.close()
            return self.send_json(200, {"message": "Đã xóa toàn bộ lịch sử trò chuyện AI."})

        # Admin delete lesson (/api/lessons/<id>)
        if path.startswith("/api/lessons/"):
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ Quản trị viên mới có quyền xóa bài học."})

            lid = path[len("/api/lessons/"):].strip()
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("DELETE FROM lessons WHERE id = ?", (lid,))
            conn.commit()
            conn.close()
            return self.send_json(200, {"message": "Đã xóa bài học thành công."})

        # Admin delete user (/api/admin/users/<id>)
        if path.startswith("/api/admin/users/"):
            if not user or user["role"] != "admin":
                return self.send_json(403, {"error": "Chỉ Quản trị viên mới có quyền xóa người dùng."})

            uid = path[len("/api/admin/users/"):].strip()
            if uid == user["id"]:
                return self.send_json(400, {"error": "Không thể xóa chính tài khoản của bạn."})

            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("DELETE FROM users WHERE id = ?", (uid,))
            conn.commit()
            conn.close()
            return self.send_json(200, {"message": "Đã xóa người dùng thành công."})

        return self.send_json(404, {"error": "Endpoint DELETE không tồn tại."})

def run_server():
    """Initializes DB and runs the HTTP server."""
    init_db()
    server_address = ("", PORT)
    httpd = ThreadingHTTPServer(server_address, CodeLearnHandler)
    compiler_ver = get_compiler_version()

    print("=" * 60)
    print(">> CODELEARN C++ BACKEND SERVER IS RUNNING!")
    print("=" * 60)
    print(f"[*] Web & REST API:   http://localhost:{PORT}")
    print(f"[*] Serving Files:    {BASE_DIR}")
    print(f"[*] SQLite Database:  {os.path.join(BASE_DIR, 'backend', 'database.db')}")
    print(f"[*] C++ Compiler:     {compiler_ver}")
    print("=" * 60)
    print("Nhan Ctrl + C de dung may chu.\n")

    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n>> May chu da dung an toan.")
        httpd.server_close()

if __name__ == "__main__":
    run_server()
