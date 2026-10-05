-- ==============================================================================
-- CODELEARN C++ ACADEMY - RELATIONAL DATABASE SCHEMA
-- File: backend/schema.sql
-- Hệ quản trị tương thích: SQLite 3 / MySQL 8.0 / PostgreSQL 14+
-- Phiên bản: 2.0.0
-- Mô tả: Lược đồ cơ sở dữ liệu hoàn chỉnh cho nền tảng học lập trình C++ trực tuyến.
-- ==============================================================================

-- Bật tính năng kiểm tra khóa ngoại (SQLite)
PRAGMA foreign_keys = ON;

-- ------------------------------------------------------------------------------
-- 1. BẢNG USERS (Người dùng / Học viên / Quản trị viên)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
    id             TEXT PRIMARY KEY,
    username       TEXT UNIQUE NOT NULL,
    email          TEXT UNIQUE NOT NULL,
    password_hash  TEXT NOT NULL,
    full_name      TEXT NOT NULL,
    role           TEXT NOT NULL DEFAULT 'student', -- 'student' | 'admin'
    avatar         TEXT DEFAULT '',
    current_streak INTEGER DEFAULT 0,
    longest_streak INTEGER DEFAULT 0,
    last_study_date TEXT DEFAULT '',
    created_at     TEXT NOT NULL,
    updated_at     TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);

-- ------------------------------------------------------------------------------
-- 2. BẢNG SESSIONS (Phiên đăng nhập & Token xác thực)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sessions (
    token         TEXT PRIMARY KEY,
    user_id       TEXT NOT NULL,
    created_at    TEXT NOT NULL,
    expires_at    TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_sessions_user_id ON sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_sessions_expires_at ON sessions(expires_at);

-- ------------------------------------------------------------------------------
-- 3. BẢNG LESSONS (Danh mục bài học lý thuyết & thực hành)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS lessons (
    id                   TEXT PRIMARY KEY,
    title                TEXT NOT NULL,
    chapter              TEXT NOT NULL,
    description          TEXT NOT NULL,
    level                TEXT NOT NULL DEFAULT 'Cơ bản', -- 'Cơ bản' | 'Trung bình' | 'Nâng cao'
    duration             TEXT NOT NULL DEFAULT '20 phút',
    content              TEXT NOT NULL,                  -- Nội dung lý thuyết HTML/Markdown
    example              TEXT NOT NULL,                  -- Code mẫu minh họa
    exercise_title       TEXT NOT NULL,
    exercise_description TEXT NOT NULL,
    starter_code         TEXT NOT NULL,                  -- Code khởi tạo sẵn cho bài tập
    order_num            INTEGER NOT NULL,               -- Thứ tự bài học (1, 2, 3...)
    created_at           TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_lessons_order ON lessons(order_num);
CREATE INDEX IF NOT EXISTS idx_lessons_chapter ON lessons(chapter);

-- ------------------------------------------------------------------------------
-- 4. BẢNG EXERCISES (Kho bài tập thực hành & Tiêu chí AI chấm điểm)
-- Mỗi bài học gồm 3 bài tập: Cơ bản (Easy), Vận dụng (Medium), Thử thách (Hard)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS exercises (
    id              TEXT NOT NULL,
    lesson_id       TEXT NOT NULL,
    title           TEXT NOT NULL,
    level           TEXT NOT NULL,                   -- 'Cơ bản' | 'Vận dụng' | 'Thử thách'
    difficulty      TEXT NOT NULL DEFAULT 'easy',    -- 'easy' | 'medium' | 'hard'
    points          INTEGER NOT NULL DEFAULT 100,
    description     TEXT NOT NULL,
    starter_code    TEXT NOT NULL,
    expected_output TEXT DEFAULT '',                 -- Đầu ra mong đợi để AI đối chiếu
    hint            TEXT DEFAULT '',                 -- Gợi ý giải thuật
    test_keywords   TEXT DEFAULT '[]',               -- Danh sách từ khóa C++ bắt buộc (JSON array)
    order_num       INTEGER NOT NULL,                -- Thứ tự 1, 2, 3 trong bài học
    PRIMARY KEY (lesson_id, id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_exercises_lesson_order ON exercises(lesson_id, order_num);

-- ------------------------------------------------------------------------------
-- 5. BẢNG PROGRESS (Tiến độ học tập & Điểm số của từng học viên)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS progress (
    id                  TEXT PRIMARY KEY,
    user_id             TEXT NOT NULL,
    lesson_id           TEXT NOT NULL,
    status              TEXT NOT NULL DEFAULT 'not_started', -- 'not_started' | 'in_progress' | 'completed'
    code                TEXT DEFAULT '',
    score               INTEGER DEFAULT 0,
    comprehension_level TEXT DEFAULT '',                     -- Mức độ hiểu bài do AI đánh giá
    completed_at        TEXT,
    updated_at          TEXT NOT NULL,
    UNIQUE(user_id, lesson_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_progress_user_lesson ON progress(user_id, lesson_id);
CREATE INDEX IF NOT EXISTS idx_progress_status ON progress(status);

-- ------------------------------------------------------------------------------
-- 6. BẢNG SUBMISSIONS (Lịch sử nộp bài code & Kết quả chấm điểm AI)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS submissions (
    id                TEXT PRIMARY KEY,
    user_id           TEXT NOT NULL,
    lesson_id         TEXT NOT NULL,
    exercise_id       TEXT NOT NULL,
    code              TEXT NOT NULL,
    output            TEXT DEFAULT '',
    passed            INTEGER DEFAULT 0,             -- 1 = Đạt, 0 = Chưa đạt
    score             INTEGER DEFAULT 0,             -- Thang điểm 0 - 100
    execution_time_ms REAL DEFAULT 0,                -- Thời gian chạy (mili-giây)
    ai_feedback       TEXT DEFAULT '',               -- Nhận xét phân tích điểm mạnh & góp ý của AI
    submitted_at      TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_submissions_user ON submissions(user_id);
CREATE INDEX IF NOT EXISTS idx_submissions_lesson_exercise ON submissions(lesson_id, exercise_id);
CREATE INDEX IF NOT EXISTS idx_submissions_submitted_at ON submissions(submitted_at);

-- ------------------------------------------------------------------------------
-- 7. BẢNG SETTINGS (Cấu hình hệ thống & Khóa học)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS settings (
    key   TEXT PRIMARY KEY,
    value TEXT NOT NULL
);

-- ------------------------------------------------------------------------------
-- 8. BẢNG CERTIFICATES (Chứng chỉ tốt nghiệp xác thực)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS certificates (
    id                TEXT PRIMARY KEY,
    cert_code         TEXT UNIQUE NOT NULL,      -- Mã tra cứu: CERT-CPP-2026-XXXX
    user_id           TEXT NOT NULL,
    course_name       TEXT NOT NULL DEFAULT 'C++ Basic Programming',
    final_score       INTEGER NOT NULL,
    issued_at         TEXT NOT NULL,
    verification_hash TEXT NOT NULL,             -- Mã băm chống làm giả
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_certificates_code ON certificates(cert_code);
CREATE INDEX IF NOT EXISTS idx_certificates_user ON certificates(user_id);

-- ------------------------------------------------------------------------------
-- 9. BẢNG TEST_CASES (Bộ kiểm thử đa trường hợp cho bài tập)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS test_cases (
    id              TEXT PRIMARY KEY,
    lesson_id       TEXT NOT NULL,
    exercise_id     TEXT NOT NULL,
    input_data      TEXT DEFAULT '',             -- Dữ liệu stdin (cin)
    expected_output TEXT NOT NULL,               -- Dữ liệu stdout mong đợi
    is_hidden       INTEGER DEFAULT 0,           -- 1 = Test ẩn chống gian lận, 0 = Test công khai
    weight_points   INTEGER DEFAULT 30,          -- Điểm của testcase này
    order_num       INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY (lesson_id, exercise_id) REFERENCES exercises(lesson_id, id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_test_cases_exercise ON test_cases(lesson_id, exercise_id);

-- ------------------------------------------------------------------------------
-- 10. BẢNG ACHIEVEMENTS (Danh mục danh hiệu & thành tựu học viên)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS achievements (
    id          TEXT PRIMARY KEY,
    code        TEXT UNIQUE NOT NULL,            -- 'first_lesson', 'streak_7', 'master'
    title       TEXT NOT NULL,
    description TEXT NOT NULL,
    points      INTEGER DEFAULT 50,
    order_num   INTEGER NOT NULL DEFAULT 1
);

-- ------------------------------------------------------------------------------
-- 11. BẢNG USER_ACHIEVEMENTS (Thành tựu đã mở khóa của học viên)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_achievements (
    user_id        TEXT NOT NULL,
    achievement_id TEXT NOT NULL,
    unlocked_at    TEXT NOT NULL,
    PRIMARY KEY (user_id, achievement_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (achievement_id) REFERENCES achievements(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_user_achievements_user ON user_achievements(user_id);

-- ------------------------------------------------------------------------------
-- 12. BẢNG COMMENTS (Hỏi đáp & Thảo luận bài học)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS comments (
    id          TEXT PRIMARY KEY,
    lesson_id   TEXT NOT NULL,
    user_id     TEXT NOT NULL,
    parent_id   TEXT,                            -- Trả lời bình luận khác
    content     TEXT NOT NULL,
    created_at  TEXT NOT NULL,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_comments_lesson ON comments(lesson_id);
CREATE INDEX IF NOT EXISTS idx_comments_parent ON comments(parent_id);

-- ------------------------------------------------------------------------------
-- 13. BẢNG ACTIVITY_LOGS (Nhật ký kiểm toán an toàn hệ thống)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS activity_logs (
    id          TEXT PRIMARY KEY,
    user_id     TEXT,
    action      TEXT NOT NULL,                   -- 'login', 'compile', 'claim_cert', 'update_profile'
    ip_address  TEXT DEFAULT '',
    details     TEXT DEFAULT '',
    created_at  TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_activity_logs_action ON activity_logs(action);
CREATE INDEX IF NOT EXISTS idx_activity_logs_created_at ON activity_logs(created_at);
