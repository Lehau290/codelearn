"""
CodeLearn C++ - SQLite Database & Models
File: backend/database.py
"""
import os
import sys
import sqlite3
import hashlib
import json
import uuid
import re
from datetime import datetime, timedelta

if hasattr(sys.stdout, "reconfigure"):
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
        sys.stderr.reconfigure(encoding="utf-8", errors="replace")
    except Exception:
        pass

DB_PATH = os.path.join(os.path.dirname(__file__), "database.db")
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

def get_connection():
    """Returns a SQLite connection with dict row factory, WAL mode and concurrency timeout."""
    conn = sqlite3.connect(DB_PATH, timeout=10.0)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON")
    conn.execute("PRAGMA journal_mode = WAL")
    conn.execute("PRAGMA busy_timeout = 5000")
    conn.execute("PRAGMA synchronous = NORMAL")
    return conn

def hash_password(password: str) -> str:
    """Secure SHA-256 hash with salt for local backend."""
    salt = "codelearn_cpp_salt_2026"
    return hashlib.sha256((salt + password).encode('utf-8')).hexdigest()

def verify_password(plain_password: str, hashed_password: str) -> bool:
    """Verifies plain password against stored hash."""
    return hash_password(plain_password) == hashed_password

def init_db():
    """Initializes tables and seeds default data if empty."""
    conn = get_connection()
    cursor = conn.cursor()

    cursor.executescript("""
    CREATE TABLE IF NOT EXISTS users (
        id TEXT PRIMARY KEY,
        username TEXT UNIQUE NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password_hash TEXT NOT NULL,
        full_name TEXT NOT NULL,
        role TEXT NOT NULL DEFAULT 'student',
        avatar TEXT DEFAULT '',
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS sessions (
        token TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        created_at TEXT NOT NULL,
        expires_at TEXT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS lessons (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        chapter TEXT NOT NULL,
        description TEXT NOT NULL,
        level TEXT NOT NULL,
        duration TEXT NOT NULL,
        content TEXT NOT NULL,
        example TEXT NOT NULL,
        exercise_title TEXT NOT NULL,
        exercise_description TEXT NOT NULL,
        starter_code TEXT NOT NULL,
        order_num INTEGER NOT NULL,
        created_at TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS exercises (
        id TEXT NOT NULL,
        lesson_id TEXT NOT NULL,
        title TEXT NOT NULL,
        level TEXT NOT NULL,
        difficulty TEXT NOT NULL,
        points INTEGER NOT NULL DEFAULT 100,
        description TEXT NOT NULL,
        starter_code TEXT NOT NULL,
        expected_output TEXT DEFAULT '',
        hint TEXT DEFAULT '',
        test_keywords TEXT DEFAULT '[]',
        order_num INTEGER NOT NULL,
        PRIMARY KEY (lesson_id, id),
        FOREIGN KEY(lesson_id) REFERENCES lessons(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS progress (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        lesson_id TEXT NOT NULL,
        status TEXT NOT NULL DEFAULT 'not_started',
        code TEXT DEFAULT '',
        score INTEGER DEFAULT 0,
        comprehension_level TEXT DEFAULT '',
        completed_at TEXT,
        updated_at TEXT NOT NULL,
        UNIQUE(user_id, lesson_id),
        FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
        FOREIGN KEY(lesson_id) REFERENCES lessons(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS submissions (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        lesson_id TEXT NOT NULL,
        exercise_id TEXT NOT NULL,
        code TEXT NOT NULL,
        output TEXT DEFAULT '',
        passed INTEGER DEFAULT 0,
        score INTEGER DEFAULT 0,
        execution_time_ms REAL DEFAULT 0,
        ai_feedback TEXT DEFAULT '',
        submitted_at TEXT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS settings (
        key TEXT PRIMARY KEY,
        value TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS certificates (
        id                TEXT PRIMARY KEY,
        cert_code         TEXT UNIQUE NOT NULL,
        user_id           TEXT NOT NULL,
        course_name       TEXT NOT NULL DEFAULT 'C++ Basic Programming',
        final_score       INTEGER NOT NULL,
        issued_at         TEXT NOT NULL,
        verification_hash TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS test_cases (
        id              TEXT PRIMARY KEY,
        lesson_id       TEXT NOT NULL,
        exercise_id     TEXT NOT NULL,
        input_data      TEXT DEFAULT '',
        expected_output TEXT NOT NULL,
        is_hidden       INTEGER DEFAULT 0,
        weight_points   INTEGER DEFAULT 30,
        order_num       INTEGER NOT NULL DEFAULT 1,
        FOREIGN KEY (lesson_id, exercise_id) REFERENCES exercises(lesson_id, id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS achievements (
        id          TEXT PRIMARY KEY,
        code        TEXT UNIQUE NOT NULL,
        title       TEXT NOT NULL,
        description TEXT NOT NULL,
        points      INTEGER DEFAULT 50,
        order_num   INTEGER NOT NULL DEFAULT 1
    );

    CREATE TABLE IF NOT EXISTS user_achievements (
        user_id        TEXT NOT NULL,
        achievement_id TEXT NOT NULL,
        unlocked_at    TEXT NOT NULL,
        PRIMARY KEY (user_id, achievement_id),
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
        FOREIGN KEY (achievement_id) REFERENCES achievements(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS comments (
        id          TEXT PRIMARY KEY,
        lesson_id   TEXT NOT NULL,
        user_id     TEXT NOT NULL,
        parent_id   TEXT,
        content     TEXT NOT NULL,
        created_at  TEXT NOT NULL,
        FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS activity_logs (
        id          TEXT PRIMARY KEY,
        user_id     TEXT,
        action      TEXT NOT NULL,
        ip_address  TEXT DEFAULT '',
        details     TEXT DEFAULT '',
        created_at  TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS ai_chat_messages (
        id            TEXT PRIMARY KEY,
        user_id       TEXT NOT NULL,
        role          TEXT NOT NULL,
        content       TEXT NOT NULL,
        persona       TEXT DEFAULT 'tutor',
        code_snippet  TEXT DEFAULT '',
        lesson_id     TEXT DEFAULT '',
        created_at    TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS vnoi_real_knowledge (
        id          TEXT PRIMARY KEY,
        title       TEXT NOT NULL,
        category    TEXT NOT NULL,
        author      TEXT DEFAULT '',
        source_url  TEXT DEFAULT '',
        keywords    TEXT NOT NULL,
        summary     TEXT NOT NULL,
        content     TEXT NOT NULL,
        code_sample TEXT DEFAULT '',
        updated_at  TEXT NOT NULL
    );
    """)
    conn.commit()

    # Seed users if not exist
    cursor.execute("SELECT COUNT(*) as count FROM users")
    if cursor.fetchone()["count"] == 0:
        now = datetime.now().isoformat()
        admin_pass = hash_password("123456")
        cursor.execute("""
            INSERT INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, ("user-admin", "admin", "admin@codelearn.vn", admin_pass, "Quản Trị Viên", "admin", "", now, now))

        student_pass = hash_password("123456")
        cursor.execute("""
            INSERT INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, ("user-student", "letrunghau", "letrunghau@codelearn.vn", student_pass, "Lê Trung Hậu", "student", "", now, now))
        conn.commit()

    # Seed lessons and exercises if not exist or if content was upgraded with real-world examples
    cursor.execute("SELECT COUNT(*) as count FROM lessons")
    lesson_count = cursor.fetchone()["count"]
    cursor.execute("SELECT content FROM lessons WHERE id = 'lesson-01'")
    row_01 = cursor.fetchone()
    needs_reseed = (lesson_count == 0) or (not row_01) or ("real-world-box" not in (row_01["content"] or ""))
    if needs_reseed:
        seed_lessons_and_exercises(conn)

    # Seed remaining tables if empty
    seed_settings(conn)
    seed_achievements(conn)
    seed_test_cases(conn)
    seed_comments(conn)
    seed_ai_chat_messages(conn)

    conn.close()

def seed_lessons_and_exercises(conn):
    """Extracts lessons from js/storage.js and js/exercises-data.js and inserts them into SQLite."""
    cursor = conn.cursor()
    storage_path = os.path.join(BASE_DIR, "js", "storage.js")
    exercises_path = os.path.join(BASE_DIR, "js", "exercises-data.js")

    if not os.path.exists(storage_path):
        return

    with open(storage_path, "r", encoding="utf-8") as f:
        storage_code = f.read()

    lesson_chunks = re.split(r'\{\s*id:\s*"lesson-', storage_code)
    now = datetime.now().isoformat()

    for i, chunk in enumerate(lesson_chunks[1:21]):
        full_chunk = 'id: "lesson-' + chunk
        try:
            lid = re.search(r'id:\s*"(lesson-\d+)"', full_chunk).group(1)
            title = re.search(r'title:\s*"([^"]+)"', full_chunk).group(1)
            chapter = re.search(r'chapter:\s*"([^"]+)"', full_chunk).group(1)
            description = re.search(r'description:\s*"([^"]+)"', full_chunk).group(1)
            level = re.search(r'level:\s*"([^"]+)"', full_chunk).group(1)
            duration = re.search(r'duration:\s*"([^"]+)"', full_chunk).group(1)
            content = re.search(r'content:\s*`([^`]+)`', full_chunk, re.DOTALL).group(1).strip()
            example = re.search(r'example:\s*`([^`]+)`', full_chunk, re.DOTALL).group(1).strip()
            exercise_title = re.search(r'exerciseTitle:\s*"([^"]+)"', full_chunk).group(1)
            exercise_desc = re.search(r'exerciseDescription:\s*"([^"]+)"', full_chunk).group(1)
            starter_code = re.search(r'starterCode:\s*`([^`]+)`', full_chunk, re.DOTALL).group(1).strip()
            order_m = re.search(r'order:\s*(\d+)', full_chunk)
            order_num = int(order_m.group(1)) if order_m else (i + 1)

            cursor.execute("""
                INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (lid, title, chapter, description, level, duration, content, example, exercise_title, exercise_desc, starter_code, order_num, now))
        except Exception as e:
            print(f"Error seeding lesson {i}: {e}")

    conn.commit()

    # Seed exercises
    if os.path.exists(exercises_path):
        with open(exercises_path, "r", encoding="utf-8") as f:
            exercises_code = f.read()

        lesson_matches = list(re.finditer(r'"(lesson-\d+)":\s*\[', exercises_code))
        for idx, m in enumerate(lesson_matches):
            lid = m.group(1)
            start_pos = m.end()
            if idx + 1 < len(lesson_matches):
                end_pos = lesson_matches[idx + 1].start()
            else:
                end_m = re.search(r'\n\s*\]', exercises_code[start_pos:])
                end_pos = start_pos + end_m.start() if end_m else len(exercises_code)

            block = exercises_code[start_pos:end_pos]

            ex_splits = re.split(r'\{\s*id:\s*"ex-', block)
            for k, echunk in enumerate(ex_splits[1:]):
                full_chunk = 'id: "ex-' + echunk
                try:
                    eid_m = re.search(r'id:\s*"([^"]+)"', full_chunk)
                    if not eid_m:
                        continue
                    eid = eid_m.group(1)
                    etitle = re.search(r'title:\s*"([^"]+)"', full_chunk).group(1)
                    elevel = re.search(r'level:\s*"([^"]+)"', full_chunk).group(1)
                    ediff = re.search(r'difficulty:\s*"([^"]+)"', full_chunk).group(1)
                    epoints_m = re.search(r'points:\s*(\d+)', full_chunk)
                    epoints = int(epoints_m.group(1)) if epoints_m else 100
                    edesc_m = re.search(r'description:\s*"([^"]+)"', full_chunk)
                    edesc = edesc_m.group(1) if edesc_m else ""
                    estarter_m = re.search(r'starterCode:\s*`([^`]+)`', full_chunk, re.DOTALL)
                    estarter = estarter_m.group(1).strip() if estarter_m else ""
                    eexp_m = re.search(r'expectedOutput:\s*"([^"]*)"', full_chunk)
                    eexpected = eexp_m.group(1).replace('\\n', '\n') if eexp_m else ""
                    ehint_m = re.search(r'hint:\s*"([^"]*)"', full_chunk)
                    ehint = ehint_m.group(1) if ehint_m else ""
                    ekw_m = re.search(r'testKeywords:\s*\[(.*?)\]', full_chunk, re.DOTALL)
                    keywords = []
                    if ekw_m:
                        keywords = [kw.strip().strip('"').strip("'") for kw in ekw_m.group(1).split(",") if kw.strip()]

                    cursor.execute("""
                        INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                    """, (eid, lid, etitle, elevel, ediff, epoints, edesc, estarter, eexpected, ehint, json.dumps(keywords, ensure_ascii=False), k + 1))
                except Exception as e:
                    print(f"Error seeding exercise {lid}: {e}")

        # Cho các bài học 11 đến 20 chưa có trong kho cố định, tạo 3 bài tập phù hợp
        cursor.execute("SELECT id, title, exercise_title, exercise_description, starter_code FROM lessons WHERE id NOT IN (SELECT DISTINCT lesson_id FROM exercises)")
        remaining_lessons = cursor.fetchall()
        for rless in remaining_lessons:
            lid = rless["id"]
            btitle = rless["exercise_title"] or rless["title"]
            bdesc = rless["exercise_description"] or "Thực hành các kiến thức C++ vừa học."
            bcode = rless["starter_code"] or "#include <iostream>\nusing namespace std;\n\nint main() {\n    return 0;\n}"
            
            ex_items = [
                ("ex-1", f"{btitle} (Cơ bản)", "Cơ bản", "easy", 100, f"{bdesc} Hãy áp dụng các câu lệnh nền tảng của bài học này.", bcode, "Thanh cong", "Áp dụng cú pháp lý thuyết đã học ở phần trên.", ["cout", "main", "return 0"], 1),
                ("ex-2", f"Vận dụng logic: {rless['title']}", "Vận dụng", "medium", 100, f"Áp dụng kiến thức bài {rless['title']} để giải quyết bài toán tính toán thực tế.", bcode, "Ket qua dung", "Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.", ["cin", "cout", "main"], 2),
                ("ex-3", f"Thử thách mở rộng: {rless['title']}", "Thử thách", "hard", 100, f"Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề {rless['title']}.", bcode, "Chinh xac", "Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.", ["main", "return"], 3)
            ]
            for eid, etitle, elevel, ediff, epoints, edesc, estarter, eexp, ehint, ekw, order_n in ex_items:
                cursor.execute("""
                    INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """, (eid, lid, etitle, elevel, ediff, epoints, edesc, estarter, eexp, ehint, json.dumps(ekw, ensure_ascii=False), order_n))

        conn.commit()
    print("Database seeding completed successfully!")

def seed_settings(conn):
    """Nạp cấu hình mặc định cho bảng settings nếu chưa có."""
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) as count FROM settings")
    if cursor.fetchone()["count"] > 0:
        return

    settings_data = [
        ("site_name", "CodeLearn C++ Academy"),
        ("site_tagline", "Nền tảng Học Lập Trình C++ Chuẩn Đại Học & Olympic Tin Học"),
        ("site_version", "2.5.0"),
        ("compiler_default", "g++ 13.2.0 (C++17 / C++20)"),
        ("compiler_timeout_sec", "5"),
        ("max_execution_time_ms", "2000"),
        ("pass_score_percentage", "70"),
        ("maintenance_mode", "false"),
        ("ai_mentor_model", "CodeLearn C++ Neural Tutor (VNOI Enhanced)"),
        ("allow_guest_compilation", "true"),
        ("certificate_min_score", "80")
    ]
    cursor.executemany("INSERT OR REPLACE INTO settings (key, value) VALUES (?, ?)", settings_data)
    conn.commit()
    print("✓ Đã nạp cấu hình hệ thống bảng settings thành công.")

def seed_achievements(conn):
    """Nạp danh hiệu thành tựu nếu bảng rỗng."""
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) as count FROM achievements")
    if cursor.fetchone()["count"] > 0:
        return

    sample_achievements = [
        ("ach-1", "first_lesson", "Bắt đầu hành trình", "Hoàn thành bài học C++ đầu tiên.", 50, 1),
        ("ach-2", "three_lessons", "Tăng tốc kiến thức", "Hoàn thành 3 bài học C++.", 100, 2),
        ("ach-3", "five_lessons", "Chăm chỉ rèn luyện", "Hoàn thành 5 bài học C++.", 150, 3),
        ("ach-4", "high_score", "Thiện xạ C++", "Đạt từ 90 điểm trở lên trong một bài tập.", 100, 4),
        ("ach-5", "half_way", "Vượt qua nửa chặng", "Hoàn thành ít nhất 10 bài học C++.", 200, 5),
        ("ach-6", "master", "C++ Master Tinh anh", "Hoàn thành xuất sắc toàn bộ khóa học C++.", 500, 6)
    ]
    cursor.executemany("""
        INSERT OR REPLACE INTO achievements (id, code, title, description, points, order_num)
        VALUES (?, ?, ?, ?, ?, ?)
    """, sample_achievements)
    conn.commit()
    print("✓ Đã nạp danh hiệu bảng achievements thành công.")

def seed_test_cases(conn):
    """Nạp test cases (công khai và ẩn) cho toàn bộ 60 bài tập vào bảng test_cases."""
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) as count FROM test_cases")
    if cursor.fetchone()["count"] > 0:
        return

    cursor.execute("SELECT lesson_id, id, expected_output, points FROM exercises ORDER BY lesson_id, order_num")
    exercises = cursor.fetchall()

    tc_records = []
    for ex in exercises:
        lid = ex["lesson_id"]
        eid = ex["id"]
        expected = ex["expected_output"] or ""

        # Test case 1: Công khai (is_hidden = 0, weight_points = 50, order_num = 1)
        tc_records.append((
            f"tc-{lid}-{eid}-1",
            lid,
            eid,
            "",
            expected,
            0,
            50,
            1
        ))

        # Test case 2: Ẩn kiểm thử đối chiếu (is_hidden = 1, weight_points = 50, order_num = 2)
        tc_records.append((
            f"tc-{lid}-{eid}-2",
            lid,
            eid,
            "",
            expected,
            1,
            50,
            2
        ))

    cursor.executemany("""
        INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """, tc_records)
    conn.commit()
    print(f"✓ Đã nạp {len(tc_records)} test cases vào bảng test_cases thành công.")

def seed_comments(conn):
    """Nạp bình luận thảo luận bài học mẫu vào bảng comments."""
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) as count FROM comments")
    if cursor.fetchone()["count"] > 0:
        return

    sample_comments = [
        ("cm-01", "lesson-01", "user-student", None, "Cho em hỏi tại sao trong C++ luôn phải có hàm main() và return 0 ở cuối ạ?", "2026-03-01T08:30:00"),
        ("cm-02", "lesson-01", "user-admin", "cm-01", "Chào Trung Hậu! Hàm main() là điểm khởi đầu (entry point) của mọi chương trình C/C++. Lệnh return 0 báo cho hệ điều hành biết chương trình kết thúc trọn vẹn và an toàn nhé!", "2026-03-01T08:45:00"),
        ("cm-03", "lesson-03", "user-student", None, "Lúc em dùng `cin >> n` rồi dùng `getline(cin, s)` thì bị trôi dòng không nhập được chuỗi, khắc phục thế nào ạ?", "2026-03-02T10:15:00"),
        ("cm-04", "lesson-03", "user-admin", "cm-03", "Lỗi kinh điển do ký tự Enter (`\\n`) còn sót lại trong bộ đệm cin! Em chỉ cần thêm `cin.ignore();` ngay sau lệnh `cin >> n;` là xử lý xong ngay nhé.", "2026-03-02T10:20:00"),
        ("cm-05", "lesson-07", "user-student", None, "Con trỏ (Pointer) và tham chiếu (Reference) khác nhau lớn nhất ở điểm nào khi truyền tham số vào hàm ạ?", "2026-03-03T14:00:00"),
        ("cm-06", "lesson-07", "user-admin", "cm-05", "Tham chiếu `int &x` bản chất là một bí danh an toàn, không thể NULL và không cần dùng toán tử `*`. Khi chỉ cần sửa trực tiếp giá trị biến thì nên ưu tiên dùng reference theo chuẩn C++ hiện đại nhé!", "2026-03-03T14:15:00"),
        ("cm-07", "lesson-10", "user-student", None, "Trong C++, Struct và Class khác nhau cơ bản nhất là gì vậy thầy?", "2026-03-04T09:00:00"),
        ("cm-08", "lesson-10", "user-admin", "cm-07", "Điểm khác biệt duy nhất là phạm vi truy cập mặc định: các thuộc tính của Struct mặc định là `public`, còn của Class mặc định là `private`.", "2026-03-04T09:10:00"),
        ("cm-09", "lesson-16", "user-student", None, "Khi sắp xếp bằng `std::sort`, làm sao để viết hàm so sánh (Comparator) giảm dần gọn nhất ạ?", "2026-03-05T16:20:00"),
        ("cm-10", "lesson-16", "user-admin", "cm-09", "Em có thể dùng Lambda biểu thức hiện đại: `sort(a.begin(), a.end(), [](int x, int y){ return x > y; });` hoặc dùng `greater<int>()` trong `<functional>` nhé!", "2026-03-05T16:30:00")
    ]
    cursor.executemany("""
        INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at)
        VALUES (?, ?, ?, ?, ?, ?)
    """, sample_comments)
    conn.commit()
    print(f"✓ Đã nạp {len(sample_comments)} bình luận vào bảng comments thành công.")

def seed_ai_chat_messages(conn):
    """Nạp hội thoại lịch sử tư vấn AI mẫu vào bảng ai_chat_messages."""
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) as count FROM ai_chat_messages")
    if cursor.fetchone()["count"] > 0:
        return

    sample_chats = [
        (
            "msg-01",
            "user-student",
            "user",
            "Chào AI Mentor, em là học viên mới bắt đầu học C++. Em nên đi theo lộ trình như thế nào để vững nền tảng nhất?",
            "tutor",
            "",
            "lesson-01",
            "2026-03-01T08:00:00"
        ),
        (
            "msg-02",
            "user-student",
            "assistant",
            "Chào Trung Hậu! Rất vui được đồng hành cùng bạn trên chặng đường chinh phục C++. Lộ trình tối ưu tại CodeLearn C++ Academy gồm 4 chặng:\n1. Nền tảng cú pháp và luồng điều khiển (Bài 1-6)\n2. Mảng, Con trỏ và Chuỗi ký tự (Bài 7-10)\n3. Cấu trúc dữ liệu và Hàm đệ quy (Bài 11-15)\n4. Thư viện STL và Lập trình hướng đối tượng OOP (Bài 16-20).\nHãy bắt đầu thực hành ngay từ Bài 1 và làm trọn vẹn 3 bài tập mỗi chuyên đề nhé!",
            "tutor",
            "",
            "lesson-01",
            "2026-03-01T08:00:05"
        ),
        (
            "msg-03",
            "user-student",
            "user",
            "Cho em xin ví dụ về cách viết hàm hoán vị (swap) 2 số bằng con trỏ và tham chiếu trong C++ được không ạ?",
            "tutor",
            "",
            "lesson-07",
            "2026-03-03T14:05:00"
        ),
        (
            "msg-04",
            "user-student",
            "assistant",
            "Tuyệt vời! Dưới đây là 2 cách triển khai kinh điển trong C++:\n\n1. Dùng con trỏ (Pointer):\n```cpp\nvoid swapPointer(int* a, int* b) {\n    int temp = *a;\n    *a = *b;\n    *b = temp;\n}\n```\n\n2. Dùng tham chiếu (Reference - Chuẩn C++ hiện đại):\n```cpp\nvoid swapRef(int& a, int& b) {\n    int temp = a;\n    a = b;\n    b = temp;\n}\n```\nCách dùng tham chiếu được khuyến khích vì cú pháp trong sáng và an toàn, không lo lỗi con trỏ NULL!",
            "tutor",
            "#include <iostream>\nusing namespace std;\n\nvoid swapRef(int& a, int& b) {\n    int temp = a;\n    a = b;\n    b = temp;\n}\n\nint main() {\n    int x = 5, y = 10;\n    swapRef(x, y);\n    cout << x << \" \" << y << endl;\n    return 0;\n}",
            "lesson-07",
            "2026-03-03T14:05:10"
        )
    ]
    cursor.executemany("""
        INSERT OR REPLACE INTO ai_chat_messages (id, user_id, role, content, persona, code_snippet, lesson_id, created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """, sample_chats)
    conn.commit()
    print(f"✓ Đã nạp {len(sample_chats)} tin nhắn AI vào bảng ai_chat_messages thành công.")

if __name__ == "__main__":
    init_db()
    print("Database initialized successfully at", DB_PATH)
