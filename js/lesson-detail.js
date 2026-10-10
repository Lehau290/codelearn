// ============================================================
// CODELEARN C++ - LESSON DETAIL
// File: js/lesson-detail.js
// ============================================================

let currentLessonData = null;
let currentLessonExercises = [];
let activeExerciseIndex = 0;

function findLessonFlexible(lessonsList, targetId) {
    if (!targetId || !Array.isArray(lessonsList) || lessonsList.length === 0) {
        return null;
    }
    const cleanId = String(targetId).trim().toLowerCase();

    // 1. So khớp chính xác ID (không phân biệt chữ hoa / thường)
    let found = lessonsList.find(
        l => l && String(l.id).toLowerCase() === cleanId
    );
    if (found) return found;

    // 2. So khớp theo số bài học / thứ tự (ví dụ: "2", "lesson-2", "lesson-02", "bai-2")
    const digits = cleanId.replace(/\D/g, "");
    if (digits) {
        const num = parseInt(digits, 10);
        found = lessonsList.find(l => {
            if (!l) return false;
            const lDigits = String(l.id || "").replace(/\D/g, "");
            const lNum = lDigits ? parseInt(lDigits, 10) : NaN;
            const order = parseInt(l.order || l.order_num || 0, 10);
            return lNum === num || order === num;
        });
        if (found) return found;
    }

    // 3. So khớp theo tiêu đề bài học
    found = lessonsList.find(l => {
        if (!l || !l.title) return false;
        const title = String(l.title).toLowerCase();
        return title.includes(cleanId) || cleanId.includes(title);
    });
    if (found) return found;

    return null;
}

document.addEventListener("DOMContentLoaded", async () => {
    const currentUser = CppStorage.getCurrentUser();

    if (!currentUser) {
        return;
    }

    // --------------------------------------------------------
    // Lấy lesson ID từ URL
    // Ví dụ:
    // lesson-detail.html?id=lesson-02 hoặc lesson-detail.html?id=2
    // --------------------------------------------------------

    const params = new URLSearchParams(
        window.location.search
    );

    const lessonId = params.get("id");

    let lessons = CppStorage.getLessons();
    if (!lessons || lessons.length === 0) {
        if (typeof CppStorage.resetLessons === "function") {
            CppStorage.resetLessons();
        }
        lessons = CppStorage.getLessons();
    }

    let lesson = null;
    if (lessonId) {
        lesson = findLessonFlexible(lessons, lessonId);
    }

    // Nếu chưa tìm thấy và backend API khả dụng, thử đồng bộ danh sách bài học
    if (!lesson && window.CodeLearnApi && typeof CodeLearnApi.lessons?.getAll === "function") {
        try {
            const res = await CodeLearnApi.lessons.getAll();
            const apiLessons = (res && Array.isArray(res.lessons)) ? res.lessons : (Array.isArray(res) ? res : null);
            if (apiLessons && apiLessons.length > 0) {
                const storageMap = new Map((lessons || []).map(l => [String(l.id), l]));
                const mergedLessons = apiLessons.map(apiL => {
                    const localL = storageMap.get(String(apiL.id)) || {};
                    return {
                        ...localL,
                        ...apiL,
                        content: apiL.content || localL.content || localL.theory || "",
                        theory: apiL.content || localL.theory || localL.content || "",
                        starterCode: apiL.starterCode || localL.starterCode || "",
                        example: apiL.example || localL.example || ""
                    };
                }).sort((a, b) => Number(a.order || 0) - Number(b.order || 0));

                lessons = mergedLessons;
                CppStorage.saveLessons(mergedLessons);

                if (lessonId) {
                    lesson = findLessonFlexible(lessons, lessonId);
                }
            }
        } catch (_) {}
    }

    // Nếu vẫn chưa tìm thấy theo ID, gọi trực tiếp API chi tiết bài học
    if (!lesson && lessonId && window.CodeLearnApi && typeof CodeLearnApi.lessons?.getById === "function") {
        try {
            const singleRes = await CodeLearnApi.lessons.getById(lessonId);
            if (singleRes && singleRes.lesson) {
                lesson = singleRes.lesson;
            }
        } catch (_) {}
    }

    // Nếu người dùng KHÔNG truyền tham số ID (vào thẳng trang lesson-detail.html)
    // thì mới mở bài học đầu tiên (Bài 1)
    if (!lesson && !lessonId && lessons.length > 0) {
        lesson = lessons[0];
    } else if (!lesson && lessons.length > 0) {
        // Nếu truyền ID nhưng không tìm thấy, thử lại với findLessonFlexible hoặc fallback bài đầu tiên
        lesson = findLessonFlexible(lessons, lessonId) || lessons[0];
    }

    if (!lesson) {
        showLessonError(
            "Chưa có bài học nào trong hệ thống."
        );
        return;
    }

    // Chuẩn hoá URL trên thanh địa chỉ sang đúng ID của bài học hiện tại
    if (lesson.id && window.history && window.history.replaceState) {
        try {
            const currentUrl = new URL(window.location.href);
            if (currentUrl.searchParams.get("id") !== String(lesson.id)) {
                currentUrl.searchParams.set("id", lesson.id);
                window.history.replaceState({}, "", currentUrl.toString());
            }
        } catch (_) {}
    }

    currentLessonData = lesson;
    initLessonExercises(lesson);

    // --------------------------------------------------------
    // Hiển thị bài học
    // --------------------------------------------------------

    renderLesson(
        lesson,
        currentUser
    );

    // --------------------------------------------------------
    // Thiết lập 3 tab bài tập & gợi ý AI
    // --------------------------------------------------------

    setupExerciseTabs(
        lesson,
        currentUser
    );

    // --------------------------------------------------------
    // Xử lý code editor
    // --------------------------------------------------------

    setupCodeEditor(
        lesson,
        currentUser
    );

    // --------------------------------------------------------
    // Nút chạy code
    // --------------------------------------------------------

    setupRunButton(
        lesson
    );

    // --------------------------------------------------------
    // Nút nộp bài (AI chấm & đánh giá)
    // --------------------------------------------------------

    setupSubmitButton(
        lesson,
        currentUser
    );

    // --------------------------------------------------------
    // Điều hướng bài trước / bài sau
    // --------------------------------------------------------

    setupLessonNavigation(
        lesson,
        lessons
    );

    // --------------------------------------------------------
    // Hiển thị tiến độ khóa học
    // --------------------------------------------------------

    updateLessonProgress(
        currentUser,
        lessons
    );

    // --------------------------------------------------------
    // Trợ lý AI Trợ Giảng C++ 24/7
    // --------------------------------------------------------
    setupAiMentorWidget(
        lesson,
        currentUser
    );
});


// ============================================================
// HIỂN THỊ BÀI HỌC
// ============================================================

function renderLesson(
    lesson,
    user
) {
    // --------------------------------------------------------
    // Tiêu đề & Breadcrumb
    // --------------------------------------------------------

    setText(
        "lessonTitle",
        lesson.title || "Bài học C++"
    );

    setText(
        "breadcrumbLesson",
        lesson.title || "Bài học C++"
    );


    // --------------------------------------------------------
    // Chapter
    // --------------------------------------------------------

    setText(
        "lessonChapter",
        lesson.chapter || "C++ Cơ bản"
    );


    // --------------------------------------------------------
    // Mô tả
    // --------------------------------------------------------

    setText(
        "lessonDescription",
        lesson.description ||
        "Học kiến thức C++ cơ bản."
    );


    // --------------------------------------------------------
    // Level
    // --------------------------------------------------------

    setText(
        "lessonLevel",
        lesson.level || "Cơ bản"
    );


    // --------------------------------------------------------
    // Thời lượng
    // --------------------------------------------------------

    setText(
        "lessonDuration",
        lesson.duration || "15 phút"
    );


    // --------------------------------------------------------
    // Nội dung lý thuyết
    // --------------------------------------------------------

    const theoryElement =
        document.getElementById("lessonContent") ||
        document.getElementById("lessonTheory");

    if (theoryElement) {
        theoryElement.innerHTML =
            formatLessonContent(
                lesson.content ||
                lesson.theory ||
                "Chưa có nội dung lý thuyết."
            );
    }


    // --------------------------------------------------------
    // Code mẫu
    // --------------------------------------------------------

    const exampleCode =
        document.getElementById("lessonExampleCode") ||
        document.getElementById("exampleCode");

    if (exampleCode) {
        exampleCode.textContent =
            lesson.example ||
            lesson.exampleCode ||
            `#include <iostream>

using namespace std;

int main() {
    cout << "Hello C++!";
    return 0;
}`;
    }


    // --------------------------------------------------------
    // Tiêu đề & Bài tập ban đầu sẽ do switchExercise phụ trách
    // --------------------------------------------------------
    // (Được khởi tạo chi tiết trong setupExerciseTabs)

    // --------------------------------------------------------
    // Hiển thị trạng thái bài
    // --------------------------------------------------------

    const progress =
        CppStorage.getUserProgress(
            user.id
        );

    const lessonProgress =
        progress[lesson.id];

    updateLessonStatus(
        lessonProgress
    );
}


// ============================================================
// KHỞI TẠO & QUẢN LÝ 3 BÀI TẬP (EXERCISES ENGINE)
// ============================================================

function initLessonExercises(lesson) {
    if (window.getLessonExercises && typeof window.getLessonExercises === "function") {
        currentLessonExercises = window.getLessonExercises(lesson);
    } else if (window.CppExercisesData && window.CppExercisesData[lesson.id]) {
        currentLessonExercises = window.CppExercisesData[lesson.id];
    } else {
        const starter = lesson.starterCode || `#include <iostream>\nusing namespace std;\n\nint main() {\n    // Viết code của bạn ở đây\n\n    return 0;\n}`;
        currentLessonExercises = [
            {
                id: "ex-1",
                title: lesson.exerciseTitle || "Cú pháp nền tảng",
                level: "Cơ bản",
                difficulty: "easy",
                points: 100,
                description: lesson.exerciseDescription || "Viết chương trình C++ theo yêu cầu cơ bản của bài học.",
                starterCode: starter,
                expectedOutput: "Thanh cong",
                hint: "Áp dụng cú pháp lý thuyết đã học ở phần trên.",
                testKeywords: ["cout", "main", "return 0", "#include"]
            },
            {
                id: "ex-2",
                title: "Vận dụng giải quyết vấn đề",
                level: "Vận dụng",
                difficulty: "medium",
                points: 100,
                description: `Vận dụng các câu lệnh đã học của chuyên đề <strong>${lesson.title || ""}</strong> để xử lý logic hoàn chỉnh.`,
                starterCode: starter,
                expectedOutput: "Ket qua hop le",
                hint: "Sử dụng câu lệnh điều khiển hoặc biến để xử lý logic bài toán.",
                testKeywords: ["cout", "cin", "main"]
            },
            {
                id: "ex-3",
                title: "Thử thách thuật toán nâng cao",
                level: "Thử thách",
                difficulty: "hard",
                points: 100,
                description: `Tối ưu hóa thuật toán và xử lý các trường hợp biên nâng cao cho bài <strong>${lesson.title || ""}</strong>.`,
                starterCode: starter,
                expectedOutput: "Chinh xac",
                hint: "Kiểm tra kỹ các trường hợp biên và tối ưu mã nguồn để đạt điểm tuyệt đối.",
                testKeywords: ["main", "return"]
            }
        ];
    }
}

function getExerciseStorageKey(userId, lessonId, index) {
    return `codelearn_code_${userId}_${lessonId}_ex_${index}`;
}

function getExerciseResultKey(userId, lessonId, index) {
    return `codelearn_eval_${userId}_${lessonId}_ex_${index}`;
}

function updateExerciseTabStatuses(user, lesson) {
    for (let i = 0; i < currentLessonExercises.length; i++) {
        const statusIcon = document.getElementById(`tabStatus${i}`);
        if (!statusIcon) continue;

        const resKey = getExerciseResultKey(user.id, lesson.id, i);
        let savedResult = null;
        try {
            const raw = localStorage.getItem(resKey);
            if (raw) savedResult = JSON.parse(raw);
        } catch (e) {}

        if (savedResult && savedResult.score >= 60) {
            statusIcon.textContent = "✅";
            statusIcon.title = `Đã hoàn thành (${savedResult.score}/100)`;
        } else if (savedResult && savedResult.score > 0) {
            statusIcon.textContent = "📝";
            statusIcon.title = `Đã làm (${savedResult.score}/100)`;
        } else {
            statusIcon.textContent = "⏳";
            statusIcon.title = "Chưa làm";
        }
    }
}

function setupExerciseTabs(lesson, user) {
    // Gắn sự kiện chuyển tab
    const tabBtns = document.querySelectorAll(".exercise-tab-btn");
    tabBtns.forEach((btn) => {
        btn.addEventListener("click", () => {
            const targetIndex = parseInt(btn.getAttribute("data-index"), 10) || 0;
            switchExercise(targetIndex, user, lesson);
        });
    });

    // Gắn sự kiện nút Gợi ý AI
    const btnHint = document.getElementById("btnHintToggle");
    const hintBox = document.getElementById("exerciseAiHintBox");
    if (btnHint && hintBox) {
        btnHint.addEventListener("click", () => {
            const isHidden = hintBox.hidden;
            hintBox.hidden = !isHidden;
            btnHint.textContent = isHidden ? "💡 Ẩn gợi ý" : "💡 Gợi ý AI";
            btnHint.classList.toggle("active", isHidden);
        });
    }

    // Mặc định hiển thị bài 1
    switchExercise(0, user, lesson);
}

function switchExercise(index, user, lesson) {
    const editor = document.getElementById("codeEditor");
    if (editor) {
        // Lưu code bài tập trước khi chuyển
        const prevCode = editor.value;
        const prevKey = getExerciseStorageKey(user.id, lesson.id, activeExerciseIndex);
        localStorage.setItem(prevKey, prevCode);
        if (activeExerciseIndex === 0 && window.CppStorage && typeof CppStorage.saveLessonCode === "function") {
            CppStorage.saveLessonCode(user.id, lesson.id, prevCode);
        }
    }

    activeExerciseIndex = index;

    // Cập nhật trạng thái active của tab buttons
    const tabBtns = document.querySelectorAll(".exercise-tab-btn");
    tabBtns.forEach((btn, idx) => {
        if (idx === index) {
            btn.classList.add("active");
            btn.setAttribute("aria-selected", "true");
        } else {
            btn.classList.remove("active");
            btn.setAttribute("aria-selected", "false");
        }
    });

    const ex = currentLessonExercises[index] || currentLessonExercises[0];
    if (!ex) return;

    // Cập nhật Badge độ khó
    const levelTag = document.getElementById("exerciseLevelTag");
    if (levelTag) {
        levelTag.textContent = ex.level || "Cơ bản";
        levelTag.className = "exercise-level-tag";
        if (ex.difficulty === "easy" || ex.level === "Cơ bản") {
            levelTag.classList.add("tag-easy");
        } else if (ex.difficulty === "medium" || ex.level === "Vận dụng") {
            levelTag.classList.add("tag-medium");
        } else {
            levelTag.classList.add("tag-hard");
        }
    }

    // Cập nhật điểm
    const pointsTag = document.getElementById("exercisePointsTag");
    if (pointsTag) {
        pointsTag.textContent = `⭐ ${ex.points || 100} điểm`;
    }

    // Cập nhật tiêu đề bài
    setText("exerciseTitle", `Bài tập ${index + 1}: ${ex.title}`);

    // Cập nhật mô tả đề bài
    const descElem = document.getElementById("exerciseDescription");
    if (descElem) {
        descElem.innerHTML = formatLessonContent(ex.description || "");
    }

    // Reset khung gợi ý
    const hintBox = document.getElementById("exerciseAiHintBox");
    const hintText = document.getElementById("exerciseAiHintText");
    const btnHint = document.getElementById("btnHintToggle");
    if (hintBox) hintBox.hidden = true;
    if (btnHint) {
        btnHint.textContent = "💡 Gợi ý AI";
        btnHint.classList.remove("active");
    }
    if (hintText) {
        hintText.innerHTML = formatLessonContent(ex.hint || "Vận dụng lý thuyết đã học ở phía trên.");
    }

    // Reset console output
    const outputElem = document.getElementById("outputData") || document.getElementById("codeOutput");
    if (outputElem) {
        outputElem.textContent = "Chưa có kết quả.";
    }

    // Nạp code của bài tập này
    if (editor) {
        const savedExCode = localStorage.getItem(getExerciseStorageKey(user.id, lesson.id, index));
        const legacyCode = index === 0 ? CppStorage.getLessonCode(user.id, lesson.id) : null;
        editor.value = savedExCode || legacyCode || ex.starterCode || "";
    }

    // Kiểm tra và hiển thị kết quả AI feedback đã lưu (nếu có)
    const resKey = getExerciseResultKey(user.id, lesson.id, index);
    let savedResult = null;
    try {
        const raw = localStorage.getItem(resKey);
        if (raw) savedResult = JSON.parse(raw);
    } catch (e) {}

    const feedbackBox = document.getElementById("aiFeedback");
    if (savedResult && feedbackBox) {
        showGradingResult(savedResult);
    } else if (feedbackBox) {
        feedbackBox.hidden = true;
        feedbackBox.setAttribute("hidden", "true");
        feedbackBox.style.display = "none";
    }

    updateExerciseTabStatuses(user, lesson);
}


// ============================================================
// CODE EDITOR
// ============================================================

function setupCodeEditor(
    lesson,
    user
) {
    const editor =
        document.getElementById(
            "codeEditor"
        );

    if (!editor) {
        return;
    }

    // --------------------------------------------------------
    // Đánh số dòng (Line Numbers Gutter)
    // --------------------------------------------------------
    const lineNumbersElem = document.getElementById("editorLineNumbers");
    function updateLineNumbers() {
        if (!lineNumbersElem) return;
        const lineCount = (editor.value || "").split("\n").length;
        const numbers = [];
        for (let i = 1; i <= Math.max(1, lineCount); i++) {
            numbers.push(i);
        }
        lineNumbersElem.textContent = numbers.join("\n");
    }
    window.updateEditorLineNumbers = updateLineNumbers;
    updateLineNumbers();

    editor.addEventListener("scroll", () => {
        if (lineNumbersElem) {
            lineNumbersElem.scrollTop = editor.scrollTop;
        }
    });

    // --------------------------------------------------------
    // Phím tắt Tab (4 spaces), Auto-close Brackets, Ctrl+Enter (Run)
    // --------------------------------------------------------
    editor.addEventListener("keydown", (e) => {
        // Ctrl + Enter hoặc Cmd + Enter -> Chạy thử code
        if ((e.ctrlKey || e.metaKey) && e.key === "Enter") {
            e.preventDefault();
            const runBtn = document.getElementById("runCodeButton");
            if (runBtn && !runBtn.disabled) runBtn.click();
            return;
        }

        // Tab -> Thụt lề 4 space chuẩn C++
        if (e.key === "Tab") {
            e.preventDefault();
            const start = editor.selectionStart;
            const end = editor.selectionEnd;
            const val = editor.value;
            editor.value = val.substring(0, start) + "    " + val.substring(end);
            editor.selectionStart = editor.selectionEnd = start + 4;
            updateLineNumbers();
            editor.dispatchEvent(new Event("input"));
            return;
        }

        // Tự động đóng cặp ngoặc và dấu nháy
        const pairs = {
            "{": "}",
            "(": ")",
            "[": "]",
            "\"": "\"",
            "'": "'"
        };
        if (pairs[e.key] && editor.selectionStart === editor.selectionEnd) {
            const openChar = e.key;
            const closeChar = pairs[e.key];
            const start = editor.selectionStart;
            const val = editor.value;
            e.preventDefault();
            editor.value = val.substring(0, start) + openChar + closeChar + val.substring(start);
            editor.selectionStart = editor.selectionEnd = start + 1;
            updateLineNumbers();
            editor.dispatchEvent(new Event("input"));
            return;
        }
    });

    // --------------------------------------------------------
    // Nút Tự động Căn lề & Format Code (Format Code Button)
    // --------------------------------------------------------
    const formatBtn = document.getElementById("formatCodeButton");
    if (formatBtn) {
        formatBtn.addEventListener("click", () => {
            const lines = (editor.value || "").split("\n");
            let indentLevel = 0;
            const formatted = [];
            for (let rawLine of lines) {
                let line = rawLine.trim();
                if (line.startsWith("}") || line.startsWith("};")) {
                    indentLevel = Math.max(0, indentLevel - 1);
                }
                const indentStr = "    ".repeat(indentLevel);
                formatted.push(line.length ? indentStr + line : "");
                if (line.endsWith("{")) {
                    indentLevel++;
                }
            }
            editor.value = formatted.join("\n");
            updateLineNumbers();
            editor.dispatchEvent(new Event("input"));
            const orig = formatBtn.textContent;
            formatBtn.textContent = "✓ Đã Format!";
            setTimeout(() => { formatBtn.textContent = orig; }, 1500);
        });
    }

    // --------------------------------------------------------
    // Lưu code tự động theo từng bài tập
    // --------------------------------------------------------

    editor.addEventListener(
        "input",
        () => {
            updateLineNumbers();
            const code = editor.value;
            const codeKey = getExerciseStorageKey(user.id, lesson.id, activeExerciseIndex);
            localStorage.setItem(codeKey, code);

            if (activeExerciseIndex === 0 && window.CppStorage && typeof CppStorage.saveLessonCode === "function") {
                CppStorage.saveLessonCode(
                    user.id,
                    lesson.id,
                    code
                );
            }
        }
    );


    // --------------------------------------------------------
    // Nút Đặt lại code cho bài tập đang chọn
    // --------------------------------------------------------

    const resetBtn = document.getElementById("resetCodeButton");
    if (resetBtn) {
        resetBtn.addEventListener("click", () => {
            const ex = currentLessonExercises[activeExerciseIndex] || currentLessonExercises[0];
            const confirmed = window.confirm(
                `Bạn có chắc muốn đặt lại code về trạng thái ban đầu của Bài tập ${activeExerciseIndex + 1} không?`
            );
            if (confirmed) {
                editor.value = (ex && ex.starterCode) || lesson.starterCode || "";
                updateLineNumbers();
                const codeKey = getExerciseStorageKey(user.id, lesson.id, activeExerciseIndex);
                localStorage.setItem(codeKey, editor.value);
                if (activeExerciseIndex === 0 && window.CppStorage && typeof CppStorage.saveLessonCode === "function") {
                    CppStorage.saveLessonCode(user.id, lesson.id, editor.value);
                }
            }
        });
    }


    // --------------------------------------------------------
    // Nút Sao chép code editor
    // --------------------------------------------------------

    const copyBtn = document.getElementById("copyCodeButton");
    if (copyBtn) {
        copyBtn.addEventListener("click", () => {
            if (navigator.clipboard) {
                navigator.clipboard.writeText(editor.value).then(() => {
                    const originalText = copyBtn.textContent;
                    copyBtn.textContent = "✓ Đã chép!";
                    setTimeout(() => {
                        copyBtn.textContent = originalText;
                    }, 1500);
                });
            } else {
                editor.select();
                document.execCommand("copy");
            }
        });
    }


    // --------------------------------------------------------
    // Nút Sao chép code ví dụ
    // --------------------------------------------------------

    const copyExampleBtn = document.getElementById("copyExampleButton");
    const exampleCodeElem =
        document.getElementById("lessonExampleCode") ||
        document.getElementById("exampleCode");

    if (copyExampleBtn && exampleCodeElem) {
        copyExampleBtn.addEventListener("click", () => {
            const textToCopy = exampleCodeElem.textContent;
            if (navigator.clipboard) {
                navigator.clipboard.writeText(textToCopy).then(() => {
                    const originalText = copyExampleBtn.textContent;
                    copyExampleBtn.textContent = "✓ Đã chép!";
                    setTimeout(() => {
                        copyExampleBtn.textContent = originalText;
                    }, 1500);
                });
            }
        });
    }


    // --------------------------------------------------------
    // Tab trong textarea
    // --------------------------------------------------------

    editor.addEventListener(
        "keydown",
        event => {

            if (event.key !== "Tab") {
                return;
            }

            event.preventDefault();

            const start =
                editor.selectionStart;

            const end =
                editor.selectionEnd;

            const value =
                editor.value;

            editor.value =
                value.substring(0, start) +
                "    " +
                value.substring(end);

            editor.selectionStart =
                start + 4;

            editor.selectionEnd =
                start + 4;
        }
    );
}


// ============================================================
// CHẠY CODE
// ============================================================

function setupRunButton(
    lesson
) {
    const button =
        document.getElementById(
            "runCodeButton"
        );

    if (!button) {
        return;
    }

    button.addEventListener(
        "click",
        () => {

            const editor =
                document.getElementById(
                    "codeEditor"
                );

            const output =
                document.getElementById("outputData") ||
                document.getElementById("codeOutput");

            const inputElem =
                document.getElementById("inputData");

            const inputVal = inputElem ? inputElem.value : "";

            if (!editor || !output) {
                return;
            }

            const code =
                editor.value.trim();


            if (!code) {
                output.textContent =
                    "⚠️ Bạn chưa nhập code.";

                return;
            }


            // ------------------------------------------------
            // Biên dịch và chạy mã nguồn C++
            // ------------------------------------------------

            button.disabled = true;
            button.textContent = "Đang biên dịch C++...";
            output.textContent = "⏳ Đang kết nối trình biên dịch g++ và chạy chương trình...";

            // Kiểm tra Backend API trước
            if (window.CodeLearnApi && typeof CodeLearnApi.compiler?.compile === "function") {
                CodeLearnApi.compiler.compile(code, inputVal)
                    .then(res => {
                        button.disabled = false;
                        button.textContent = "▶ Chạy thử";

                        if (res.success) {
                            const outText = res.output ? res.output : "(Chương trình chạy thành công không có output)";
                            const footer = `\n\n--------------------------------\n[Biên dịch thành công với ${res.compiler || 'g++ 13.2.0'} - Thời gian: ${res.execution_time_ms}ms]`;
                            output.textContent = outText + footer;
                        } else {
                            const errText = res.error || res.output || "Lỗi thực thi không xác định.";
                            const stageName = res.stage === "compile" ? "Lỗi biên dịch (Compile Error)" : "Lỗi thực thi (Runtime Error)";
                            const footer = `\n\n--------------------------------\n[${stageName} - ${res.compiler || 'g++'}]`;
                            output.textContent = errText + footer;
                        }
                    })
                    .catch(() => {
                        // Fallback sang mô phỏng nếu máy chủ chưa bật
                        const result = simulateCppExecution(code, lesson, inputVal);
                        output.textContent = result.output;
                        button.disabled = false;
                        button.textContent = "▶ Chạy thử";
                    });
            } else {
                setTimeout(() => {
                    const result = simulateCppExecution(code, lesson, inputVal);
                    output.textContent = result.output;
                    button.disabled = false;
                    button.textContent = "▶ Chạy thử";
                }, 400);
            }
        }
    );
}


// ============================================================
// MÔ PHỎNG CHẠY C++
// ============================================================
//
// Lưu ý:
// JavaScript trên trình duyệt KHÔNG thực sự biên dịch C++.
// Hàm này chỉ mô phỏng kết quả để demo giao diện.
// Muốn chạy C++ thật cần backend/compiler sandbox.
// ============================================================

function simulateCppExecution(
    code,
    lesson
) {
    const normalized =
        code.toLowerCase();


    // --------------------------------------------------------
    // Code rỗng
    // --------------------------------------------------------

    if (!code.trim()) {
        return {
            success: false,
            output:
                "Không có code để chạy."
        };
    }


    // --------------------------------------------------------
    // Kiểm tra một số lỗi cú pháp cơ bản
    // --------------------------------------------------------

    if (
        !code.includes("#include") &&
        !code.includes("iostream")
    ) {
        return {
            success: false,
            output:
                "⚠️ Có vẻ bạn chưa khai báo thư viện cần thiết."
        };
    }


    if (
        code.includes("cout") &&
        !code.includes(";")
    ) {
        return {
            success: false,
            output:
                "⚠️ Có thể bạn đang thiếu dấu ';'."
        };
    }


    // --------------------------------------------------------
    // Mô phỏng cout
    // --------------------------------------------------------

    const coutMatches =
        [
            ...code.matchAll(
                /cout\s*<<\s*["'`](.*?)["'`]/g
            )
        ];


    if (coutMatches.length > 0) {

        const outputs =
            coutMatches.map(
                match => match[1]
            );

        return {
            success: true,
            output:
                outputs.join("\n") +
                "\n\n✓ Chương trình chạy thành công."
        };
    }


    // --------------------------------------------------------
    // Nếu chưa phát hiện cout
    // --------------------------------------------------------

    return {
        success: true,
        output:
            "✓ Code đã được kiểm tra cơ bản.\n\n" +
            "Chưa phát hiện lỗi cú pháp đơn giản.\n" +
            "Bạn có thể tiếp tục hoàn thiện chương trình."
    };
}


// ============================================================
// NỘP BÀI
// ============================================================

function setupSubmitButton(
    lesson,
    user
) {
    const button =
        document.getElementById(
            "submitCodeButton"
        );

    if (!button) {
        return;
    }

    button.addEventListener(
        "click",
        () => {
            const editor =
                document.getElementById(
                    "codeEditor"
                );

            if (!editor) {
                return;
            }

            const code =
                editor.value.trim();

            if (!code) {
                alert("⚠️ Bạn cần viết mã nguồn C++ trước khi nộp bài để AI chấm điểm!");
                return;
            }

            button.disabled = true;
            const originalBtnHtml = button.innerHTML;
            button.innerHTML = `<span>⏳</span> Đang chấm code & AI đánh giá...`;

            const ex = currentLessonExercises[activeExerciseIndex] || currentLessonExercises[0] || {};

            const processGrading = (result) => {
                // 1. Lưu kết quả bài tập hiện tại
                const resKey = getExerciseResultKey(user.id, lesson.id, activeExerciseIndex);
                localStorage.setItem(resKey, JSON.stringify(result));

                const codeKey = getExerciseStorageKey(user.id, lesson.id, activeExerciseIndex);
                localStorage.setItem(codeKey, code);
                if (activeExerciseIndex === 0 && window.CppStorage && typeof CppStorage.saveLessonCode === "function") {
                    CppStorage.saveLessonCode(user.id, lesson.id, code);
                }

                // 2. Cập nhật tiến độ bài học tổng thể
                if (window.CppStorage && typeof CppStorage.saveLessonProgress === "function") {
                    CppStorage.saveLessonProgress(
                        user.id,
                        lesson.id,
                        {
                            completed: result.completed,
                            score: result.score,
                            submittedCode: code,
                            feedback: [result.strengths, result.improvements],
                            submittedAt: new Date().toISOString()
                        }
                    );
                }

                // 3. Cập nhật icon trên các tab bài tập
                updateExerciseTabStatuses(user, lesson);

                // 4. Hiển thị bảng đánh giá AI
                showGradingResult(result);

                // 5. Cập nhật trạng thái bài học chung
                updateLessonStatus({
                    completed: result.completed,
                    score: result.score
                });

                button.disabled = false;
                button.innerHTML = originalBtnHtml;

                // Cuộn mượt xuống bảng đánh giá
                const feedbackBox = document.getElementById("aiFeedback");
                if (feedbackBox) {
                    feedbackBox.scrollIntoView({
                        behavior: "smooth",
                        block: "start"
                    });
                }
            };

            // Thử gọi backend AI evaluator trước
            if (window.CodeLearnApi && typeof CodeLearnApi.compiler?.submitExercise === "function") {
                const inputElem = document.getElementById("inputData");
                const inputVal = inputElem ? inputElem.value : "";
                CodeLearnApi.compiler.submitExercise(lesson.id, ex.id, code, inputVal)
                    .then(evalRes => {
                        const adapted = {
                            completed: evalRes.passed,
                            score: evalRes.score,
                            comprehensionLevel: evalRes.comprehensionLevel,
                            comprehensionPercent: evalRes.comprehensionPercent,
                            summary: evalRes.summary,
                            advice: evalRes.advice,
                            strengths: evalRes.strengths,
                            improvements: evalRes.improvements,
                            testCases: evalRes.testCases,
                            execution: evalRes.execution,
                            aiReview: evalRes.aiReview,
                            vnoiBenchmark: evalRes.vnoiBenchmark
                        };
                        processGrading(adapted);
                    })
                    .catch(() => {
                        // Fallback sang chấm client-side
                        const result = gradeCode(code, lesson, activeExerciseIndex);
                        processGrading(result);
                    });
            } else {
                setTimeout(() => {
                    const result = gradeCode(code, lesson, activeExerciseIndex);
                    processGrading(result);
                }, 500);
            }
        }
    );
}


// ============================================================
// CHẤM CODE & ĐÁNH GIÁ MỨC ĐỘ HIỂU BÀI (AI EVALUATOR ENGINE)
// ============================================================

function gradeCode(
    code,
    lesson,
    exerciseIndex = activeExerciseIndex
) {
    const ex = currentLessonExercises[exerciseIndex] || currentLessonExercises[0] || {};
    const normalized = code.toLowerCase();
    let score = 0;
    const strengths = [];
    const improvements = [];

    // --------------------------------------------------------
    // 1. Khai báo thư viện & Không gian tên (20 điểm)
    // --------------------------------------------------------
    if (normalized.includes("#include") && normalized.includes("iostream")) {
        score += 15;
        strengths.push("Đã khai báo thư viện `<iostream>` chuẩn mực.");
    } else {
        improvements.push("Thiếu khai báo thư viện `#include <iostream>` ở đầu file.");
    }

    if (normalized.includes("using namespace std")) {
        score += 5;
        strengths.push("Sử dụng không gian tên `using namespace std;` giúp cú pháp gọn gàng.");
    }

    // --------------------------------------------------------
    // 2. Cấu trúc hàm main() & Khối lệnh (25 điểm)
    // --------------------------------------------------------
    if (/\bint\s+main\s*\(/.test(code)) {
        score += 15;
        strengths.push("Khai báo hàm `int main()` chính xác theo chuẩn C++ hiện đại.");
    } else {
        improvements.push("Chương trình cần có hàm `int main()` làm điểm khởi đầu thực thi.");
    }

    const openBraces = (code.match(/\{/g) || []).length;
    const closeBraces = (code.match(/\}/g) || []).length;
    if (openBraces > 0 && openBraces === closeBraces) {
        score += 5;
        strengths.push("Cấu trúc khối lệnh `{ }` đóng mở cân đối, chuẩn xác.");
    } else if (openBraces !== closeBraces) {
        improvements.push(`Số lượng ngoặc nhọn mở '{' (${openBraces}) không khớp với đóng '}' (${closeBraces}).`);
    }

    if (normalized.includes("return 0")) {
        score += 5;
        strengths.push("Có câu lệnh `return 0;` kết thúc chương trình an toàn.");
    } else {
        improvements.push("Nên bổ sung câu lệnh `return 0;` trước dấu đóng ngoặc của main().");
    }

    // --------------------------------------------------------
    // 3. Phù hợp yêu cầu đề bài & Từ khóa cốt lõi (40 điểm)
    // --------------------------------------------------------
    const testKeywords = ex.testKeywords || [];
    if (testKeywords.length > 0) {
        let matchedCount = 0;
        testKeywords.forEach(kw => {
            if (normalized.includes(kw.toLowerCase())) {
                matchedCount++;
            }
        });

        const kwPoints = Math.round((matchedCount / testKeywords.length) * 40);
        score += kwPoints;

        if (matchedCount === testKeywords.length) {
            strengths.push(`Áp dụng hoàn hảo tất cả các kỹ thuật và từ khóa trọng tâm: [${testKeywords.join(", ")}].`);
        } else if (matchedCount > 0) {
            strengths.push(`Đã vận dụng được một số yêu cầu cốt lõi của bài toán (${matchedCount}/${testKeywords.length} từ khóa).`);
            const missing = testKeywords.filter(k => !normalized.includes(k.toLowerCase()));
            improvements.push(`Cần bổ sung thêm các yếu tố logic chuyên đề: [${missing.join(", ")}].`);
        } else {
            improvements.push(`Chưa tìm thấy các từ khóa hoặc câu lệnh yêu cầu của bài tập: [${testKeywords.join(", ")}].`);
        }
    } else {
        if (normalized.includes("cout")) score += 20;
        if (normalized.includes("cin")) score += 15;
        if (code.includes(";")) score += 5;
    }

    // --------------------------------------------------------
    // 4. Mô phỏng chạy code & Kiểm tra kết quả (15 điểm)
    // --------------------------------------------------------
    const sim = simulateCppExecution(code, lesson);
    if (sim && sim.success) {
        score += 15;
        strengths.push("Mã nguồn biên dịch thành công, dòng lệnh xuất kết quả rõ ràng.");
    } else {
        improvements.push("Kiểm tra lại cú pháp dấu chấm phẩy ';' hoặc toán tử xuất << để chạy trơn tru.");
    }

    // Giới hạn điểm 0 - 100
    score = Math.max(10, Math.min(100, score));

    // --------------------------------------------------------
    // 5. Đánh giá Mức độ hiểu bài (Comprehension Evaluation)
    // --------------------------------------------------------
    let comprehensionLevel = "";
    let advice = "";

    if (score >= 90) {
        comprehensionLevel = "Thấu hiểu xuất sắc";
        advice = `Học viên làm chủ tuyệt đối kiến thức chuyên đề "${lesson.title}". Cú pháp gãy gọn, tư duy giải quyết vấn đề mạch lạc. Bạn đã sẵn sàng chinh phục các bài tập thử thách cao hơn!`;
    } else if (score >= 75) {
        comprehensionLevel = "Nắm chắc kiến thức";
        advice = `Học viên hiểu rõ bản chất bài học và áp dụng tốt vào code thực tế. Chỉ cần chú ý thêm chi tiết định dạng xuất hoặc các trường hợp biên nhỏ để đạt 100 điểm tuyệt đối.`;
    } else if (score >= 50) {
        comprehensionLevel = "Mức độ cơ bản";
        advice = `Học viên đã nắm được khung cơ bản của bài tập. Hãy bấm nút "💡 Gợi ý AI" ở phía trên và rà soát lại các điểm cần cải thiện để nâng cao điểm số nhé.`;
    } else {
        comprehensionLevel = "Cần ôn luyện thêm";
        advice = `Bạn đang còn đôi chút bỡ ngỡ với bài toán này. Hãy kéo lên xem lại phần lý thuyết ở Mục 01 và tham khảo Code mẫu ở Mục 02, sau đó bấm "↻ Đặt lại" để thực hành lại nhé!`;
    }

    if (strengths.length === 0) {
        strengths.push("Đã chủ động viết code C++ và nộp bài kiểm tra kiến thức.");
    }
    if (improvements.length === 0) {
        improvements.push("Code sạch đẹp, chuẩn quy ước C++. Tiếp tục phát huy!");
    }

    return {
        score,
        completed: score >= 60,
        comprehensionLevel,
        comprehensionPercent: score,
        strengths: strengths.join(" "),
        improvements: improvements.join(" "),
        advice,
        summary: `Hệ thống AI đánh giá học viên đạt ${score}/100 điểm với mức độ "${comprehensionLevel}" cho bài tập này.`
    };
}


// ============================================================
// HIỂN THỊ BẢNG ĐÁNH GIÁ MỨC ĐỘ HIỂU BÀI
// ============================================================

function showGradingResult(
    result
) {
    const feedbackBox =
        document.getElementById(
            "aiFeedback"
        );

    if (!feedbackBox) {
        return;
    }

    feedbackBox.hidden = false;
    feedbackBox.removeAttribute("hidden");
    feedbackBox.style.display = "block";

    // Điểm số
    const scoreElem = document.getElementById("aiScore");
    if (scoreElem) {
        scoreElem.textContent = result.score;
    }

    // Mức độ hiểu bài & màu sắc
    const resultElem = document.getElementById("aiResult");
    if (resultElem) {
        resultElem.textContent = result.comprehensionLevel || (result.score >= 60 ? "Đạt yêu cầu" : "Cần ôn luyện");
        if (result.score >= 90) {
            resultElem.style.color = "#10b981"; // xanh ngọc
        } else if (result.score >= 75) {
            resultElem.style.color = "#7364f2"; // tím jewel starry lilac
        } else if (result.score >= 50) {
            resultElem.style.color = "#f59e0b"; // cam
        } else {
            resultElem.style.color = "#ef4444"; // đỏ
        }
    }

    // Thanh tiến độ Mức độ hiểu bài (Animated Meter Fill)
    const meterFill = document.getElementById("aiComprehensionFill");
    if (meterFill) {
        meterFill.style.width = "0%";
        if (result.score >= 90) {
            meterFill.style.background = "linear-gradient(90deg, #10b981, #059669)";
        } else if (result.score >= 75) {
            meterFill.style.background = "linear-gradient(90deg, #b3a8f8, #7364f2)";
        } else if (result.score >= 50) {
            meterFill.style.background = "linear-gradient(90deg, #f59e0b, #d97706)";
        } else {
            meterFill.style.background = "linear-gradient(90deg, #ef4444, #dc2626)";
        }

        setTimeout(() => {
            meterFill.style.width = `${result.comprehensionPercent || result.score}%`;
        }, 80);
    }

    // Phần trăm
    const percentElem = document.getElementById("aiComprehensionPercent");
    if (percentElem) {
        percentElem.textContent = `${result.comprehensionPercent || result.score}%`;
    }

    // Hiệu ứng ăn mừng và thông báo tương tác
    if (result.score >= 80) {
        if (typeof window.triggerConfetti === "function") {
            window.triggerConfetti();
        }
        if (typeof window.showToast === "function") {
            window.showToast(`🎉 Xuất sắc! Bạn đạt ${result.score}/100 điểm cho bài tập này!`, "success");
        }
    } else if (result.score >= 60) {
        if (typeof window.showToast === "function") {
            window.showToast(`👍 Đạt yêu cầu (${result.score}/100 điểm). Hãy xem gợi ý AI để đạt điểm tuyệt đối nhé!`, "info");
        }
    } else {
        if (typeof window.showToast === "function") {
            window.showToast(`⚠️ Điểm số: ${result.score}/100. Hãy rà soát lại lỗi cú pháp và gợi ý của AI nhé!`, "warning");
        }
    }

    function renderFeedbackList(items, defaultText) {
        if (!items) return `<p>${defaultText}</p>`;
        if (typeof items === "string") return `<p>${formatLessonContent(items)}</p>`;
        if (Array.isArray(items)) {
            if (items.length === 0) return `<p>${defaultText}</p>`;
            return `<ul class="ai-feedback-bullet-list">` + items.map(it => `<li>${escapeHtml(it)}</li>`).join("") + `</ul>`;
        }
        return `<p>${defaultText}</p>`;
    }

    // Tóm tắt
    const summaryElem = document.getElementById("aiSummary");
    if (summaryElem) {
        summaryElem.textContent = result.summary || "Đã phân tích xong bài làm của bạn.";
    }

    // Điểm làm tốt
    const strengthElem = document.getElementById("aiStrength");
    if (strengthElem) {
        strengthElem.innerHTML = renderFeedbackList(result.strengths, "Mã nguồn rõ ràng, cấu trúc hợp lệ.");
    }

    // Cần cải thiện
    const improvElem = document.getElementById("aiImprovement");
    if (improvElem) {
        improvElem.innerHTML = renderFeedbackList(result.improvements, "Không có lỗi cú pháp nghiêm trọng.");
    }

    // Lời khuyên
    const adviceElem = document.getElementById("aiAdvice");
    if (adviceElem) {
        adviceElem.innerHTML = renderFeedbackList(result.advice, "Hãy tiếp tục thử sức với các bài tập tiếp theo!");
    }

    // Hiển thị Khối Tiêu chuẩn Thuật toán Thật (VNOI Wiki Benchmark)
    const realBox = document.getElementById("aiRealDataBenchmark");
    const realLink = document.getElementById("aiRealSourceLink");
    const realDesc = document.getElementById("aiRealStandardDesc");
    if (realBox && result.vnoiBenchmark && result.vnoiBenchmark.matched) {
        realBox.style.display = "block";
        if (realLink) {
            realLink.href = result.vnoiBenchmark.source_url || "https://github.com/VNOI-Admin/vnoi_wiki";
            realLink.textContent = "Xem bài viết gốc ↗";
        }
        if (realDesc) {
            realDesc.innerHTML = `<strong>${escapeHtml(result.vnoiBenchmark.title)}</strong> (✍️ Tác giả: <em>${escapeHtml(result.vnoiBenchmark.author || 'VNOI')}</em>): ${escapeHtml(result.vnoiBenchmark.summary)}`;
        }
    } else if (realBox) {
        realBox.style.display = "none";
    }

    // Hiển thị chi tiết Test Cases nếu có
    const testCasesBox = document.getElementById("aiTestCasesBox");
    const testCasesCount = document.getElementById("aiTestCasesCount");
    const testCasesList = document.getElementById("aiTestCasesList");

    if (testCasesBox && testCasesList && Array.isArray(result.testCases) && result.testCases.length > 0) {
        testCasesBox.hidden = false;
        testCasesBox.removeAttribute("hidden");
        const passedCount = result.testCases.filter(t => t.passed).length;
        if (testCasesCount) {
            testCasesCount.textContent = `${passedCount}/${result.testCases.length} Passed`;
            testCasesCount.style.color = (passedCount === result.testCases.length) ? "#10b981" : "#ef4444";
        }
        testCasesList.innerHTML = result.testCases.map(tc => {
            const isPass = tc.passed;
            return `
                <div class="testcase-item" style="border-left: 3px solid ${isPass ? '#10b981' : '#ef4444'};">
                    <div>
                        <strong>Test #${tc.order}:</strong>
                        <span style="color: var(--text-muted); margin-left: 6px;">${tc.isHidden ? '(Test ẩn kiểm thử)' : `Input: <code>${escapeHtml(tc.input || 'None')}</code>`}</span>
                    </div>
                    <div style="display: flex; align-items: center; gap: 8px;">
                        <span style="font-size: 0.75rem; color: var(--text-muted);">${tc.executionTimeMs || 0}ms</span>
                        <span class="testcase-badge ${isPass ? 'pass' : 'fail'}">${isPass ? '✓ Đạt' : '✕ Sai kết quả'}</span>
                    </div>
                </div>
            `;
        }).join("");
    } else if (testCasesBox) {
        testCasesBox.hidden = true;
    }

    // Nút Hỏi AI về bài làm
    const btnAskAiGrading = document.getElementById("btnAskAiAboutGrading");
    if (btnAskAiGrading) {
        btnAskAiGrading.onclick = () => {
            const mentorToggle = document.getElementById("btnToggleAiMentor");
            const mentorPanel = document.getElementById("aiMentorPanel");
            if (mentorPanel && mentorPanel.hidden && mentorToggle) {
                mentorToggle.click();
            }
            if (window._sendAiPrompt) {
                const prompt = `Chào AI, bài làm C++ vừa rồi của tôi đạt ${result.score}/100 điểm (${result.comprehensionLevel || 'Đánh giá'}). ${result.summary || ''} Hãy giải thích chi tiết nguyên nhân và hướng dẫn tôi tối ưu hóa thuật toán hoặc sửa lỗi này nhé!`;
                window._sendAiPrompt(prompt);
            }
        };
    }
}


// ============================================================
// CẬP NHẬT TRẠNG THÁI BÀI
// ============================================================

function updateLessonStatus(
    progress
) {
    if (!progress) {
        return;
    }


    const statusElement =
        document.getElementById(
            "lessonStatus"
        );


    if (statusElement) {

        if (progress.completed) {

            statusElement.textContent =
                "✓ Đã hoàn thành";

            statusElement.classList.add(
                "completed"
            );

        } else {

            statusElement.textContent =
                "Đang học";

            statusElement.classList.remove(
                "completed"
            );
        }
    }


    const scoreElement =
        document.getElementById(
            "lessonScore"
        );

    if (
        scoreElement &&
        progress.score !== undefined
    ) {
        scoreElement.textContent =
            `${progress.score}/100`;
    }
}


// ============================================================
// TIẾN ĐỘ KHÓA HỌC
// ============================================================

function updateLessonProgress(
    user,
    lessons
) {
    const progress =
        CppStorage.getUserProgress(
            user.id
        );


    const total =
        lessons.length;


    const completed =
        lessons.filter(
            lesson =>
                progress[lesson.id]?.completed === true
        ).length;


    const percent =
        total > 0
            ? Math.round(
                completed / total * 100
            )
            : 0;


    // Text
    setText(
        "courseProgressPercent",
        `${percent}%`
    );
    setText(
        "sidebarProgress",
        `${percent}%`
    );

    setText(
        "courseProgressCompleted",
        completed
    );

    setText(
        "courseProgressTotal",
        total
    );


    // Progress bar
    const progressBar =
        document.getElementById("sidebarProgressBar") ||
        document.getElementById("courseProgressBar");

    if (progressBar) {
        progressBar.style.width =
            `${percent}%`;
    }


    // Sidebar navigation
    renderCourseNavigation(
        lessons,
        progress
    );
}


// ============================================================
// SIDEBAR COURSE NAVIGATION
// ============================================================

function renderCourseNavigation(
    lessons,
    progress
) {
    const container =
        document.getElementById("courseSidebarLessons") ||
        document.getElementById("courseNavigation");

    if (!container) {
        return;
    }


    const currentId =
        new URLSearchParams(
            window.location.search
        ).get("id");


    container.innerHTML =
        lessons
            .map(
                (lesson, index) => {

                    const completed =
                        progress[
                            lesson.id
                        ]?.completed === true;


                    const active =
                        String(lesson.id).toLowerCase() === String(currentId).toLowerCase() ||
                        (lesson.id && currentId && String(lesson.id).replace(/\D/g, "") === String(currentId).replace(/\D/g, ""));


                    return `
                        <a
                            href="lesson-detail.html?id=${encodeURIComponent(
                                lesson.id
                            )}"
                            class="
                                sidebar-lesson-item
                                course-nav-item
                                ${active ? "active" : ""}
                                ${completed ? "completed" : ""}
                            "
                        >

                            <span class="course-nav-number sidebar-lesson-number">
                                ${index + 1}
                            </span>

                            <span class="course-nav-title sidebar-lesson-title">
                                ${escapeHtml(
                                    lesson.title
                                )}
                            </span>

                            <span class="course-nav-status sidebar-lesson-status">
                                ${
                                    completed
                                        ? "✓"
                                        : ""
                                }
                            </span>

                        </a>
                    `;
                }
            )
            .join("");
}


// ============================================================
// ĐIỀU HƯỚNG BÀI TRƯỚC / SAU
// ============================================================

function setupLessonNavigation(
    currentLesson,
    lessons
) {
    let currentIndex = -1;
    if (currentLesson && Array.isArray(lessons)) {
        currentIndex = lessons.findIndex(lesson => {
            if (!lesson) return false;
            if (String(lesson.id).toLowerCase() === String(currentLesson.id).toLowerCase()) return true;
            const lDigits = String(lesson.id || "").replace(/\D/g, "");
            const cDigits = String(currentLesson.id || "").replace(/\D/g, "");
            if (lDigits && cDigits && lDigits === cDigits) return true;
            const lOrder = Number(lesson.order || lesson.order_num || 0);
            const cOrder = Number(currentLesson.order || currentLesson.order_num || 0);
            return lOrder > 0 && lOrder === cOrder;
        });
    }


    const previousLesson =
        currentIndex > 0
            ? lessons[currentIndex - 1]
            : null;


    const nextLesson =
        currentIndex <
            lessons.length - 1
            ? lessons[currentIndex + 1]
            : null;


    // --------------------------------------------------------
    // Bài trước
    // --------------------------------------------------------

    const previousButton =
        document.getElementById(
            "previousLessonButton"
        );

    if (previousButton) {

        if (previousLesson) {

            previousButton.href =
                `lesson-detail.html?id=${encodeURIComponent(
                    previousLesson.id
                )}`;

            previousButton.style.display =
                "";

        } else {

            previousButton.style.display =
                "none";
        }
    }


    // --------------------------------------------------------
    // Bài tiếp theo
    // --------------------------------------------------------

    const nextButton =
        document.getElementById(
            "nextLessonButton"
        );

    if (nextButton) {

        if (nextLesson) {

            nextButton.href =
                `lesson-detail.html?id=${encodeURIComponent(
                    nextLesson.id
                )}`;

            nextButton.style.display =
                "";

        } else {
            nextButton.href = "profile.html";
            nextButton.textContent = "🎓 Nhận Chứng Chỉ Tốt Nghiệp →";
        }
    }
}


// ============================================================
// HIỂN THỊ LỖI
// ============================================================

function showLessonError(
    message
) {
    const container =
        document.querySelector(
            "main"
        );

    if (!container) {
        return;
    }

    container.innerHTML = `
        <section class="empty-state">

            <div class="empty-state-icon">
                ⚠️
            </div>

            <h2>
                Không thể mở bài học
            </h2>

            <p>
                ${escapeHtml(message)}
            </p>

            <a
                href="lessons.html"
                class="btn btn-primary"
            >
                ← Quay lại danh sách bài học
            </a>

        </section>
    `;
}


// ============================================================
// FORMAT NỘI DUNG
// ============================================================

function formatLessonContent(
    content
) {
    if (!content) {
        return "";
    }


    // Nếu nội dung đã chứa HTML
    if (
        /<[^>]+>/.test(content)
    ) {
        return content;
    }


    // Nếu là text thường
    return escapeHtml(
        content
    ).replace(
        /\n/g,
        "<br>"
    );
}


// ============================================================
// HIỂN THỊ TEXT
// ============================================================

function setText(
    id,
    value
) {
    const element =
        document.getElementById(
            id
        );

    if (element) {
        element.textContent =
            value;
    }
}


// ============================================================
// MESSAGE
// ============================================================

function showMessage(
    id,
    message,
    type = "info"
) {
    const element =
        document.getElementById(
            id
        );

    if (!element) {
        return;
    }

    element.textContent =
        message;

    element.className =
        `form-message ${type}`;
}


// ============================================================
// ESCAPE HTML
// ============================================================

function escapeHtml(
    value
) {
    if (
        value === null ||
        value === undefined
    ) {
        return "";
    }

    return String(value)
        .replace(
            /&/g,
            "&amp;"
        )
        .replace(
            /</g,
            "&lt;"
        )
        .replace(
            />/g,
            "&gt;"
        )
        .replace(
            /"/g,
            "&quot;"
        )
        .replace(
            /'/g,
            "&#039;"
        );
}


// ============================================================
// TRỢ LÝ AI TRỢ GIẢNG C++ 24/7 (AI TUTOR MENTOR)
// ============================================================

function setupAiMentorWidget(lesson, user) {
    const toggleBtn = document.getElementById("btnToggleAiMentor");
    const closeBtn = document.getElementById("btnCloseAiMentor");
    const resetBtn = document.getElementById("btnResetAiMentor");
    const settingsBtn = document.getElementById("btnAiSettings");
    const panel = document.getElementById("aiMentorPanel");
    const form = document.getElementById("aiMentorForm");
    const input = document.getElementById("aiMentorInput");
    const msgContainer = document.getElementById("aiMentorMessages");
    const chips = document.querySelectorAll(".ai-chip");
    const personaSelect = document.getElementById("aiPersonaSelect");
    const attachBtn = document.getElementById("btnAiAttachCode");
    const attachedSnippet = document.getElementById("aiAttachedSnippet");
    const removeAttachBtn = document.getElementById("btnRemoveAttachedCode");
    const voiceBtn = document.getElementById("btnAiVoice");
    
    // Settings modal elements
    const settingsModal = document.getElementById("aiSettingsModal");
    const closeSettingsBtn = document.getElementById("btnCloseAiSettings");
    const cancelSettingsBtn = document.getElementById("btnCancelAiSettings");
    const saveSettingsBtn = document.getElementById("btnSaveAiSettings");
    const inputGeminiKey = document.getElementById("inputGeminiKey");
    const inputOpenAiKey = document.getElementById("inputOpenAiKey");

    if (!panel) return;

    let chatHistory = [];
    let isCodeAttached = false;
    let lastUserQuery = "";
    let recognition = null;
    let isListening = false;

    // Load preferred persona
    const savedPersona = localStorage.getItem("ai_preferred_persona");
    if (savedPersona && personaSelect) {
        personaSelect.value = savedPersona;
    }
    if (personaSelect) {
        personaSelect.addEventListener("change", () => {
            localStorage.setItem("ai_preferred_persona", personaSelect.value);
        });
    }

    // Load Chat History from Database on startup
    async function loadChatHistory() {
        if (!window.CodeLearnApi || typeof CodeLearnApi.ai?.getHistory !== "function") return;
        try {
            const res = await CodeLearnApi.ai.getHistory(lesson ? lesson.id : "");
            if (res && Array.isArray(res.messages) && res.messages.length > 0) {
                if (msgContainer) msgContainer.innerHTML = "";
                chatHistory = [];
                res.messages.forEach(item => {
                    const isUser = item.role === "user";
                    chatHistory.push({ role: item.role, content: item.content });
                    appendMessage(item.content, isUser, false);
                });
            }
        } catch (e) {
            console.warn("Could not load AI chat history:", e);
        }
    }
    loadChatHistory();

    function openPanel() {
        panel.hidden = false;
        if (input) input.focus();
    }

    function closePanel() {
        panel.hidden = true;
    }

    if (toggleBtn) {
        toggleBtn.addEventListener("click", () => {
            if (panel.hidden) openPanel();
            else closePanel();
        });
    }

    if (closeBtn) closeBtn.addEventListener("click", closePanel);

    if (resetBtn) {
        resetBtn.addEventListener("click", async () => {
            if (confirm("Bạn có chắc muốn xóa lịch sử trò chuyện với AI?")) {
                chatHistory = [];
                if (window.CodeLearnApi && typeof CodeLearnApi.ai?.clearHistory === "function") {
                    try { await CodeLearnApi.ai.clearHistory(lesson ? lesson.id : ""); } catch (_) {}
                }
                if (msgContainer) {
                    msgContainer.innerHTML = `
                        <div class="ai-msg ai-msg-bot">
                            👋 Cuộc trò chuyện đã được làm mới! Hãy hỏi mình bất kỳ câu hỏi nào về C++, thuật toán hoặc nhờ kiểm tra code nhé!
                        </div>
                    `;
                }
            }
        });
    }

    // Attach code button toggle
    function setCodeAttachment(active) {
        isCodeAttached = active;
        if (attachedSnippet) attachedSnippet.hidden = !active;
        if (attachBtn) {
            if (active) attachBtn.classList.add("active");
            else attachBtn.classList.remove("active");
        }
    }

    if (attachBtn) {
        attachBtn.addEventListener("click", () => {
            setCodeAttachment(!isCodeAttached);
        });
    }

    if (removeAttachBtn) {
        removeAttachBtn.addEventListener("click", () => {
            setCodeAttachment(false);
        });
    }

    // Voice recognition (Speech to Text)
    const SpeechRec = window.SpeechRecognition || window.webkitSpeechRecognition;
    if (SpeechRec && voiceBtn) {
        recognition = new SpeechRec();
        recognition.lang = "vi-VN";
        recognition.continuous = false;
        recognition.interimResults = false;

        recognition.onstart = () => {
            isListening = true;
            voiceBtn.classList.add("listening");
            voiceBtn.title = "Đang lắng nghe... Hãy nói!";
        };

        recognition.onresult = (event) => {
            const transcript = event.results[0][0].transcript;
            if (input && transcript) {
                input.value = (input.value ? input.value + " " : "") + transcript;
                input.focus();
            }
        };

        recognition.onerror = () => {
            isListening = false;
            voiceBtn.classList.remove("listening");
            voiceBtn.title = "Nhập liệu bằng giọng nói";
        };

        recognition.onend = () => {
            isListening = false;
            voiceBtn.classList.remove("listening");
            voiceBtn.title = "Nhập liệu bằng giọng nói";
        };

        voiceBtn.addEventListener("click", () => {
            if (!recognition) return;
            if (isListening) {
                recognition.stop();
            } else {
                try { recognition.start(); } catch (_) {}
            }
        });
    } else if (voiceBtn) {
        voiceBtn.title = "Trình duyệt không hỗ trợ Web Speech API";
        voiceBtn.style.opacity = "0.5";
    }

    // Settings Modal
    if (settingsBtn && settingsModal) {
        settingsBtn.addEventListener("click", async () => {
            settingsModal.hidden = false;
            try {
                if (window.CodeLearnApi && typeof CodeLearnApi.ai?.getConfig === "function") {
                    const cfg = await CodeLearnApi.ai.getConfig();
                    if (cfg && cfg.provider) {
                        const info = document.getElementById("aiProviderInfo");
                        if (info) info.textContent = `Bộ não hiện tại: ${cfg.model} (${cfg.provider})`;
                    }
                }
            } catch (_) {}
        });

        const closeSettings = () => { settingsModal.hidden = true; };
        if (closeSettingsBtn) closeSettingsBtn.addEventListener("click", closeSettings);
        if (cancelSettingsBtn) cancelSettingsBtn.addEventListener("click", closeSettings);

        if (saveSettingsBtn) {
            saveSettingsBtn.addEventListener("click", async () => {
                const geminiKey = inputGeminiKey ? inputGeminiKey.value.trim() : "";
                const openaiKey = inputOpenAiKey ? inputOpenAiKey.value.trim() : "";
                try {
                    saveSettingsBtn.disabled = true;
                    saveSettingsBtn.textContent = "Đang lưu...";
                    if (window.CodeLearnApi && typeof CodeLearnApi.ai?.setConfig === "function") {
                        await CodeLearnApi.ai.setConfig({ geminiKey, openaiKey });
                    }
                    alert("✓ Đã lưu cấu hình AI thành công!");
                    closeSettings();
                } catch (err) {
                    alert("Lỗi khi lưu cấu hình: " + (err.message || "Lỗi mạng"));
                } finally {
                    saveSettingsBtn.disabled = false;
                    saveSettingsBtn.textContent = "Lưu Cấu hình";
                }
            });
        }
    }

    function appendMessage(text, isUser = false, addActions = true) {
        if (!msgContainer) return;
        const bubble = document.createElement("div");
        bubble.className = `ai-msg ${isUser ? "ai-msg-user" : "ai-msg-bot"}`;
        
        if (!isUser) {
            bubble.innerHTML = formatAiMarkdown(text);
            bindCodeBlockActions(bubble);

            if (addActions) {
                // Add Copy and Regenerate toolbar
                const actionsRow = document.createElement("div");
                actionsRow.className = "ai-msg-actions";
                actionsRow.innerHTML = `
                    <button type="button" class="ai-msg-action-btn btn-copy-reply">📋 Sao chép</button>
                    <button type="button" class="ai-msg-action-btn btn-regenerate-reply">🔄 Tạo lại</button>
                `;
                actionsRow.querySelector(".btn-copy-reply").addEventListener("click", () => {
                    if (navigator.clipboard) {
                        navigator.clipboard.writeText(text).then(() => {
                            actionsRow.querySelector(".btn-copy-reply").textContent = "✓ Đã chép!";
                            setTimeout(() => { actionsRow.querySelector(".btn-copy-reply").textContent = "📋 Sao chép"; }, 2000);
                        });
                    }
                });
                actionsRow.querySelector(".btn-regenerate-reply").addEventListener("click", () => {
                    if (lastUserQuery) {
                        sendPrompt(lastUserQuery, true);
                    }
                });
                bubble.appendChild(actionsRow);
            }
        } else {
            bubble.textContent = text;
        }

        msgContainer.appendChild(bubble);
        msgContainer.scrollTop = msgContainer.scrollHeight;
        return bubble;
    }

    function formatAiMarkdown(str) {
        if (!str) return "";
        let formatted = escapeHtml(str);

        // Fenced Code blocks
        formatted = formatted.replace(/```(?:([a-zA-Z0-9_\-+]+))?\n([\s\S]*?)```/g, (match, lang, code) => {
            const langName = (lang || "cpp").toUpperCase();
            const rawClean = code.trim();
            return `
                <div class="ai-code-wrapper">
                    <div class="ai-code-header">
                        <span>${langName}</span>
                        <div class="ai-code-actions">
                            <button type="button" class="ai-code-btn btn-copy-code" data-code="${encodeURIComponent(rawClean)}">
                                📋 Sao chép
                            </button>
                            <button type="button" class="ai-code-btn btn-apply-editor" data-code="${encodeURIComponent(rawClean)}">
                                💻 Vào Editor
                            </button>
                        </div>
                    </div>
                    <pre><code class="language-${(lang || 'cpp').toLowerCase()}">${rawClean}</code></pre>
                </div>
            `;
        });

        // Headers
        formatted = formatted.replace(/^#### (.*$)/gim, '<h5 style="margin: 8px 0 4px 0; font-size: 0.95rem; font-weight: 700;">$1</h5>');
        formatted = formatted.replace(/^### (.*$)/gim, '<h4 style="margin: 10px 0 6px 0; font-size: 1.05rem; font-weight: 800; color: var(--primary);">$1</h4>');

        // Markdown Table handling
        formatted = formatted.replace(/((?:\|[^\n]+\|\r?\n?)+)/g, (match) => {
            const lines = match.trim().split("\n").filter(l => l.trim().length > 0);
            if (lines.length < 2) return match;
            let html = '<div style="overflow-x: auto; margin: 8px 0;"><table class="ai-chat-table">';
            lines.forEach((line, idx) => {
                if (line.includes("---")) return;
                const cells = line.split("|").slice(1, -1).map(c => c.trim());
                if (idx === 0) {
                    html += '<thead><tr>' + cells.map(c => `<th>${c}</th>`).join('') + '</tr></thead><tbody>';
                } else {
                    html += '<tr>' + cells.map(c => `<td>${c}</td>`).join('') + '</tr>';
                }
            });
            html += '</tbody></table></div>';
            return html;
        });

        // Inline code `...`
        formatted = formatted.replace(/`([^`]+)`/g, '<code style="background: rgba(0,0,0,0.06); padding: 2px 6px; border-radius: 4px; font-family: monospace;">$1</code>');
        // Bold: **text**
        formatted = formatted.replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>');
        // List items
        formatted = formatted.replace(/\n- /g, '<br>• ');
        formatted = formatted.replace(/\n\d+\. /g, (m) => `<br><strong>${m.trim()}</strong> `);
        // Newlines
        formatted = formatted.replace(/\n/g, '<br>');

        return formatted;
    }

    function bindCodeBlockActions(container) {
        container.querySelectorAll(".btn-copy-code").forEach(btn => {
            btn.addEventListener("click", () => {
                const raw = decodeURIComponent(btn.getAttribute("data-code") || "");
                if (navigator.clipboard) {
                    navigator.clipboard.writeText(raw).then(() => {
                        const oldText = btn.innerHTML;
                        btn.innerHTML = "✓ Đã chép!";
                        btn.style.color = "#10b981";
                        setTimeout(() => {
                            btn.innerHTML = oldText;
                            btn.style.color = "";
                        }, 2000);
                    });
                }
            });
        });

        container.querySelectorAll(".btn-apply-editor").forEach(btn => {
            btn.addEventListener("click", () => {
                const raw = decodeURIComponent(btn.getAttribute("data-code") || "");
                const editor = document.getElementById("codeEditor");
                if (editor) {
                    editor.value = raw;
                    editor.dispatchEvent(new Event("input"));
                    btn.innerHTML = "✓ Đã đưa vào Editor!";
                    setTimeout(() => {
                        btn.innerHTML = "💻 Vào Editor";
                    }, 2000);
                    editor.scrollIntoView({ behavior: "smooth", block: "center" });
                }
            });
        });
    }

    async function sendPrompt(userMsg, isRegenerate = false) {
        if (!userMsg || !userMsg.trim()) return;

        lastUserQuery = userMsg;

        if (!isRegenerate) {
            appendMessage(userMsg, true);
            if (input) input.value = "";
            chatHistory.push({ role: "user", content: userMsg });
        }

        const typingElem = appendMessage("🤖 *AI đang suy nghĩ và phân tích...*", false, false);

        const editorElem = document.getElementById("codeEditor");
        const currentCode = (isCodeAttached || userMsg.toLowerCase().includes("code") || userMsg.toLowerCase().includes("lỗi")) && editorElem ? editorElem.value : "";
        const persona = personaSelect ? personaSelect.value : "tutor";

        try {
            if (window.CodeLearnApi && typeof CodeLearnApi.ai?.ask === "function") {
                const res = await CodeLearnApi.ai.ask(userMsg, currentCode, lesson ? lesson.id : "", chatHistory, persona);
                if (typingElem) typingElem.remove();
                const replyText = res.reply || "AI chưa có câu trả lời phù hợp, bạn hãy thử diễn đạt lại nhé.";
                appendMessage(replyText, false, true);
                chatHistory.push({ role: "assistant", content: replyText });
            } else {
                if (typingElem) typingElem.remove();
                appendMessage("💡 Hãy kiểm tra lại các từ khóa, cú pháp và dòng lệnh in `cout` theo đúng yêu cầu đề bài nhé!", false, true);
            }
        } catch (err) {
            if (typingElem) typingElem.remove();
            appendMessage(`⚠️ Không thể kết nối với AI Trợ giảng: ${err.message || "Lỗi mạng"}`, false, false);
        }
    }

    // Expose global sender so other buttons can invoke AI
    window._sendAiPrompt = (prompt) => {
        openPanel();
        sendPrompt(prompt);
    };

    if (form) {
        form.addEventListener("submit", (e) => {
            e.preventDefault();
            const val = input ? input.value : "";
            sendPrompt(val);
        });
    }

    chips.forEach(chip => {
        chip.addEventListener("click", () => {
            const prompt = chip.getAttribute("data-prompt") || chip.textContent;
            openPanel();
            sendPrompt(prompt);
        });
    });
}