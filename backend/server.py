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
from datetime import datetime

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
from backend.compiler import compile_and_run, evaluate_exercise, get_compiler_version

PORT = int(os.environ.get("PORT", 5000))

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

    def read_json_body(self) -> dict:
        """Parses JSON request body safely."""
        content_length = int(self.headers.get("Content-Length", 0))
        if content_length <= 0:
            return {}
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

        # 2. Current user (/api/auth/me)
        if path == "/api/auth/me":
            if not user:
                return self.send_json(401, {"error": "Chưa đăng nhập hoặc phiên làm việc đã hết hạn."})
            return self.send_json(200, {"user": user})

        # 3. All lessons (/api/lessons)
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

        # 4. Single lesson (/api/lessons/<id>)
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

        return self.send_json(404, {"error": "Endpoint không tồn tại."})

    # ---------------------------------------------------------
    # Routing: POST
    # ---------------------------------------------------------
    def do_POST(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path
        body = self.read_json_body()
        user = self.get_auth_user()

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

            # If not provided, fetch from database exercises
            if not expected_output and lesson_id and exercise_id:
                cursor.execute("SELECT expected_output, test_keywords FROM exercises WHERE lesson_id = ? AND id = ?", (lesson_id, exercise_id))
                ex_row = cursor.fetchone()
                if ex_row:
                    expected_output = ex_row["expected_output"]
                    test_keywords = json.loads(ex_row["test_keywords"] or "[]")

            eval_res = evaluate_exercise(code, expected_output, test_keywords, stdin_input=stdin_val)

            # Record submission in database
            now = datetime.now().isoformat()
            sub_id = "sub-" + str(datetime.now().timestamp())
            cursor.execute("""
                INSERT INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (
                sub_id,
                user_id or "guest",
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

            # If passed and user is logged in, update progress
            if user_id and lesson_id:
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
                    """, ("prog-" + str(datetime.now().timestamp()), user_id, lesson_id, new_status, code, new_score, eval_res["comprehensionLevel"], now if new_status == "completed" else None, now))

            conn.commit()
            conn.close()
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

            lesson_info = None
            if lesson_id:
                conn = get_connection()
                cursor = conn.cursor()
                cursor.execute("SELECT id, title, chapter FROM lessons WHERE id = ?", (lesson_id,))
                row = cursor.fetchone()
                if row:
                    lesson_info = dict(row)
                conn.close()

            ai_resp = get_ai_mentor_reply(message, code=code, lesson_info=lesson_info)
            return self.send_json(200, ai_resp)

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

        return self.send_json(404, {"error": "Endpoint POST không tồn tại."})

    # ---------------------------------------------------------
    # Routing: PUT
    # ---------------------------------------------------------
    def do_PUT(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path
        body = self.read_json_body()
        user = self.get_auth_user()

        # 1. Update Profile (/api/user/profile)
        if path == "/api/user/profile":
            if not user:
                return self.send_json(401, {"error": "Cần đăng nhập."})

            username = body.get("username", user.get("username", "")).strip()
            full_name = body.get("fullName", user.get("fullName", "")).strip() or username
            email = body.get("email", user.get("email", "")).strip().lower()
            avatar = body.get("avatar", user.get("avatar", ""))
            password = body.get("password")

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
