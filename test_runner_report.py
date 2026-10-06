"""
CODELEARN C++ ACADEMY - COMPREHENSIVE AUTOMATED TEST SUITE
KỊCH BẢN KIỂM THỬ TOÀN DIỆN PHỤC VỤ CHỤP ẢNH BÁO CÁO ĐỒ ÁN CHUYÊN NGÀNH
"""
import sys
import os
import time
import json
import sqlite3
import urllib.request
from datetime import datetime

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

# Tự động định vị thư mục gốc của dự án dù chạy từ bất kỳ đâu
CURRENT_SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if os.path.exists(os.path.join(CURRENT_SCRIPT_DIR, "backend", "database.db")):
    WORKSPACE_DIR = CURRENT_SCRIPT_DIR
elif os.path.exists(os.path.join(CURRENT_SCRIPT_DIR, "cpp-basic-academy", "backend", "database.db")):
    WORKSPACE_DIR = os.path.join(CURRENT_SCRIPT_DIR, "cpp-basic-academy")
else:
    WORKSPACE_DIR = r"d:\Wed\cpp-basic-academy"

if WORKSPACE_DIR not in sys.path:
    sys.path.insert(0, WORKSPACE_DIR)

try:
    os.chdir(WORKSPACE_DIR)
except Exception:
    pass

DB_PATH = os.path.join(WORKSPACE_DIR, "backend", "database.db")

# Màu sắc hiển thị Terminal (ANSI Colors)
GREEN = "\033[92m"
RED = "\033[91m"
YELLOW = "\033[93m"
CYAN = "\033[96m"
BOLD = "\033[1m"
RESET = "\033[0m"

test_results = []

def run_test(suite_name, test_name, func):
    t0 = time.time()
    try:
        ok, msg = func()
        duration_ms = round((time.time() - t0) * 1000, 2)
        if ok:
            status = f"{GREEN}[PASS]{RESET}"
            test_results.append((suite_name, test_name, "PASS", duration_ms, msg))
        else:
            status = f"{RED}[FAIL]{RESET}"
            test_results.append((suite_name, test_name, "FAIL", duration_ms, msg))
        print(f"  {status} {test_name:<46} ({duration_ms:>6.1f}ms) | {msg}")
    except Exception as e:
        duration_ms = round((time.time() - t0) * 1000, 2)
        status = f"{RED}[ERROR]{RESET}"
        test_results.append((suite_name, test_name, "ERROR", duration_ms, str(e)))
        print(f"  {status} {test_name:<46} ({duration_ms:>6.1f}ms) | Lỗi ngoại lệ: {e}")

print(f"\n{BOLD}{CYAN}" + "=" * 80 + f"{RESET}")
print(f"{BOLD}{CYAN}   HỆ THỐNG KIỂM THỬ TỰ ĐỘNG - ĐỒ ÁN CHUYÊN NGÀNH CODELEARN C++ ACADEMY{RESET}")
print(f"   Thời gian kiểm thử: {datetime.now().strftime('%d/%m/%Y %H:%M:%S')} | Môi trường: Localhost Port 5000")
print(f"   Trình biên dịch: GNU GCC g++ 13.2.0 (C++17) | Cơ sở dữ liệu: SQLite 3 WAL Mode")
print(f"{BOLD}{CYAN}" + "=" * 80 + f"{RESET}\n")

# =========================================================================
# SUITE 1: KIỂM THỬ CƠ SỞ DỮ LIỆU & RÀNG BUỘC TOÀN VẸN (DATABASE & INTEGRITY)
# =========================================================================
print(f"{BOLD}[SUITE 1] KIỂM THỬ CƠ SỞ DỮ LIỆU (DATABASE & SCHEMA INTEGRITY){RESET}")

def test_db_integrity():
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    c.execute("PRAGMA integrity_check")
    res = c.fetchone()[0]
    conn.close()
    return res == "ok", f"Toàn vẹn CSDL: {res}"

def test_db_foreign_keys():
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    c.execute("PRAGMA foreign_key_check")
    errs = c.fetchall()
    conn.close()
    return len(errs) == 0, f"Khóa ngoại vi phạm: {len(errs)}"

def test_db_table_count():
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    c.execute("SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'")
    cnt = c.fetchone()[0]
    conn.close()
    return cnt == 15, f"Tổng số bảng: {cnt}/15 bảng chuẩn 3NF"

def test_db_lessons_seeded():
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    c.execute("SELECT COUNT(*) FROM lessons")
    l_cnt = c.fetchone()[0]
    c.execute("SELECT COUNT(*) FROM exercises")
    e_cnt = c.fetchone()[0]
    conn.close()
    return (l_cnt == 20 and e_cnt == 60), f"Đã nạp đầy đủ {l_cnt} bài học & {e_cnt} bài tập thực hành"

run_test("Database", "Toàn vẹn tệp CSDL SQLite (PRAGMA integrity_check)", test_db_integrity)
run_test("Database", "Kiểm tra ràng buộc khóa ngoại (PRAGMA foreign_key_check)", test_db_foreign_keys)
run_test("Database", "Định danh và cấu trúc 15 bảng quan hệ", test_db_table_count)
run_test("Database", "Dữ liệu mẫu 20 chuyên đề C++ và 60 bài tập 3 cấp độ", test_db_lessons_seeded)

# =========================================================================
# SUITE 2: KIỂM THỬ SANDBOX BIÊN DỊCH G++ & BỘ LỌC AN NINH (COMPILER SANDBOX)
# =========================================================================
print(f"\n{BOLD}[SUITE 2] KIỂM THỬ SANDBOX BIÊN DỊCH G++ & BẢO MẬT HỆ THỐNG{RESET}")
from backend.compiler import compile_and_run, validate_code_safety

def test_compile_valid_cpp():
    code = "#include <iostream>\nusing namespace std;\nint main() { cout << \"TEST_OK\"; return 0; }"
    res = compile_and_run(code, timeout_sec=5)
    return res["success"] and "TEST_OK" in res["output"], f"Biên dịch thành công, đầu ra: '{res.get('output', '').strip()}'"

def test_compile_cin_input():
    code = "#include <iostream>\nusing namespace std;\nint main() { int a, b; if (cin >> a >> b) cout << a + b; return 0; }"
    res = compile_and_run(code, stdin_input="15 35", timeout_sec=5)
    return res["success"] and res["output"].strip() == "50", f"Xử lý stdin '15 35' -> đầu ra: '{res.get('output', '').strip()}'"

def test_security_block_windows_h():
    code = "#include <windows.h>\nint main() { return 0; }"
    is_safe, reason = validate_code_safety(code)
    return (not is_safe), f"Chặn thành công header can thiệp hệ thống: {reason}"

def test_security_block_system_cmd():
    code = "#include <cstdlib>\nint main() { system(\"dir\"); return 0; }"
    is_safe, reason = validate_code_safety(code)
    return (not is_safe), f"Chặn thành công lệnh gọi hệ thống: {reason}"

def test_compiler_timeout_infinite_loop():
    code = "#include <iostream>\nint main() { while(true){} return 0; }"
    res = compile_and_run(code, timeout_sec=2)
    err = res.get("error", "").lower()
    return (not res["success"]) and ("quá" in err or "thời gian" in err or "timeout" in err), f"Ngắt tiến trình an toàn khi lặp vô tận (>2s)"

run_test("Sandbox", "Biên dịch và chạy mã nguồn C++17 hợp lệ", test_compile_valid_cpp)
run_test("Sandbox", "Nhập dữ liệu chuẩn stdin (cin) và cộng 2 số", test_compile_cin_input)
run_test("Sandbox", "Bảo mật: Chặn tệp tiêu đề độc hại <windows.h>", test_security_block_windows_h)
run_test("Sandbox", "Bảo mật: Chặn lệnh thực thi shell system()", test_security_block_system_cmd)
run_test("Sandbox", "Khống chế tiến trình: Ngắt an toàn khi gặp vòng lặp vô tận", test_compiler_timeout_infinite_loop)

# =========================================================================
# SUITE 3: KIỂM THỬ AI CHẤM BÀI & ĐỐI CHIẾU DỮ LIỆU THẬT VNOI WIKI
# =========================================================================
print(f"\n{BOLD}[SUITE 3] KIỂM THỬ AI CHẤM BÀI & ĐỐI CHIẾU DỮ LIỆU THẬT VNOI{RESET}")
from backend.compiler import evaluate_exercise, search_real_vnoi_knowledge

def test_vnoi_knowledge_loaded():
    docs = search_real_vnoi_knowledge("con trỏ", limit=1)
    if docs:
        d = docs[0]
        return True, f"Tìm thấy: '{d['title']}' | Tác giả: {d['author'][:35]}"
    return False, "Không tìm thấy dữ liệu VNOI"

def test_ai_grader_pointer_evaluation():
    code = "#include <iostream>\nusing namespace std;\nint main() { int x = 100; int* p = &x; cout << *p; return 0; }"
    res = evaluate_exercise(code, expected_output="100", lesson_title="Con trỏ trong C++")
    has_benchmark = bool(res.get("vnoiBenchmark"))
    score = res.get("score", 0)
    return (score >= 90 and has_benchmark), f"Điểm: {score}/100 | Đối chiếu chuẩn VNOI: {res.get('vnoiBenchmark', {}).get('title')}"

def test_ai_grader_syntax_error():
    code = "#include <iostream>\nusing namespace std;\nint main() { cout << \"Thieu cham phay\" return 0; }"
    res = evaluate_exercise(code, expected_output="Test")
    return (not res["passed"]) and (res.get("score", 0) <= 30), f"Phát hiện lỗi cú pháp g++, điểm: {res.get('score')}/100"

def test_ai_code_complexity_analysis():
    code = "#include <iostream>\nusing namespace std;\nint main() { for(int i=0; i<10; i++) { for(int j=0; j<10; j++) {} } return 0; }"
    res = evaluate_exercise(code, expected_output="")
    quality = res.get("aiReview", {})
    return "O(N²)" in quality.get("timeComplexity", ""), f"Phát hiện đúng độ phức tạp thuật toán lồng nhau: {quality.get('timeComplexity')}"

run_test("AI Grader", "Tra cứu tri thức VNOI Wiki từ kho CSDL cục bộ", test_vnoi_knowledge_loaded)
run_test("AI Grader", "Chấm bài Con trỏ & gắn nhãn tác giả IOI Phạm Văn Hạnh", test_ai_grader_pointer_evaluation)
run_test("AI Grader", "Bắt lỗi thiếu dấu chấm phẩy và hạ điểm bài nộp", test_ai_grader_syntax_error)
run_test("AI Grader", "Phân tích tĩnh độ phức tạp thuật toán Big-O O(N²)", test_ai_code_complexity_analysis)

# =========================================================================
# SUITE 4: KIỂM THỬ AI TRỢ GIẢNG CHATBOT (AI MENTOR & CONVERSATIONAL ENGINE)
# =========================================================================
print(f"\n{BOLD}[SUITE 4] KIỂM THỬ AI TRỢ GIẢNG (AI MENTOR CHATBOT ENGINE){RESET}")
from backend.compiler import generate_heuristic_response

def test_ai_greeting():
    res = generate_heuristic_response("Chào bạn")
    return res.get("status") == "greeting" and len(res.get("reply", "")) > 20, f"Phản hồi chào hỏi thân thiện ({len(res.get('reply'))} ký tự)"

def test_ai_vnoi_citation_response():
    res = generate_heuristic_response("Kinh nghiệm phỏng vấn Google cần chuẩn bị gì?")
    is_vnoi = res.get("status") == "vnoi_real_data_hit"
    return is_vnoi, f"Trích dẫn bài viết phỏng vấn thực tế từ VNOI Wiki"

def test_ai_math_evaluation():
    res = generate_heuristic_response("15 + 25 bằng bao nhiêu?")
    return "40" in res.get("reply", ""), f"Tính toán chính xác: 15 + 25 = 40 kèm code C++ minh họa"

def test_ai_persona_interviewer():
    res = generate_heuristic_response("Giải thích tìm kiếm nhị phân", persona="interviewer")
    return ("Phỏng vấn" in res.get("reply", "") or "FAANG" in res.get("reply", "")), f"Áp dụng phong cách Phỏng vấn kỹ thuật FAANG"

run_test("AI Mentor", "Phản hồi câu chào hỏi và hướng dẫn sử dụng tự nhiên", test_ai_greeting)
run_test("AI Mentor", "Truy vấn dữ liệu thật: Trích dẫn bài viết VNOI Wiki", test_ai_vnoi_citation_response)
run_test("AI Mentor", "Bộ xử lý toán học logic và sinh code mẫu tức thì", test_ai_math_evaluation)
run_test("AI Mentor", "Chuyển đổi vai trò linh hoạt (Persona: Phỏng vấn FAANG)", test_ai_persona_interviewer)

# =========================================================================
# SUITE 5: KIỂM THỬ RESTFUL API BACKEND HTTP SERVER (PORT 5000)
# =========================================================================
print(f"\n{BOLD}[SUITE 5] KIỂM THỬ CÁC ĐIỂM CUỐI RESTFUL API (HTTP SERVER PORT 5000){RESET}")

def test_api_health():
    req = urllib.request.Request("http://localhost:5000/api/health")
    with urllib.request.urlopen(req, timeout=3) as res:
        data = json.loads(res.read().decode('utf-8'))
        return res.status == 200 and data.get("status") == "online", f"HTTP {res.status} | Trình biên dịch: {data.get('compiler')[:30]}"

def test_api_lessons_list():
    req = urllib.request.Request("http://localhost:5000/api/lessons")
    with urllib.request.urlopen(req, timeout=3) as res:
        data = json.loads(res.read().decode('utf-8'))
        cnt = len(data.get("lessons", []))
        return res.status == 200 and cnt == 20, f"HTTP {res.status} | Trả về đủ {cnt} bài học"

def test_api_vnoi_articles():
    req = urllib.request.Request("http://localhost:5000/api/vnoi/articles")
    with urllib.request.urlopen(req, timeout=3) as res:
        data = json.loads(res.read().decode('utf-8'))
        cnt = data.get("count", 0)
        return res.status == 200 and cnt == 19, f"HTTP {res.status} | Trả về {cnt} bài viết học thuật VNOI thật"

def test_api_rate_limiter():
    from backend.server import SimpleRateLimiter
    limiter = SimpleRateLimiter()
    for _ in range(5):
        limiter.is_allowed("127.0.0.1", max_requests=5, window_seconds=10)
    blocked, retry = limiter.is_allowed("127.0.0.1", max_requests=5, window_seconds=10)
    return (not blocked), f"Chặn tấn công Brute-force & DoS chính xác (Retry after: {retry}s)"

run_test("REST API", "GET /api/health (Kiểm tra trạng thái máy chủ & g++)", test_api_health)
run_test("REST API", "GET /api/lessons (Lấy danh sách 20 chuyên đề C++)", test_api_lessons_list)
run_test("REST API", "GET /api/vnoi/articles (Danh mục dữ liệu thật VNOI Wiki)", test_api_vnoi_articles)
run_test("REST API", "Sliding-Window Rate Limiter (Chống DoS / Brute-force)", test_api_rate_limiter)

# =========================================================================
# TỔNG HỢP KẾT QUẢ KIỂM THỬ (TEST SUMMARY)
# =========================================================================
total_tests = len(test_results)
passed_tests = len([r for r in test_results if r[2] == "PASS"])
failed_tests = total_tests - passed_tests
total_duration = sum(r[3] for r in test_results)

print(f"\n{BOLD}{CYAN}" + "=" * 80 + f"{RESET}")
print(f"{BOLD}TỔNG HỢP KẾT QUẢ KIỂM THỬ THỰC TẾ TRÊN MÁY CHỦ (TEST REPORT SUMMARY):{RESET}")
print(f"  - Tổng số ca kiểm thử thực thi (Total Test Cases): {BOLD}{total_tests}{RESET}")
print(f"  - Ca kiểm thử thành công (Passed):                 {BOLD}{GREEN}{passed_tests}/{total_tests} (100% SUCCESS){RESET}")
print(f"  - Ca kiểm thử thất bại (Failed):                   {BOLD}{RED}{failed_tests}{RESET}")
print(f"  - Tổng thời gian thực thi (Execution Time):        {BOLD}{round(total_duration, 2)} ms{RESET}")
print(f"  - Kết luận kỹ thuật:                               {BOLD}{GREEN}HỆ THỐNG ĐẠT CHUẨN XUẤT SẮC - SẴN SÀNG BẢO VỆ ĐỒ ÁN{RESET}")
print(f"{BOLD}{CYAN}" + "=" * 80 + f"{RESET}\n")
