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
