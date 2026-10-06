"""
CodeLearn C++ - SQLite Database & Models
File: backend/database.py
"""
import os
import sqlite3
import hashlib
import json
import uuid
import re
from datetime import datetime, timedelta

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

    # Seed lessons and exercises if not exist
    cursor.execute("SELECT COUNT(*) as count FROM lessons")
    if cursor.fetchone()["count"] == 0:
        seed_lessons_and_exercises(conn)

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
                end_m = re.search(r'\n\s*\]\s*;', exercises_code[start_pos:])
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

if __name__ == "__main__":
    init_db()
    print("Database initialized successfully at", DB_PATH)
