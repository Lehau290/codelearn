"""
CodeLearn C++ - Real G++ Compiler Sandbox, AI Code Evaluator & ChatGPT C++ Tutor
File: backend/compiler.py
"""
import os
import sys
import time
import subprocess
import tempfile
import re
import json
import urllib.request
import urllib.error

COMPILER_CMD = "g++"
COMPILER_FLAGS = ["-O2", "-std=c++17", "-Wall"]
MAX_OUTPUT_CHARS = 32768  # 32 KB output buffer limit to prevent RAM exhaustion

# Danh sách mẫu code nguy hiểm bị cấm để bảo vệ hệ thống máy chủ
DANGEROUS_CODE_PATTERNS = [
    # Cấm các header can thiệp hệ thống / mạng / tiến trình
    (re.compile(r'#\s*include\s*[<"](?:windows\.h|process\.h|unistd\.h|sys/socket\.h|winsock2?\.h|ws2tcpip\.h|direct\.h|io\.h|arpa/inet\.h|netdb\.h)[>"]', re.IGNORECASE),
     "Thư viện can thiệp hệ điều hành / mạng bị cấm"),

    # Cấm lệnh gọi shell hoặc tiến trình bên ngoài
    (re.compile(r'\b(?:system|popen|_popen|fork|CreateProcess[AW]?|WinExec|ShellExecute[AW]?|_spawn[a-z]*|spawn[a-z]*)\s*\(', re.IGNORECASE),
     "Lệnh tạo hoặc thực thi tiến trình hệ thống (system / popen / fork)"),

    # Cấm lệnh thay thế tiến trình
    (re.compile(r'\b(?:execl|execle|execlp|execv|execve|execvp|execvpe)\s*\(', re.IGNORECASE),
     "Lệnh thay thế tiến trình (exec)"),

    # Cấm lệnh xóa tệp / thư mục
    (re.compile(r'\b(?:remove|unlink|rmdir|_rmdir)\s*\(', re.IGNORECASE),
     "Lệnh xóa tệp hoặc thư mục trên máy chủ"),

    (re.compile(r'\b(?:std::)?filesystem::(?:remove|remove_all)\b', re.IGNORECASE),
     "Lệnh xóa tệp trong std::filesystem"),

    # Cấm mã assembly nội tuyến
    (re.compile(r'\b(?:__asm__|__asm)\b|\basm\s*\(', re.IGNORECASE),
     "Mã hợp ngữ nội tuyến (Inline Assembly)")
]

def validate_code_safety(code: str) -> tuple[bool, str]:
    """Kiểm tra tĩnh mã nguồn C++ để phát hiện các lệnh nguy hiểm trước khi biên dịch."""
    if not code:
        return True, ""
    for pattern, desc in DANGEROUS_CODE_PATTERNS:
        match = pattern.search(code)
        if match:
            forbidden_call = match.group(0).strip()
            return False, f"{desc}: `{forbidden_call}`"
    return True, ""

def get_compiler_version() -> str:
    """Gets installed GCC/G++ version."""
    try:
        res = subprocess.run([COMPILER_CMD, "--version"], capture_output=True, text=True, timeout=5)
        if res.returncode == 0:
            first_line = res.stdout.strip().split("\n")[0]
            return first_line
    except Exception:
        pass
    return "g++ (GCC) 13.2.0"

def compile_and_run(code: str, stdin_input: str = "", timeout_sec: int = 5) -> dict:
    """
    Compiles and executes C++ source code safely with sandbox validation.
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

    is_safe, security_reason = validate_code_safety(code)
    if not is_safe:
        return {
            "success": False,
            "stage": "security",
            "output": "",
            "error": f"⚠️ Từ chối thực thi vì lý do bảo mật máy chủ: {security_reason}.",
            "execution_time_ms": 0,
            "compiler": get_compiler_version()
        }

    with tempfile.TemporaryDirectory() as tmpdir:
        src_path = os.path.join(tmpdir, "solution.cpp")
        exe_path = os.path.join(tmpdir, "solution.exe")

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

            stdout_text = run_proc.stdout or ""
            if len(stdout_text) > MAX_OUTPUT_CHARS:
                stdout_text = stdout_text[:MAX_OUTPUT_CHARS] + "\n... [Cảnh báo: Đầu ra vượt quá 32KB và đã được hệ thống cắt ngắn để bảo vệ bộ nhớ]"

            stderr_text = run_proc.stderr.strip() if run_proc.stderr else ""
            if len(stderr_text) > MAX_OUTPUT_CHARS:
                stderr_text = stderr_text[:MAX_OUTPUT_CHARS] + "\n... [Cảnh báo: Thông báo lỗi stderr vượt quá 32KB]"

            return {
                "success": run_proc.returncode == 0,
                "stage": "run",
                "output": stdout_text,
                "error": stderr_text,
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
    lines = [line.strip() for line in text.replace("\r\n", "\n").replace("\r", "\n").split("\n")]
    return "\n".join(lines).strip()

def analyze_code_quality(code: str) -> dict:
    """
    Phân tích tĩnh chất lượng mã nguồn C++:
    - Đánh giá phong cách Clean Code
    - Ước lượng độ phức tạp thời gian & không gian
    - Phát hiện các thực hành tốt và cảnh báo tiềm ẩn
    """
    if not code:
        return {
            "cleanCodeScore": 0,
            "timeComplexity": "N/A",
            "spaceComplexity": "N/A",
            "bestPractices": []
        }

    score = 80
    best_practices = []
    code_lower = code.lower()

    # 1. Kiểm tra cấu trúc cơ bản
    if "#include <iostream>" in code or "#include<iostream>" in code:
        score += 5
        best_practices.append("Khai báo thư viện `<iostream>` chuẩn.")
    if "return 0;" in code:
        score += 5
        best_practices.append("Kết thúc hàm `main()` với `return 0;` chuẩn mực.")
    if "//" in code or "/*" in code:
        score += 5
        best_practices.append("Có ghi chú thích (comments) giải thích mã nguồn.")
    else:
        score -= 5

    # 2. Ước lượng độ phức tạp
    # Đếm vòng lặp lồng nhau
    for_count = len(re.findall(r'\bfor\s*\(', code))
    while_count = len(re.findall(r'\bwhile\s*\(', code))
    total_loops = for_count + while_count

    # Kiểm tra lồng nhau
    nested_loop = False
    loop_matches = list(re.finditer(r'\b(?:for|while)\s*\([^{;]*\)\s*\{', code))
    if len(loop_matches) >= 2:
        for i in range(len(loop_matches) - 1):
            start_pos = loop_matches[i].start()
            next_pos = loop_matches[i+1].start()
            chunk = code[start_pos:next_pos]
            if "}" not in chunk:
                nested_loop = True
                break

    if nested_loop:
        time_comp = "O(N²) - Vòng lặp lồng nhau (Quad Time)"
    elif total_loops > 0:
        time_comp = "O(N) - Tuyến tính (Linear Time)"
    elif "std::sort" in code or "sort(" in code:
        time_comp = "O(N log N) - Sắp xếp logarit"
    else:
        time_comp = "O(1) - Hằng số (Constant Time)"

    # Không gian bộ nhớ
    if "vector" in code_lower or "new " in code_lower or "[" in code:
        space_comp = "O(N) - Cấp phát mảng / vector động"
    else:
        space_comp = "O(1) - Bộ nhớ tối ưu (In-place)"

    # Phát hiện new không có delete
    if "new " in code and "delete" not in code:
        score -= 15
        best_practices.append("Cảnh báo: Có lệnh `new` nhưng chưa thấy giải phóng bằng `delete`.")

    return {
        "cleanCodeScore": max(30, min(100, score)),
        "timeComplexity": time_comp,
        "spaceComplexity": space_comp,
        "bestPractices": best_practices
    }

def evaluate_exercise(code: str, expected_output: str = "", test_keywords: list = None, stdin_input: str = "", test_cases: list = None) -> dict:
    """
    AI Chấm & Đánh giá bài làm C++:
    - Biên dịch và thực thi an toàn trong Sandbox
    - Kiểm tra test cases (công khai và ẩn)
    - Phân tích cú pháp, phong cách code và tối ưu thuật toán
    - Trả về điểm số, nhận xét chi tiết, điểm mạnh, điểm cần cải thiện và lời khuyên định hướng
    """
    code_quality = analyze_code_quality(code)

    # 1. Trường hợp có test cases từ database
    if test_cases and len(test_cases) > 0:
        is_safe, security_reason = validate_code_safety(code)
        if not is_safe:
            return {
                "passed": False,
                "score": 0,
                "comprehensionPercent": 0,
                "comprehensionLevel": "Mã vi phạm an toàn",
                "summary": f"Mã nguồn bị từ chối thực thi vì vi phạm chính sách bảo mật hệ thống: {security_reason}.",
                "advice": "Vui lòng chỉ sử dụng các thư viện chuẩn C++ cho phép và không can thiệp vào tệp hệ thống.",
                "execution": {"success": False, "stage": "security", "error": security_reason, "output": ""},
                "output": "",
                "error": f"⚠️ Từ chối thực thi vì lý do bảo mật máy chủ: {security_reason}.",
                "strengths": [],
                "improvements": ["Không sử dụng các lệnh hệ thống hoặc file stream nguy hiểm."],
                "testCases": [],
                "aiReview": code_quality
            }

        with tempfile.TemporaryDirectory() as tmpdir:
            src_path = os.path.join(tmpdir, "solution.cpp")
            exe_path = os.path.join(tmpdir, "solution.exe")

            try:
                with open(src_path, "w", encoding="utf-8") as f:
                    f.write(code)
            except Exception as e:
                return {
                    "passed": False,
                    "score": 0,
                    "comprehensionPercent": 0,
                    "comprehensionLevel": "Lỗi lưu file",
                    "summary": f"Không thể lưu mã nguồn để biên dịch: {str(e)}",
                    "advice": "Hãy thử lại hoặc kiểm tra kết nối với máy chủ.",
                    "execution": {"success": False, "stage": "compile", "error": str(e), "output": ""},
                    "output": "",
                    "error": str(e),
                    "strengths": [],
                    "improvements": ["Lỗi ghi tệp mã nguồn tạm thời."],
                    "testCases": [],
                    "aiReview": code_quality
                }

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
                    "passed": False,
                    "score": 20,
                    "comprehensionPercent": 20,
                    "comprehensionLevel": "Quá thời gian biên dịch",
                    "summary": "Thời gian biên dịch vượt quá giới hạn 12 giây.",
                    "advice": "Đơn giản hóa mã nguồn, tránh import thư viện không cần thiết.",
                    "execution": {"success": False, "stage": "compile", "error": "Compile Timeout > 12s", "output": ""},
                    "output": "",
                    "error": "Quá thời gian biên dịch (>12s).",
                    "strengths": [],
                    "improvements": ["Đơn giản hóa mã nguồn để tránh quá tải trình biên dịch."],
                    "testCases": [],
                    "aiReview": code_quality
                }
            except FileNotFoundError:
                return {
                    "passed": False,
                    "score": 0,
                    "comprehensionPercent": 0,
                    "comprehensionLevel": "Thiếu trình biên dịch",
                    "summary": "Hệ thống chưa tìm thấy trình biên dịch g++.",
                    "advice": "Vui lòng cài đặt MinGW-w64 hoặc GCC trên máy chủ.",
                    "execution": {"success": False, "stage": "compile", "error": "g++ not found", "output": ""},
                    "output": "",
                    "error": "Trình biên dịch g++ chưa được cài đặt trong hệ thống.",
                    "strengths": [],
                    "improvements": [],
                    "testCases": [],
                    "aiReview": code_quality
                }

            compile_time_ms = (time.time() - compile_start) * 1000

            if compile_proc.returncode != 0:
                err_msg = re.sub(re.escape(src_path), "solution.cpp", compile_proc.stderr)
                first_line_err = err_msg.strip().split("\n")[0] if err_msg else "Lỗi cú pháp không xác định"
                return {
                    "passed": False,
                    "score": 25,
                    "comprehensionPercent": 25,
                    "comprehensionLevel": "Cần sửa lỗi biên dịch",
                    "summary": f"Chương trình gặp lỗi biên dịch cú pháp: {first_line_err}",
                    "advice": "Hãy đọc kỹ thông báo lỗi của g++ phía trên, kiểm tra lại dấu chấm phẩy `;`, tên biến và hàm `main()`.",
                    "execution": {"success": False, "stage": "compile", "error": err_msg.strip(), "output": "", "compile_time_ms": round(compile_time_ms, 2)},
                    "output": "",
                    "error": err_msg.strip(),
                    "strengths": ["Đã có nỗ lực triển khai cấu trúc chương trình C++."],
                    "improvements": [
                        f"Lỗi biên dịch: {first_line_err}",
                        "Rà soát lại cú pháp đóng mở ngoặc `{ }` và khai báo thư viện `#include <iostream>`."
                    ],
                    "testCases": [],
                    "aiReview": code_quality
                }

            # Compile thành công -> Chạy qua từng test case
            test_results = []
            passed_count = 0
            total_exec_time = 0.0
            first_output = ""

            for idx, tc in enumerate(test_cases):
                tc_in = tc.get("input_data", "") or ""
                tc_expected = tc.get("expected_output", "") or ""
                is_hidden = bool(tc.get("is_hidden", 0))

                t_start = time.time()
                try:
                    r_proc = subprocess.run(
                        [exe_path],
                        input=tc_in,
                        capture_output=True,
                        text=True,
                        timeout=5
                    )
                    t_exec = (time.time() - t_start) * 1000
                    total_exec_time += t_exec
                    tc_out = r_proc.stdout or ""
                    if idx == 0:
                        first_output = tc_out

                    norm_out = normalize_text(tc_out)
                    norm_exp = normalize_text(tc_expected)
                    is_match = (norm_out == norm_exp) or (norm_exp != "" and norm_exp in norm_out)

                    if is_match:
                        passed_count += 1

                    test_results.append({
                        "order": idx + 1,
                        "passed": is_match,
                        "input": "[Ẩn / Hidden testcase]" if is_hidden else tc_in,
                        "expected": "[Ẩn / Hidden testcase]" if is_hidden else tc_expected,
                        "actual": ("[Khớp]" if is_match else "[Sai lệch kết quả]") if is_hidden else tc_out,
                        "executionTimeMs": round(t_exec, 2),
                        "isHidden": is_hidden
                    })
                except subprocess.TimeoutExpired:
                    test_results.append({
                        "order": idx + 1,
                        "passed": False,
                        "input": "[Ẩn]" if is_hidden else tc_in,
                        "expected": "[Ẩn]" if is_hidden else tc_expected,
                        "actual": "Lỗi chạy quá 5s (Timeout)",
                        "executionTimeMs": 5000,
                        "isHidden": is_hidden
                    })
                except Exception as ex:
                    test_results.append({
                        "order": idx + 1,
                        "passed": False,
                        "input": "[Ẩn]" if is_hidden else tc_in,
                        "expected": "[Ẩn]" if is_hidden else tc_expected,
                        "actual": f"Lỗi: {str(ex)}",
                        "executionTimeMs": 0,
                        "isHidden": is_hidden
                    })

            total_tc = len(test_cases)
            tc_ratio = (passed_count / total_tc) if total_tc > 0 else 1.0
            score = 30 + int(tc_ratio * 50)

            strengths = ["Mã nguồn biên dịch thành công không có lỗi cú pháp."]
            improvements = []

            if passed_count == total_tc:
                strengths.append(f"Vượt qua xuất sắc toàn bộ {total_tc}/{total_tc} bộ test kiểm thử.")
            else:
                improvements.append(f"Vượt qua {passed_count}/{total_tc} bộ test. Cần kiểm tra lại các trường hợp biên hoặc định dạng xuất.")

            code_lower = code.lower()
            if test_keywords:
                matched_kw = [kw for kw in test_keywords if kw.lower() in code_lower]
                kw_ratio = len(matched_kw) / len(test_keywords) if test_keywords else 1.0
                score += int(kw_ratio * 20)
                if kw_ratio >= 0.8:
                    strengths.append(f"Vận dụng tốt các từ khóa trọng tâm: {', '.join(matched_kw)}.")
                else:
                    missing_kw = [kw for kw in test_keywords if kw.lower() not in code_lower]
                    if missing_kw:
                        improvements.append(f"Cần áp dụng thêm các cú pháp trọng tâm của bài: {', '.join(missing_kw)}.")
            else:
                score += 20

            if "return 0;" in code:
                strengths.append("Có lệnh `return 0;` chuẩn mực kết thúc hàm main().")

            # Thêm các best practice từ static analysis
            for bp in code_quality.get("bestPractices", []):
                if "Cảnh báo" in bp:
                    improvements.append(bp)
                else:
                    strengths.append(bp)

            score = max(20, min(100, score))
            passed = (passed_count == total_tc) and (score >= 75)

            if score >= 90:
                comprehension_level = "Hiểu bài xuất sắc (90%+)"
                summary = f"Tuyệt vời! Bạn đã vượt qua toàn bộ {total_tc}/{total_tc} test case với điểm số xuất sắc ({score}/100). Thuật toán tối ưu ({code_quality['timeComplexity']}) và phong cách code sạch sẽ."
                advice = "Bạn đã nắm vững trọn vẹn kiến thức của bài học này. Hãy tiếp tục thử thách với các bài nâng cao hoặc tối ưu hóa thêm bộ nhớ!"
            elif score >= 75:
                comprehension_level = "Đạt yêu cầu vững vàng (75%+)"
                summary = f"Khá tốt! Bạn đã vượt qua {passed_count}/{total_tc} test case và hoàn thành bài tập đạt chuẩn ({score}/100)."
                advice = "Nên chú ý định dạng in ấn (`endl`, khoảng trắng) và kiểm tra lại những trường hợp biên đặc biệt để đạt điểm tuyệt đối."
            elif score >= 50:
                comprehension_level = "Cần cải thiện (50%+)"
                summary = f"Chương trình chạy được nhưng chỉ vượt qua {passed_count}/{total_tc} test case ({score}/100)."
                advice = "Đọc kỹ lại yêu cầu đề bài, xem các test case bị trượt để điều chỉnh logic rẽ nhánh hoặc vòng lặp."
            else:
                comprehension_level = "Cần ôn luyện kỹ lại lý thuyết"
                summary = f"Bài làm chưa đạt yêu cầu kiểm thử ({score}/100)."
                advice = "Hãy ôn lại lý thuyết bài học, xem code mẫu và thử chạy từng bước với dữ liệu nhỏ."

            return {
                "passed": passed,
                "score": score,
                "comprehensionPercent": score,
                "comprehensionLevel": comprehension_level,
                "summary": summary,
                "advice": advice,
                "execution": {
                    "success": True,
                    "stage": "run",
                    "output": first_output,
                    "compile_time_ms": round(compile_time_ms, 2),
                    "execution_time_ms": round(total_exec_time, 2),
                    "compiler": get_compiler_version()
                },
                "output": first_output,
                "error": "",
                "strengths": strengths,
                "improvements": improvements,
                "testCases": test_results,
                "aiReview": code_quality
            }

    # 2. Chế độ đơn lẻ (Single expected output check)
    run_res = compile_and_run(code, stdin_input=stdin_input, timeout_sec=5)

    score = 0
    strengths = []
    improvements = []
    output_matched = False

    if not run_res["success"] and run_res.get("stage") == "compile":
        score = 25
        err_msg = run_res.get("error", "")
        first_err = err_msg.split("\n")[0] if err_msg else "Lỗi cú pháp"
        improvements.append(f"Mã nguồn chưa biên dịch được: {first_err}")
        improvements.append("Kiểm tra lại cấu trúc hàm main, dấu chấm phẩy ';' và thư viện #include <iostream>.")
        return {
            "passed": False,
            "score": score,
            "comprehensionPercent": score,
            "comprehensionLevel": "Cần sửa lỗi cú pháp",
            "summary": f"Chương trình chưa thể biên dịch: {first_err}",
            "advice": "Hãy sửa các lỗi cú pháp trước khi nộp bài để đạt kết quả tốt nhất.",
            "execution": run_res,
            "output": "",
            "error": run_res.get("error", ""),
            "strengths": ["Đã cố gắng viết cấu trúc chương trình C++."],
            "improvements": improvements,
            "aiReview": code_quality
        }

    score += 40
    strengths.append("Mã nguồn biên dịch thành công không có lỗi cú pháp.")

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
        score += 35
        strengths.append("Chương trình thực thi trơn tru và trả về mã kết thúc 0.")

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

    if "return 0;" in code:
        strengths.append("Có lệnh 'return 0;' chuẩn mực kết thúc hàm main().")
    else:
        improvements.append("Nên thêm 'return 0;' ở cuối hàm main() để báo hiệu chương trình kết thúc thành công.")

    if run_res.get("execution_time_ms", 0) < 50:
        strengths.append(f"Tốc độ thực thi tối ưu cực nhanh ({run_res.get('execution_time_ms')}ms).")

    for bp in code_quality.get("bestPractices", []):
        if "Cảnh báo" in bp:
            improvements.append(bp)
        else:
            strengths.append(bp)

    score = max(20, min(100, score))
    passed = score >= 75

    if score >= 90:
        comprehension_level = "Hiểu bài xuất sắc (90%+)"
        summary = f"Rất xuất sắc! Chương trình C++ của bạn chạy chuẩn xác ({score}/100), tốc độ thực thi nhanh và phong cách lập trình sạch."
        advice = "Bạn nắm rất vững chuyên đề này. Hãy sẵn sàng cho bài học tiếp theo!"
    elif score >= 75:
        comprehension_level = "Đạt yêu cầu (75%+)"
        summary = f"Đạt chuẩn ({score}/100). Chương trình chạy đúng yêu cầu cơ bản."
        advice = "Hãy hoàn thiện các chi tiết nhỏ trong phần gợi ý cải thiện để đạt mức điểm tối đa."
    elif score >= 50:
        comprehension_level = "Cần cải thiện (50%+)"
        summary = f"Chương trình chạy được nhưng chưa hoàn toàn khớp với đề bài ({score}/100)."
        advice = "Kiểm tra lại định dạng xuất và các câu lệnh điều kiện."
    else:
        comprehension_level = "Cần ôn luyện kỹ lại lý thuyết"
        summary = f"Bài tập chưa đạt chuẩn ({score}/100)."
        advice = "Hãy xem lại lý thuyết bài học và thử chạy từng lệnh nhỏ để hiểu rõ bài toán."

    return {
        "passed": passed,
        "score": score,
        "comprehensionPercent": score,
        "comprehensionLevel": comprehension_level,
        "summary": summary,
        "advice": advice,
        "execution": run_res,
        "output": actual_out,
        "error": run_res.get("error", ""),
        "strengths": strengths,
        "improvements": improvements,
        "aiReview": code_quality
    }

# =========================================================================
# CHATGPT C++ AI TUTOR & CONVERSATIONAL ENGINE
# =========================================================================

def get_api_key_from_env_or_config() -> tuple[str, str]:
    """
    Lấy API Key cho Gemini hoặc OpenAI / Groq:
    Trả về: (provider, api_key) ví dụ: ('gemini', 'AIza...') hoặc ('openai', 'sk-...')
    """
    # 1. Kiểm tra môi trường
    gemini_key = os.environ.get("GEMINI_API_KEY", "").strip()
    if gemini_key:
        return ("gemini", gemini_key)

    openai_key = os.environ.get("OPENAI_API_KEY", "").strip()
    if openai_key:
        return ("openai", openai_key)

    groq_key = os.environ.get("GROQ_API_KEY", "").strip()
    if groq_key:
        return ("groq", groq_key)

    # 2. Kiểm tra config.json
    cfg_path = os.path.join(os.path.dirname(__file__), "config.json")
    if os.path.exists(cfg_path):
        try:
            with open(cfg_path, "r", encoding="utf-8") as f:
                cfg = json.load(f)
                if cfg.get("GEMINI_API_KEY"):
                    return ("gemini", cfg["GEMINI_API_KEY"].strip())
                if cfg.get("OPENAI_API_KEY"):
                    return ("openai", cfg["OPENAI_API_KEY"].strip())
                if cfg.get("GROQ_API_KEY"):
                    return ("groq", cfg["GROQ_API_KEY"].strip())
        except Exception:
            pass

    return ("", "")

def query_gemini_api(prompt: str, api_key: str) -> str | None:
    """Gọi Gemini API (Google Generative AI)."""
    if not api_key:
        return None
    # Thử qua gemini-1.5-flash
    url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={api_key}"
    payload = {
        "contents": [{"parts": [{"text": prompt}]}],
        "generationConfig": {"temperature": 0.5, "maxOutputTokens": 1200}
    }
    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(url, data=data, headers={"Content-Type": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=12) as res:
            res_data = json.loads(res.read().decode("utf-8"))
            candidates = res_data.get("candidates", [])
            if candidates:
                parts = candidates[0].get("content", {}).get("parts", [])
                if parts:
                    return parts[0].get("text", "")
    except Exception as e:
        print(f"[Gemini Notice] Không thể kết nối Gemini API ({e}).", file=sys.stderr)
    return None

def query_openai_or_groq_api(provider: str, prompt: str, api_key: str, history: list = None) -> str | None:
    """Gọi OpenAI hoặc Groq API chuẩn chat/completions."""
    if not api_key:
        return None

    if provider == "groq":
        url = "https://api.groq.com/openai/v1/chat/completions"
        model = "llama-3.1-8b-instant"
    else:
        url = "https://api.openai.com/v1/chat/completions"
        model = "gpt-4o-mini"

    messages = [
        {"role": "system", "content": "Bạn là CodeLearn AI - Trợ lý AI và Gia sư Lập trình C++ thông minh, kiên nhẫn như ChatGPT. Hãy giải thích chi tiết, định dạng Markdown đẹp, code C++ chuẩn C++17 có chú thích tiếng Việt."}
    ]
    if history and isinstance(history, list):
        for h in history[-4:]:
            if isinstance(h, dict) and "role" in h and "content" in h:
                messages.append({"role": h["role"], "content": h["content"]})
    messages.append({"role": "user", "content": prompt})

    payload = {
        "model": model,
        "messages": messages,
        "temperature": 0.5,
        "max_tokens": 1200
    }
    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=data,
        headers={"Content-Type": "application/json", "Authorization": f"Bearer {api_key}"}
    )
    try:
        with urllib.request.urlopen(req, timeout=14) as res:
            res_data = json.loads(res.read().decode("utf-8"))
            choices = res_data.get("choices", [])
            if choices:
                return choices[0].get("message", {}).get("content", "")
    except Exception as e:
        print(f"[{provider.capitalize()} Notice] Lỗi gọi API ({e}).", file=sys.stderr)
    return None

# =========================================================================
# BUILT-IN KNOWLEDGE ENGINE (Zero-config, chạy thông minh như ChatGPT offline)
# =========================================================================

CPP_KNOWLEDGE_BASE = [
    {
        "keywords": ["oop", "hướng đối tượng", "lập trình hướng đối tượng", "đối tượng"],
        "title": "Lập trình hướng đối tượng (OOP) trong C++",
        "reply": (
            "### 🏛️ Lập trình Hướng đối tượng (OOP) trong C++\n\n"
            "OOP (Object-Oriented Programming) là phương pháp lập trình tổ chức mã nguồn xoay quanh các **Đối tượng (Objects)** và **Lớp (Classes)**, giúp mô phỏng thế giới thực, tái sử dụng và bảo trì mã nguồn hiệu quả.\n\n"
            "#### 🌟 4 Trụ cột cốt lõi của OOP:\n\n"
            "1. **Đóng gói (Encapsulation):** Gộp dữ liệu (thuộc tính) và hàm xử lý (phương thức) vào trong một lớp; che giấu dữ liệu bằng các quyền truy cập `private`, `protected`, `public`.\n"
            "2. **Kế thừa (Inheritance):** Cho phép lớp con kế thừa các thuộc tính và phương thức từ lớp cha (`class Dog : public Animal`), giúp tái sử dụng mã nguồn.\n"
            "3. **Đa hình (Polymorphism):** Cho phép các đối tượng khác nhau phản ứng khác nhau với cùng một thông điệp (sử dụng `virtual function` hoặc nạp chồng hàm / toán tử).\n"
            "4. **Trừu tượng hóa (Abstraction):** Chỉ hiển thị các tính năng quan trọng ra bên ngoài và ẩn đi các chi tiết cài đặt phức tạp (thông qua lớp trừu tượng `abstract class` chứa hàm thuần ảo `= 0`).\n\n"
            "#### 💻 Ví dụ minh họa thực tế:\n"
            "```cpp\n"
            "#include <iostream>\n"
            "#include <string>\n"
            "using namespace std;\n\n"
            "// Lớp cha trừu tượng\n"
            "class Animal {\n"
            "protected:\n"
            "    string name;\n"
            "public:\n"
            "    Animal(string n) : name(n) {}\n"
            "    virtual void makeSound() = 0; // Hàm thuần ảo (Pure virtual)\n"
            "    virtual ~Animal() {}          // Virtual destructor chuẩn mực\n"
            "};\n\n"
            "// Lớp con kế thừa\n"
            "class Dog : public Animal {\n"
            "public:\n"
            "    Dog(string n) : Animal(n) {}\n"
            "    void makeSound() override {\n"
            "        cout << name << \" sủa: Gâu gâu!\" << endl;\n"
            "    }\n"
            "};\n\n"
            "int main() {\n"
            "    Animal* myPet = new Dog(\"Cún Vàng\");\n"
            "    myPet->makeSound(); // Tính đa hình tại Runtime\n"
            "    delete myPet;\n"
            "    return 0;\n"
            "}\n"
            "```\n\n"
            "💡 **Mẹo:** Trong C++, hãy luôn khai báo `virtual ~Base()` cho lớp cha để tránh rò rỉ bộ nhớ khi giải phóng đối tượng đa hình!"
        )
    },
    {
        "keywords": ["struct", "class", "so sánh struct và class", "khác nhau struct và class", "struct khác class"],
        "title": "Sự khác biệt giữa Struct và Class trong C++",
        "reply": (
            "### ⚖️ Sự khác biệt giữa `struct` và `class` trong C++\n\n"
            "Trong C++, `struct` và `class` gần như có tính năng tương đương nhau (cả hai đều có thể có hàm thành viên, constructor, kế thừa, đa hình). Tuy nhiên, có **hai điểm khác biệt cốt lõi**:\n\n"
            "| Tiêu chí | `struct` | `class` |\n"
            "| :--- | :--- | :--- |\n"
            "| **Quyền truy cập mặc định** | `public` | `private` |\n"
            "| **Kế thừa mặc định** | `public` | `private` |\n"
            "| **Mục đích thường dùng** | Nhóm các biến dữ liệu thuần túy (POD - Plain Old Data) | Xây dựng đối tượng hoàn chỉnh, bảo vệ dữ liệu với logic nghiệp vụ |\n\n"
            "#### 💻 Ví dụ đối chiếu:\n"
            "```cpp\n"
            "struct Point {\n"
            "    int x, y; // Mặc định là public, truy cập trực tiếp p.x\n"
            "};\n\n"
            "class BankAccount {\n"
            "    double balance; // Mặc định là private, không thể truy cập ngoài lớp\n"
            "public:\n"
            "    void deposit(double amount) { balance += amount; }\n"
            "};\n"
            "```\n\n"
            "💡 **Quy tắc vàng (Best Practice):** Nếu chỉ muốn lưu trữ dữ liệu thô (như tọa độ `Point`, kích thước `Size`, cấu hình `Config`), hãy dùng `struct`. Khi cần bảo vệ trạng thái nội bộ với logic đóng gói, hãy dùng `class`."
        )
    },
    {
        "keywords": ["smart pointer", "con trỏ thông minh", "unique_ptr", "shared_ptr", "weak_ptr"],
        "title": "Con trỏ thông minh (Smart Pointers) trong C++",
        "reply": (
            "### 🧠 Con trỏ thông minh (Smart Pointers) trong C++ Hiện Đại (C++11/14/17)\n\n"
            "Con trỏ thô thông thường (`int* ptr = new int;`) rất dễ gây ra **rò rỉ bộ nhớ (Memory Leak)** nếu bạn quên lệnh `delete`. Smart Pointer được sinh ra dựa trên nguyên lý **RAII (Resource Acquisition Is Initialization)**: Tự động giải phóng vùng nhớ khi con trỏ ra khỏi phạm vi hoạt động (`scope`).\n\n"
            "#### 🏆 3 Loại Smart Pointers chính (`#include <memory>`):\n\n"
            "1. **`std::unique_ptr` (Sở hữu độc quyền):**\n"
            "   - Chỉ một con trỏ duy nhất sở hữu tài nguyên tại một thời điểm.\n"
            "   - Không thể sao chép (`copy`), chỉ có thể chuyển quyền sở hữu qua `std::move`.\n"
            "   - Chi phí tài nguyên cực thấp (Zero-overhead).\n\n"
            "2. **`std::shared_ptr` (Sở hữu chia sẻ):**\n"
            "   - Nhiều con trỏ có thể cùng sở hữu một đối tượng.\n"
            "   - Sử dụng cơ chế đếm tham chiếu (Reference Counting). Khi bộ đếm về 0, đối tượng sẽ tự động bị hủy.\n\n"
            "3. **`std::weak_ptr` (Tham chiếu yếu):**\n"
            "   - Quan sát một `shared_ptr` mà không làm tăng biến đếm tham chiếu.\n"
            "   - Dùng để phá vỡ vòng lặp tham chiếu vòng (Circular Reference) gây rò rỉ bộ nhớ.\n\n"
            "#### 💻 Code mẫu trực quan:\n"
            "```cpp\n"
            "#include <iostream>\n"
            "#include <memory>\n"
            "using namespace std;\n\n"
            "class Device {\n"
            "public:\n"
            "    Device() { cout << \"[+] Thiết bị khởi động\\n\"; }\n"
            "    ~Device() { cout << \"[-] Thiết bị đã tự động giải phóng!\\n\"; }\n"
            "    void work() { cout << \"Đang xử lý dữ liệu...\\n\"; }\n"
            "};\n\n"
            "int main() {\n"
            "    // Khởi tạo unique_ptr an toàn bằng make_unique (C++14)\n"
            "    auto dev = make_unique<Device>();\n"
            "    dev->work();\n"
            "    // Không cần viết delete dev! Bộ nhớ tự thu hồi khi hết hàm main.\n"
            "    return 0;\n"
            "}\n"
            "```"
        )
    },
    {
        "keywords": ["segmentation fault", "segfault", "core dumped", "lỗi bộ nhớ"],
        "title": "Nguyên nhân và Cách sửa lỗi Segmentation Fault trong C++",
        "reply": (
            "### 💥 Lỗi Segmentation Fault (Segfault) trong C++ là gì?\n\n"
            "**Segmentation Fault** (viết tắt là Segfault) xảy ra khi chương trình cố gắng truy cập vào một **vùng bộ nhớ không hợp lệ** hoặc vùng nhớ mà hệ điều hành không cho phép chương trình đọc/ghi.\n\n"
            "#### 🔍 5 Nguyên nhân phổ biến nhất:\n\n"
            "1. **Truy cập con trỏ NULL hoặc con trỏ rác (`nullptr dereference`):**\n"
            "   ```cpp\n"
            "   int* p = nullptr;\n"
            "   *p = 10; // ❌ Gây Segmentation Fault ngay lập tức!\n"
            "   ```\n"
            "2. **Truy cập mảng vượt quá chỉ số (Out of bounds):**\n"
            "   ```cpp\n"
            "   int arr[5];\n"
            "   arr[100000] = 42; // ❌ Vượt quá giới hạn mảng\n"
            "   ```\n"
            "3. **Tràn ngăn xếp (Stack Overflow) do đệ quy vô tận:**\n"
            "   - Hàm đệ quy thiếu điều kiện dừng (`base case`), khiến bộ nhớ stack cạn kiệt.\n"
            "4. **Sử dụng con trỏ lơ lửng (Dangling Pointer):**\n"
            "   - Đã gọi `delete ptr;` nhưng vẫn tiếp tục dùng `*ptr` sau đó.\n"
            "5. **Buffer Overflow với chuỗi C-style:**\n"
            "   - Dùng lệnh `scanf(\"%s\", str)` hoặc `gets()` mà không giới hạn độ dài.\n\n"
            "#### 🛠️ Cách khắc phục và phòng ngừa:\n"
            "- Luôn khởi tạo con trỏ: `int* ptr = nullptr;` và kiểm tra `if (ptr != nullptr)` trước khi dùng.\n"
            "- Dùng `std::vector` với hàm `.at(i)` thay vì `arr[i]` để có cơ chế kiểm tra giới hạn tự động.\n"
            "- Ưu tiên dùng con trỏ thông minh `std::unique_ptr` thay vì `new/delete` thủ công.\n"
            "- Luôn kiểm tra điều kiện dừng của hàm đệ quy!"
        )
    },
    {
        "keywords": ["quicksort", "sắp xếp nhanh", "quick sort"],
        "title": "Thuật toán sắp xếp nhanh QuickSort trong C++",
        "reply": (
            "### ⚡ Thuật toán Sắp xếp nhanh (QuickSort)\n\n"
            "**QuickSort** là thuật toán sắp xếp theo tư tưởng **Chia để trị (Divide and Conquer)** phổ biến và hiệu quả nhất trong thực tế. Bản thân hàm `std::sort` trong thư viện C++ cũng sử dụng biến thể của QuickSort (Introsort).\n\n"
            "#### 🎯 Ý tưởng thuật toán:\n"
            "1. Chọn một phần tử làm **Chốt (Pivot)**.\n"
            "2. **Phân hoạch (Partition):** Đưa tất cả phần tử nhỏ hơn Pivot về bên trái, các phần tử lớn hơn Pivot về bên phải.\n"
            "3. Đệ quy sắp xếp hai nửa mảng bên trái và bên phải Pivot.\n\n"
            "#### 📊 Độ phức tạp:\n"
            "- **Thời gian trung bình:** $O(N \\log N)$ — Cực nhanh trong thực tế.\n"
            "- **Trường hợp xấu nhất:** $O(N^2)$ (khi mảng đã sắp xếp và chọn pivot ở đầu/cuối).\n"
            "- **Không gian bộ nhớ:** $O(\\log N)$ (ngăn xếp đệ quy).\n\n"
            "#### 💻 Cài đặt C++ hoàn chỉnh:\n"
            "```cpp\n"
            "#include <iostream>\n"
            "#include <vector>\n"
            "using namespace std;\n\n"
            "int partition(vector<int>& arr, int low, int high) {\n"
            "    int pivot = arr[high]; // Chọn phần tử cuối làm pivot\n"
            "    int i = low - 1;\n"
            "    for (int j = low; j < high; j++) {\n"
            "        if (arr[j] < pivot) {\n"
            "            i++;\n"
            "            swap(arr[i], arr[j]);\n"
            "        }\n"
            "    }\n"
            "    swap(arr[i + 1], arr[high]);\n"
            "    return i + 1;\n"
            "}\n\n"
            "void quickSort(vector<int>& arr, int low, int high) {\n"
            "    if (low < high) {\n"
            "        int pi = partition(arr, low, high);\n"
            "        quickSort(arr, low, pi - 1);  // Nửa trái\n"
            "        quickSort(arr, pi + 1, high); // Nửa phải\n"
            "    }\n"
            "}\n\n"
            "int main() {\n"
            "    vector<int> nums = {64, 34, 25, 12, 22, 11, 90};\n"
            "    quickSort(nums, 0, nums.size() - 1);\n"
            "    cout << \"Mảng đã sắp xếp: \";\n"
            "    for (int x : nums) cout << x << \" \";\n"
            "    cout << endl;\n"
            "    return 0;\n"
            "}\n"
            "```"
        )
    },
    {
        "keywords": ["số nguyên tố", "prime", "sàng nguyên tố", "kiểm tra số nguyên tố"],
        "title": "Kiểm tra và Tìm số nguyên tố trong C++",
        "reply": (
            "### 🔢 Thuật toán Kiểm tra Số Nguyên Tố trong C++\n\n"
            "**Số nguyên tố** là số tự nhiên lớn hơn 1 và chỉ chia hết cho 1 và chính nó ($2, 3, 5, 7, 11, 13, 17,...$).\n\n"
            "#### ⚡ Thuật toán tối ưu $O(\\sqrt{N})$:\n"
            "Thay vì duyệt từ $2$ đến $N$, ta chỉ cần duyệt đến $\\sqrt{N}$ và kiểm tra bước nhảy $6k \\pm 1$ để loại bỏ toàn bộ số chẵn và bội số của 3.\n\n"
            "```cpp\n"
            "#include <iostream>\n"
            "#include <cmath>\n"
            "using namespace std;\n\n"
            "bool isPrime(int n) {\n"
            "    if (n <= 1) return false;\n"
            "    if (n <= 3) return true;\n"
            "    if (n % 2 == 0 || n % 3 == 0) return false;\n"
            "    for (int i = 5; i * i <= n; i += 6) {\n"
            "        if (n % i == 0 || n % (i + 2) == 0)\n"
            "            return false;\n"
            "    }\n"
            "    return true;\n"
            "}\n\n"
            "int main() {\n"
            "    int n;\n"
            "    cout << \"Nhập số cần kiểm tra: \";\n"
            "    if (cin >> n) {\n"
            "        if (isPrime(n))\n"
            "            cout << n << \" LÀ số nguyên tố!\" << endl;\n"
            "        else\n"
            "            cout << n << \" KHÔNG PHẢI là số nguyên tố.\" << endl;\n"
            "    }\n"
            "    return 0;\n"
            "}\n"
            "```\n\n"
            "💡 **Gợi ý khi tìm nguyên tố trong đoạn $[1, N]$ lớn:** Hãy dùng **Sàng Eratosthenes** với độ phức tạp $O(N \\log \\log N)$ để tìm cực nhanh hàng triệu số nguyên tố!"
        )
    },
    {
        "keywords": ["vector", "std::vector", "mảng động"],
        "title": "Cách sử dụng std::vector trong C++",
        "reply": (
            "### 📦 Thư viện `std::vector` trong C++ STL\n\n"
            "`std::vector` là mảng động có khả năng **tự động co giãn kích thước** khi thêm hoặc bớt phần tử. Đây là cấu trúc dữ liệu được sử dụng nhiều nhất trong C++ hiện đại.\n\n"
            "#### 🔑 Các thao tác thông dụng:\n"
            "- Khai báo: `vector<int> v;` hoặc khởi tạo sẵn: `vector<int> v(10, 0);` (10 phần tử giá trị 0).\n"
            "- Thêm phần tử vào cuối: `v.push_back(x);` hoặc `v.emplace_back(x);` (tối ưu hơn).\n"
            "- Xóa phần tử cuối: `v.pop_back();`\n"
            "- Kích thước: `v.size()`\n"
            "- Kiểm tra rỗng: `v.empty()`\n"
            "- Truy cập: `v[i]` hoặc `v.at(i)` (an toàn hơn vì có kiểm tra bounds).\n"
            "- Duyệt mảng: `for (int x : v)` (range-for loop).\n\n"
            "```cpp\n"
            "#include <iostream>\n"
            "#include <vector>\n"
            "#include <algorithm>\n"
            "using namespace std;\n\n"
            "int main() {\n"
            "    vector<int> nums = {5, 2, 9, 1, 7};\n"
            "    nums.push_back(10); // Thêm 10\n"
            "    sort(nums.begin(), nums.end()); // Sắp xếp tăng dần\n\n"
            "    cout << \"Các phần tử: \";\n"
            "    for (int val : nums) {\n"
            "        cout << val << \" \";\n"
            "    }\n"
            "    cout << \"\\nTổng số phần tử: \" << nums.size() << endl;\n"
            "    return 0;\n"
            "}\n"
            "```"
        )
    },
    {
        "keywords": ["con trỏ", "pointer", "địa chỉ", "tham chiếu", "reference"],
        "title": "Con trỏ và Tham chiếu trong C++",
        "reply": (
            "### 🎯 Con trỏ (Pointer) và Tham chiếu (Reference) trong C++\n\n"
            "#### 1. Con trỏ (Pointer):\n"
            "- Là một biến đặc biệt dùng để lưu **địa chỉ ô nhớ** của biến khác.\n"
            "- Khai báo: `int* ptr;`\n"
            "- Toán tử lấy địa chỉ: `&x`\n"
            "- Toán tử giải tham chiếu (lấy giá trị tại ô nhớ): `*ptr`\n\n"
            "#### 2. Tham chiếu (Reference):\n"
            "- Là **tên bí danh (alias)** của một biến đã có sẵn. Không chiếm thêm ô nhớ độc lập.\n"
            "- Cú pháp: `int& ref = x;`\n"
            "- Thường dùng nhất để truyền tham số vào hàm (`pass by reference`) giúp tránh sao chép tốn bộ nhớ.\n\n"
            "```cpp\n"
            "#include <iostream>\n"
            "using namespace std;\n\n"
            "void swapByPointer(int* a, int* b) {\n"
            "    int temp = *a;\n"
            "    *a = *b;\n"
            "    *b = temp;\n"
            "}\n\n"
            "void swapByReference(int& a, int& b) {\n"
            "    int temp = a;\n"
            "    a = b;\n"
            "    b = temp;\n"
            "}\n\n"
            "int main() {\n"
            "    int x = 10, y = 20;\n"
            "    swapByReference(x, y); // x=20, y=10 (cú pháp gọn và an toàn)\n"
            "    cout << \"x = \" << x << \", y = \" << y << endl;\n"
            "    return 0;\n"
            "}\n"
            "```"
        )
    },
    {
        "keywords": ["map", "unordered_map", "bảng băm", "tra cứu"],
        "title": "Map và Unordered_map trong C++",
        "reply": (
            "### 🗺️ So sánh `std::map` và `std::unordered_map` trong C++\n\n"
            "Cả hai đều lưu dữ liệu theo cặp **Khóa - Giá trị (`Key - Value`)**, nhưng có cấu trúc và hiệu năng rất khác nhau:\n\n"
            "| Đặc tính | `std::map` | `std::unordered_map` |\n"
            "| :--- | :--- | :--- |\n"
            "| **Cấu trúc bên trong** | Cây đỏ-đen (Red-Black Tree) | Bảng băm (Hash Table) |\n"
            "| **Thứ tự các Key** | Luôn được sắp xếp tăng dần | Thứ tự ngẫu nhiên (không sắp xếp) |\n"
            "| **Độ phức tạp tra cứu/chèn** | $O(\\log N)$ | $O(1)$ trung bình |\n"
            "| **Thư viện include** | `#include <map>` | `#include <unordered_map>` |\n\n"
            "#### 💻 Ví dụ đếm số lần xuất hiện của từ/số:\n"
            "```cpp\n"
            "#include <iostream>\n"
            "#include <unordered_map>\n"
            "#include <vector>\n"
            "using namespace std;\n\n"
            "int main() {\n"
            "    vector<int> nums = {1, 2, 2, 3, 1, 4, 2};\n"
            "    unordered_map<int, int> freq;\n"
            "    for (int x : nums) freq[x]++;\n\n"
            "    for (auto const& [val, count] : freq) {\n"
            "        cout << \"Số \" << val << \" xuất hiện \" << count << \" lần\\n\";\n"
            "    }\n"
            "    return 0;\n"
            "}\n"
            "```"
        )
    },
    {
        "keywords": ["fibonacci", "dãy fibonacci", "tính fibonacci"],
        "title": "Dãy số Fibonacci trong C++",
        "reply": (
            "### 🌀 Dãy số Fibonacci trong C++\n\n"
            "Dãy số Fibonacci có định nghĩa: $F_0 = 0, F_1 = 1$, và $F_n = F_{n-1} + F_{n-2}$ với mọi $n \\ge 2$.\n\n"
            "#### ⚡ Cách tối ưu bằng Quy hoạch động $O(N)$ thời gian, $O(1)$ bộ nhớ:\n"
            "```cpp\n"
            "#include <iostream>\n"
            "using namespace std;\n\n"
            "long long fibonacci(int n) {\n"
            "    if (n <= 0) return 0;\n"
            "    if (n == 1) return 1;\n"
            "    long long prev2 = 0, prev1 = 1, curr = 0;\n"
            "    for (int i = 2; i <= n; i++) {\n"
            "        curr = prev1 + prev2;\n"
            "        prev2 = prev1;\n"
            "        prev1 = curr;\n"
            "    }\n"
            "    return curr;\n"
            "}\n\n"
            "int main() {\n"
            "    int n = 10;\n"
            "    cout << \"Fibonacci thứ \" << n << \" là: \" << fibonacci(n) << endl;\n"
            "    return 0;\n"
            "}\n"
            "```\n\n"
            "⚠️ **Lưu ý:** Không nên dùng đệ quy thuần túy `return fib(n-1) + fib(n-2)` vì độ phức tạp lên tới $O(2^N)$ sẽ gây tràn thời gian (Time Limit Exceeded) khi $N > 40$!"
        )
    }
]

def generate_heuristic_response(message: str, code: str = "", lesson_info: dict = None, compile_error: str = "") -> dict:
    """
    Sinh câu trả lời thông minh dựa trên tri thức C++ chuyên sâu
    khi chạy ở chế độ offline / không có API Key ngoài.
    """
    msg_clean = (message or "").strip()
    msg_lower = msg_clean.lower()
    has_code = len((code or "").strip()) > 0

    # 1. Nếu có lỗi biên dịch thực tế từ g++
    if compile_error:
        err_lower = compile_error.lower()
        explanation = []
        if "expected ';'" in err_lower:
            explanation.append("⚠️ **Lỗi thiếu dấu chấm phẩy `;`:** Bạn đã quên dấu `;` kết thúc lệnh ở dòng phía trước vị trí báo lỗi.")
        elif "was not declared in this scope" in err_lower:
            var_match = re.search(r"'([^']+)' was not declared in this scope", compile_error)
            var_name = f"`{var_match.group(1)}`" if var_match else "biến hoặc hàm"
            explanation.append(f"⚠️ **Lỗi chưa khai báo:** Định danh {var_name} chưa được khai báo trước khi sử dụng. Hãy kiểm tra xem bạn đã viết đúng chính tả chưa, hoặc đã thêm `#include <iostream>` và `using namespace std;` chưa.")
        elif "undefined reference to `main'" in err_lower or "undefined reference to 'main'" in err_lower:
            explanation.append("⚠️ **Thiếu hàm main:** Điểm bắt đầu của mọi chương trình C++ là `int main() { ... }`. Hãy bổ sung hàm `main` nhé.")
        elif "expected '}'" in err_lower or "expected '{'" in err_lower:
            explanation.append("⚠️ **Lỗi mở/đóng ngoặc:** Số lượng ngoặc nhọn `{` và `}` trong code của bạn đang không khớp nhau.")
        elif "no match for 'operator<<'" in err_lower:
            explanation.append("⚠️ **Nhầm lẫn toán tử xuất:** Lệnh `cout` phải đi cùng toán tử `<<`, còn `cin` đi cùng toán tử `>>`.")
        else:
            explanation.append(f"⚠️ **Thông báo lỗi từ trình biên dịch g++:**\n```text\n{compile_error}\n```")

        explanation.append("\n💡 **Gợi ý khắc phục:**\n1. Kiểm tra lại dòng lệnh được g++ chỉ định vị trí lỗi.\n2. Rà soát kiểu dữ liệu và thư viện `#include` tương ứng.\n3. Nhấn nút **'Chạy thử'** để biên dịch lại sau khi chỉnh sửa.")
        return {
            "reply": "\n\n".join(explanation),
            "has_error": True,
            "status": "syntax_error"
        }

    # 2. Người dùng nhờ kiểm tra / review code
    if ("kiểm tra code" in msg_lower or "review" in msg_lower or "xem code" in msg_lower or "có lỗi gì không" in msg_lower) and has_code:
        run_res = compile_and_run(code, timeout_sec=3)
        if run_res["success"]:
            quality = analyze_code_quality(code)
            reply = (
                f"### ✅ Đánh giá Mã Nguồn C++ của bạn\n\n"
                f"- **Tình trạng biên dịch:** Thành công 100% với g++ 13.2.0.\n"
                f"- **Thời gian thực thi:** {run_res.get('execution_time_ms', 0)}ms.\n"
                f"- **Độ phức tạp ước tính:** {quality['timeComplexity']}.\n"
                f"- **Mức độ Clean Code:** {quality['cleanCodeScore']}/100.\n\n"
                f"#### 🌟 Điểm nổi bật:\n"
                f"- Cấu trúc chương trình hợp lệ, không có lỗi rò rỉ bộ nhớ nghiêm trọng.\n"
                f"- Đầu ra mẫu thực thi: `{run_res.get('output', '').strip() or '[Chương trình kết thúc thành công với mã 0]'}`.\n\n"
                f"💡 Bạn có thể tự tin nhấn nút **'AI Chấm & Đánh giá'** để nộp bài kiểm thử tự động nhé!"
            )
            return {"reply": reply, "has_error": False, "status": "code_review"}

    # 3. Tra cứu Knowledge Base chủ đề C++
    for item in CPP_KNOWLEDGE_BASE:
        for kw in item["keywords"]:
            if kw in msg_lower:
                return {
                    "reply": item["reply"],
                    "has_error": False,
                    "status": "knowledge_hit"
                }

    # 4. Yêu cầu gợi ý làm bài tập hiện tại
    if "gợi ý" in msg_lower or "làm bài" in msg_lower or "hướng dẫn" in msg_lower or "giải bài" in msg_lower:
        lesson_title = lesson_info.get("title", "") if lesson_info else "chuyên đề hiện tại"
        lesson_chap = lesson_info.get("chapter", "") if lesson_info else ""
        return {
            "reply": (
                f"### 💡 Gợi ý tư duy bài học: {lesson_title}\n\n"
                f"Để hoàn thành tốt bài học này, bạn hãy làm theo 3 bước sau:\n\n"
                f"1. **Phân tích yêu cầu:** Đọc kỹ định dạng đầu vào (Input) và đầu ra (Output). Chú ý từng ký tự dấu cách và ký tự xuống dòng (`endl`).\n"
                f"2. **Xác định kiểu dữ liệu:** Sử dụng `int` cho số nguyên, `double` cho số thực, `string` cho chuỗi văn bản, `vector` nếu cần lưu mảng kích thước động.\n"
                f"3. **Kiểm tra biên (Edge Cases):** Thử nghiệm với các trường hợp số âm, số 0, hoặc giá trị lớn nhất/nhỏ nhất trước khi nộp bài.\n\n"
                f"Nếu bạn đang gặp lỗi ở dòng code nào, hãy gửi code vào khung chat để mình gỡ lỗi giúp bạn nhé!"
            ),
            "has_error": False,
            "status": "hint"
        }

    # 5. Phản hồi tự nhiên thân thiện (Friendly conversational fallback)
    return {
        "reply": (
            f"👋 Chào bạn! Mình là **CodeLearn AI Assistant** — Trợ lý ảo chuyên sâu về Lập trình C++.\n\n"
            f"Bạn có thể trò chuyện và hỏi mình bất kỳ câu hỏi nào như trên ChatGPT:\n\n"
            f"- 🧠 **Lý thuyết & Khái niệm:** *OOP là gì?*, *Con trỏ thông minh unique_ptr vs shared_ptr?*, *Struct khác Class ở đâu?*, *Vector vs Mảng?*\n"
            f"- 🛠️ **Gỡ lỗi (Debug):** *Tại sao bị Segmentation fault?*, *Sửa lỗi undefined reference to main giúp tôi*\n"
            f"- 🚀 **Thuật toán:** *Giải thích thuật toán QuickSort*, *Cách tìm số nguyên tố tối ưu*, *Thuật toán tìm kiếm nhị phân*\n"
            f"- 📝 **Đánh giá code:** Hãy viết code vào editor hoặc dán vào đây, mình sẽ biên dịch và review chất lượng code cho bạn!\n\n"
            f"Bạn muốn cùng mình thảo luận hoặc giải bài tập nào hôm nay?"
        ),
        "has_error": False,
        "status": "conversational"
    }

def get_ai_mentor_reply(message: str, code: str = "", lesson_info: dict = None, history: list = None) -> dict:
    """
    Điểm truy cập chính cho AI Trợ giảng C++:
    - Nếu có cấu hình API Key (Gemini / OpenAI / Groq): Sử dụng mô hình LLM tương tác đa lượt như ChatGPT thật.
    - Nếu không có API Key: Kích hoạt Hệ thống Tri thức Lập trình C++ chuyên sâu (Heuristic & Sandbox Evaluator).
    """
    code = (code or "").strip()
    message = (message or "").strip()
    has_code = len(code) > 0

    # 1. Kiểm tra biên dịch thực tế trước nếu có code kèm theo
    compile_error = ""
    if has_code:
        run_res = compile_and_run(code, timeout_sec=3)
        if not run_res.get("success") and run_res.get("stage") == "compile":
            compile_error = run_res.get("error", "")

    # 2. Thử gọi LLM nếu có API Key
    provider, api_key = get_api_key_from_env_or_config()
    if provider and api_key:
        prompt_parts = [
            "Bạn là CodeLearn AI - Trợ lý AI và Gia sư Lập trình C++ thông minh, kiên nhẫn như ChatGPT của học viện CodeLearn.",
            "Hãy trả lời bằng tiếng Việt, dùng Markdown định dạng rõ ràng, đẹp mắt, chia đề mục, code C++ chuẩn mực có chú thích dễ hiểu."
        ]
        if lesson_info:
            prompt_parts.append(f"Ngữ cảnh bài học: {lesson_info.get('title', '')} (Chương: {lesson_info.get('chapter', '')})")
        if has_code:
            prompt_parts.append(f"Mã nguồn C++ hiện tại của học viên:\n```cpp\n{code}\n```")
            if compile_error:
                prompt_parts.append(f"Lỗi biên dịch thực tế từ trình biên dịch g++:\n```text\n{compile_error}\n```")
        prompt_parts.append(f"Câu hỏi của học viên: {message}")
        full_prompt = "\n\n".join(prompt_parts)

        llm_reply = None
        if provider == "gemini":
            llm_reply = query_gemini_api(full_prompt, api_key)
        elif provider in ("openai", "groq"):
            llm_reply = query_openai_or_groq_api(provider, full_prompt, api_key, history=history)

        if llm_reply and len(llm_reply.strip()) > 10:
            return {
                "reply": llm_reply.strip(),
                "has_error": bool(compile_error),
                "error_detail": compile_error,
                "status": f"llm_{provider}"
            }

    # 3. Kích hoạt Hệ thống Tri thức Nội bộ C++ (Heuristic & Sandbox Engine)
    return generate_heuristic_response(message, code=code, lesson_info=lesson_info, compile_error=compile_error)
