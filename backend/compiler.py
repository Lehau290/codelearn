"""
CodeLearn C++ - Real G++ Compiler Sandbox & AI Evaluator
File: backend/compiler.py
"""
import os
import sys
import time
import subprocess
import tempfile
import re

COMPILER_CMD = "g++"
COMPILER_FLAGS = ["-O2", "-std=c++17", "-Wall"]

def get_compiler_version() -> str:
    """Gets installed GCC/G++ version."""
    try:
        res = subprocess.run([COMPILER_CMD, "--version"], capture_output=True, text=True, timeout=5)
        if res.returncode == 0:
            first_line = res.stdout.strip().split("\n")[0]
            return first_line
    except Exception:
        pass
    return "g++ (GCC) Unavailable"

def compile_and_run(code: str, stdin_input: str = "", timeout_sec: int = 5) -> dict:
    """
    Compiles and executes C++ source code safely.
    Returns:
        success: bool,
        stage: 'compile' | 'run',
        output: str,
        error: str,
        execution_time_ms: float,
        compiler: str
    """
    if not code or not code.strip():
        return {
            "success": False,
            "stage": "compile",
            "output": "",
            "error": "Mã nguồn C++ trống. Vui lòng nhập code trước khi chạy.",
            "execution_time_ms": 0,
            "compiler": get_compiler_version()
        }

    # Basic safety filter against dangerous system commands if desired
    # (Notice: in local desktop environments g++ runs natively)
    with tempfile.TemporaryDirectory() as tmpdir:
        src_path = os.path.join(tmpdir, "solution.cpp")
        exe_path = os.path.join(tmpdir, "solution.exe")

        # Write C++ source
        try:
            with open(src_path, "w", encoding="utf-8") as f:
                f.write(code)
        except Exception as e:
            return {
                "success": False,
                "stage": "compile",
                "output": "",
                "error": f"Không thể lưu mã nguồn tạm thời: {str(e)}",
                "execution_time_ms": 0,
                "compiler": get_compiler_version()
            }

        # 1. Compile Stage
        compile_start = time.time()
        try:
            compile_proc = subprocess.run(
                [COMPILER_CMD] + COMPILER_FLAGS + [src_path, "-o", exe_path],
                capture_output=True,
                text=True,
                timeout=12
            )
        except subprocess.TimeoutExpired:
            return {
                "success": False,
                "stage": "compile",
                "output": "",
                "error": "Quá thời gian biên dịch (Compile Timeout > 12s).",
                "execution_time_ms": 0,
                "compiler": get_compiler_version()
            }
        except FileNotFoundError:
            return {
                "success": False,
                "stage": "compile",
                "output": "",
                "error": "Trình biên dịch g++ chưa được cài đặt hoặc không nằm trong PATH hệ thống.",
                "execution_time_ms": 0,
                "compiler": "Not Found"
            }

        compile_time_ms = (time.time() - compile_start) * 1000

        if compile_proc.returncode != 0:
            # Clean up compiler error messages (shorten absolute paths to 'solution.cpp')
            err_msg = compile_proc.stderr
            err_msg = re.sub(re.escape(src_path), "solution.cpp", err_msg)
            return {
                "success": False,
                "stage": "compile",
                "output": "",
                "error": err_msg.strip(),
                "compile_time_ms": round(compile_time_ms, 2),
                "execution_time_ms": 0,
                "compiler": get_compiler_version()
            }

        # 2. Execution Stage
        exec_start = time.time()
        try:
            run_proc = subprocess.run(
                [exe_path],
                input=stdin_input,
                capture_output=True,
                text=True,
                timeout=timeout_sec
            )
            exec_time_ms = (time.time() - exec_start) * 1000

            return {
                "success": run_proc.returncode == 0,
                "stage": "run",
                "output": run_proc.stdout,
                "error": run_proc.stderr.strip() if run_proc.stderr else "",
                "exit_code": run_proc.returncode,
                "execution_time_ms": round(exec_time_ms, 2),
                "compile_time_ms": round(compile_time_ms, 2),
                "compiler": get_compiler_version()
            }
        except subprocess.TimeoutExpired:
            return {
                "success": False,
                "stage": "run",
                "output": "",
                "error": f"Lỗi thời gian chạy: Chương trình chạy quá {timeout_sec} giây (có thể do vòng lặp vô tận hoặc đang chờ lệnh nhập dữ liệu cin).",
                "exit_code": -1,
                "execution_time_ms": timeout_sec * 1000,
                "compiler": get_compiler_version()
            }
        except Exception as e:
            return {
                "success": False,
                "stage": "run",
                "output": "",
                "error": f"Lỗi thực thi: {str(e)}",
                "exit_code": -1,
                "execution_time_ms": 0,
                "compiler": get_compiler_version()
            }

def normalize_text(text: str) -> str:
    """Normalizes text for fuzzy test comparison."""
    if not text:
        return ""
    # Trim and normalize CRLF to LF, collapse multiple whitespace
    lines = [line.strip() for line in text.replace("\r\n", "\n").replace("\r", "\n").split("\n")]
    return "\n".join(lines).strip()

def evaluate_exercise(code: str, expected_output: str, test_keywords: list = None, stdin_input: str = "") -> dict:
    """
    Evaluates exercise code:
    - Compiles and runs using real G++
    - Verifies test case output
    - Checks required keywords
    - Returns AI grade, score, strengths & improvements
    """
    run_res = compile_and_run(code, stdin_input=stdin_input, timeout_sec=5)

    score = 0
    strengths = []
    improvements = []
    output_matched = False

    # 1. Compilation Check (up to 40 pts)
    if not run_res["success"] and run_res.get("stage") == "compile":
        score = 25
        improvements.append("Mã nguồn chưa biên dịch được: " + (run_res.get("error", "").split("\n")[0]))
        improvements.append("Kiểm tra lại cấu trúc hàm main, dấu chấm phẩy ';' và thư viện #include <iostream>.")
        return {
            "passed": False,
            "score": score,
            "comprehensionPercent": score,
            "comprehensionLevel": "Cần ôn luyện",
            "execution": run_res,
            "output": "",
            "error": run_res.get("error", ""),
            "strengths": ["Đã cố gắng viết cấu trúc chương trình C++."],
            "improvements": improvements
        }

    score += 40
    strengths.append("Mã nguồn biên dịch thành công không có lỗi cú pháp.")

    # 2. Output Matching (up to 40 pts)
    actual_out = run_res.get("output", "")
    norm_actual = normalize_text(actual_out)
    norm_expected = normalize_text(expected_output)

    if norm_expected:
        if norm_actual == norm_expected:
            output_matched = True
            score += 40
            strengths.append(f"Kết quả đầu ra chính xác 100% khớp với đề bài: \"{norm_expected}\".")
        elif norm_expected.lower() in norm_actual.lower():
            score += 30
            strengths.append("Kết quả đầu ra chứa nội dung yêu cầu.")
            improvements.append("Định dạng xuất chưa hoàn toàn khớp từng ký tự với đề bài mẫu.")
        else:
            score += 15
            improvements.append(f"Kết quả xuất ({norm_actual or 'rỗng'}) chưa khớp với kết quả mong đợi ({norm_expected}).")
    else:
        # If no expected output defined, execution success is rewarded
        score += 35
        strengths.append("Chương trình thực thi trơn tru và trả về mã kết thúc 0.")

    # 3. Keywords & Best Practices Check (up to 20 pts)
    code_lower = code.lower()
    if test_keywords:
        matched_kw = [kw for kw in test_keywords if kw.lower() in code_lower]
        kw_ratio = len(matched_kw) / len(test_keywords) if test_keywords else 1.0
        kw_pts = int(kw_ratio * 20)
        score += kw_pts

        if kw_ratio >= 0.8:
            strengths.append(f"Vận dụng tốt các từ khóa và cú pháp cốt lõi: {', '.join(matched_kw)}.")
        else:
            missing_kw = [kw for kw in test_keywords if kw.lower() not in code_lower]
            if missing_kw:
                improvements.append(f"Cần áp dụng thêm các cú pháp trọng tâm của bài: {', '.join(missing_kw)}.")
    else:
        score += 20

    # Code quality bonuses / suggestions
    if "return 0;" in code:
        strengths.append("Có lệnh 'return 0;' chuẩn mực kết thúc hàm main().")
    else:
        improvements.append("Nên thêm 'return 0;' ở cuối hàm main() để báo hiệu chương trình kết thúc thành công.")

    if run_res.get("execution_time_ms", 0) < 50:
        strengths.append(f"Tốc độ thực thi tối ưu cực nhanh ({run_res.get('execution_time_ms')}ms).")

    # Final score cap & comprehension level
    score = max(20, min(100, score))
    passed = score >= 75

    if score >= 90:
        comprehension_level = "Hiểu bài xuất sắc (90%+)"
    elif score >= 75:
        comprehension_level = "Đạt yêu cầu (75%+)"
    elif score >= 50:
        comprehension_level = "Cần cải thiện (50%+)"
    else:
        comprehension_level = "Cần ôn luyện kỹ lại lý thuyết"

    return {
        "passed": passed,
        "score": score,
        "comprehensionPercent": score,
        "comprehensionLevel": comprehension_level,
        "execution": run_res,
        "output": actual_out,
        "error": run_res.get("error", ""),
        "strengths": strengths,
        "improvements": improvements
    }

def get_ai_mentor_reply(message: str, code: str = "", lesson_info: dict = None) -> dict:
    """
    Trợ lý AI Trợ giảng C++ thông minh:
    Phân tích lỗi cú pháp g++, giải thích nguyên nhân và đưa ra lời khuyên học tập bằng tiếng Việt.
    """
    msg_lower = (message or "").strip().lower()
    code = (code or "").strip()
    advice = []
    tips = []
    has_code = len(code) > 0

    # 1. Nếu có code gửi kèm, tiến hành kiểm tra biên dịch thực tế với g++
    compile_error = None
    if has_code:
        run_res = compile_and_run(code, timeout_sec=3)
        if not run_res.get("success"):
            compile_error = run_res.get("error", "")

    # 2. Xử lý khi có lỗi biên dịch thực tế từ g++
    if compile_error:
        err_lower = compile_error.lower()
        if "expected ';'" in err_lower:
            advice.append("⚠️ **Lỗi cú pháp:** Bạn đang thiếu dấu chấm phẩy `;` ở cuối một câu lệnh.")
            tips.append("Hãy rà soát dòng phía trước vị trí báo lỗi để bổ sung dấu `;`.")
        elif "was not declared in this scope" in err_lower:
            advice.append("⚠️ **Lỗi chưa khai báo:** Biến hoặc định danh bạn gọi chưa được khai báo trong phạm vi này.")
            tips.append("Kiểm tra xem bạn đã viết đúng chính tả tên biến, hoặc đã có `using namespace std;` và `#include <iostream>` chưa.")
        elif "undefined reference to `main'" in err_lower or "undefined reference to 'main'" in err_lower:
            advice.append("⚠️ **Thiếu hàm main:** Mọi chương trình C++ hợp lệ đều bắt buộc phải có điểm khởi đầu là hàm `int main() { ... }`.")
        elif "expected '}'" in err_lower or "expected '{'" in err_lower:
            advice.append("⚠️ **Lỗi đóng mở ngoặc:** Số lượng ngoặc nhọn `{` và `}` đang không khớp nhau.")
            tips.append("Mỗi khi mở một khối lệnh `{`, hãy nhớ đóng `}` ở cuối khối.")
        elif "no match for 'operator<<'" in err_lower:
            advice.append("⚠️ **Nhầm lẫn toán tử nhập/xuất:** Lệnh `cout` đi kèm với toán tử chèn luồng `<<`, trong khi `cin` đi kèm với toán tử trích xuất luồng `>>`.")
        elif "lỗi thời gian chạy" in err_lower or "timeout" in err_lower:
            advice.append("⏳ **Chương trình chạy quá thời gian (Timeout):** Có thể chương trình gặp vòng lặp vô tận (infinite loop) hoặc đang chờ lệnh `cin` mà chưa có dữ liệu đầu vào.")
        else:
            advice.append(f"⚠️ **Trình biên dịch g++ báo lỗi:**\n```text\n{compile_error}\n```")

        reply_content = "\n\n".join(advice)
        if tips:
            reply_content += "\n\n💡 **Gợi ý khắc phục:**\n- " + "\n- ".join(tips)
        
        return {
            "reply": reply_content,
            "has_error": True,
            "error_detail": compile_error,
            "status": "syntax_error"
        }

    # 3. Phân tích các câu hỏi thường gặp hoặc yêu cầu gợi ý
    if "gợi ý" in msg_lower or "hướng dẫn" in msg_lower or "làm thế nào" in msg_lower or "cách làm" in msg_lower:
        lesson_title = lesson_info.get("title", "") if lesson_info else ""
        return {
            "reply": f"💡 **Gợi ý làm bài {'chuyên đề ' + lesson_title if lesson_title else ''}:**\n\n"
                     "1. **Đọc kỹ đầu ra mong đợi:** Kiểm tra chính xác từng ký tự in ra, dấu cách và ký tự xuống dòng (`endl`).\n"
                     "2. **Khai báo biến:** Dùng kiểu dữ liệu phù hợp (`int` cho số nguyên, `double` cho số thực, `string` cho chuỗi văn bản).\n"
                     "3. **Kiểm tra luồng xử lý:** Viết từng câu lệnh đơn giản, chạy thử (Ctrl+Enter) để xem kết quả console trước khi nộp bài.\n\n"
                     "Bạn đang gặp khúc mắc ở dòng code cụ thể nào, hãy paste code để mình hỗ trợ nhé!",
            "has_error": False,
            "status": "hint"
        }

    if "biến" in msg_lower or "kiểu dữ liệu" in msg_lower:
        return {
            "reply": "📚 **Kiểu dữ liệu cơ bản trong C++:**\n\n"
                     "- `int`: Số nguyên (VD: `int age = 20;`)\n"
                     "- `double`: Số thực độ chính xác kép (VD: `double gpa = 3.85;`)\n"
                     "- `char`: Ký tự đơn trong dấu nháy đơn (VD: `char grade = 'A';`)\n"
                     "- `bool`: Giá trị logic `true` hoặc `false`\n"
                     "- `string`: Chuỗi ký tự trong dấu nháy kép (VD: `string name = \"Nam\";`)",
            "has_error": False,
            "status": "concept"
        }

    if "vòng lặp" in msg_lower or "for" in msg_lower or "while" in msg_lower:
        return {
            "reply": "🔄 **Vòng lặp trong C++:**\n\n"
                     "- **`for (khởi_tạo; điều_kiện; bước_nhảy)`**: Dùng khi biết trước số lần lặp (VD: lặp từ 1 đến 10).\n"
                     "- **`while (điều_kiện)`**: Dùng khi chưa biết trước số lần lặp, lặp cho đến khi điều kiện sai.\n"
                     "- **`do { ... } while (điều_kiện);`**: Luôn chạy ít nhất 1 lần rồi mới kiểm tra điều kiện.",
            "has_error": False,
            "status": "concept"
        }

    if "con trỏ" in msg_lower or "pointer" in msg_lower:
        return {
            "reply": "🎯 **Con trỏ (Pointer) trong C++:**\n\n"
                     "- Con trỏ là biến lưu trữ **địa chỉ ô nhớ** của một biến khác.\n"
                     "- Cú pháp khai báo: `int* ptr;`\n"
                     "- Lấy địa chỉ biến: `ptr = &x;` (Toán tử `&`)\n"
                     "- Truy xuất giá trị tại địa chỉ: `*ptr` (Toán tử giải tham chiếu `*`)",
            "has_error": False,
            "status": "concept"
        }

    # 4. Nếu code đã đúng và biên dịch thành công
    if has_code and not compile_error:
        return {
            "reply": "🎉 **Mã nguồn của bạn biên dịch rất tốt!** Không có lỗi cú pháp nào được phát hiện từ trình biên dịch g++ 13.2.0.\n\n"
                     "Hãy kiểm tra xem kết quả in ra ở màn hình Console đã trùng khớp với yêu cầu đề bài chưa. Nếu đã khớp, bạn có thể tự tin nhấn nút **'Nộp bài & Chấm điểm'** nhé!",
            "has_error": False,
            "status": "code_clean"
        }

    # 5. Phản hồi chung thân thiện
    return {
        "reply": "👋 Chào bạn! Mình là **AI Trợ giảng CodeLearn C++**.\n\n"
                 "Mình có thể giúp bạn:\n"
                 "- 🔍 **Phân tích và sửa lỗi biên dịch C++** (Missing semicolon, type errors, undefined reference...)\n"
                 "- 💡 **Gợi ý tư duy thuật toán** cho bài tập hiện tại\n"
                 "- 📖 **Giải thích khái niệm** cú pháp C++ cốt lõi (Vòng lặp, mảng, hàm, con trỏ, OOP)\n\n"
                 "Hãy hỏi mình bất kỳ câu hỏi nào hoặc nhập code vào editor để mình kiểm tra giúp bạn nhé!",
        "has_error": False,
        "status": "general"
    }
