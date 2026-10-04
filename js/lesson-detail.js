// ============================================================
// CODELEARN C++ - LESSON DETAIL
// File: js/lesson-detail.js
// ============================================================

document.addEventListener("DOMContentLoaded", () => {
    const currentUser = CppStorage.getCurrentUser();

    if (!currentUser) {
        return;
    }

    // --------------------------------------------------------
    // Lấy lesson ID từ URL
    // Ví dụ:
    // lesson-detail.html?id=lesson-1
    // --------------------------------------------------------

    const params = new URLSearchParams(
        window.location.search
    );

    const lessonId = params.get("id");

    const lessons = CppStorage.getLessons();

    let lesson = null;
    if (lessonId) {
        lesson = lessons.find(
            item => String(item.id) === String(lessonId)
        );
    }

    if (!lesson && lessons.length > 0) {
        lesson = lessons[0];
    }

    if (!lesson) {
        showLessonError(
            "Chưa có bài học nào trong hệ thống."
        );
        return;
    }

    // --------------------------------------------------------
    // Hiển thị bài học
    // --------------------------------------------------------

    renderLesson(
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
    // Nút nộp bài
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
    // Tiêu đề bài tập
    // --------------------------------------------------------

    setText(
        "exerciseTitle",
        lesson.exerciseTitle ||
        "Bài tập thực hành"
    );


    // --------------------------------------------------------
    // Mô tả bài tập
    // --------------------------------------------------------

    const exerciseDescription =
        document.getElementById(
            "exerciseDescription"
        );

    if (exerciseDescription) {
        exerciseDescription.innerHTML =
            formatLessonContent(
                lesson.exerciseDescription ||
                "Hãy viết chương trình C++ theo yêu cầu."
            );
    }


    // --------------------------------------------------------
    // Code mẫu ban đầu
    // --------------------------------------------------------

    const codeEditor =
        document.getElementById(
            "codeEditor"
        );

    if (codeEditor) {
        const savedCode =
            CppStorage.getLessonCode(
                user.id,
                lesson.id
            );

        codeEditor.value =
            savedCode ||
            lesson.starterCode ||
            `#include <iostream>

using namespace std;

int main() {

    // Viết code của bạn ở đây

    return 0;
}`;
    }


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
    // Lưu code tự động
    // --------------------------------------------------------

    editor.addEventListener(
        "input",
        () => {
            if (window.CppStorage && typeof CppStorage.saveLessonCode === "function") {
                CppStorage.saveLessonCode(
                    user.id,
                    lesson.id,
                    editor.value
                );
            }
        }
    );


    // --------------------------------------------------------
    // Nút Đặt lại code
    // --------------------------------------------------------

    const resetBtn = document.getElementById("resetCodeButton");
    if (resetBtn) {
        resetBtn.addEventListener("click", () => {
            const confirmed = window.confirm(
                "Bạn có chắc muốn đặt lại code về trạng thái ban đầu không?"
            );
            if (confirmed) {
                editor.value = lesson.starterCode || "";
                if (window.CppStorage && typeof CppStorage.saveLessonCode === "function") {
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
            // Demo kiểm tra code
            // ------------------------------------------------

            button.disabled = true;

            button.textContent =
                "Đang kiểm tra...";

            output.textContent =
                "Đang biên dịch và chạy chương trình...";


            setTimeout(() => {

                const result =
                    simulateCppExecution(
                        code,
                        lesson,
                        inputVal
                    );

                output.textContent =
                    result.output;

                button.disabled = false;

                button.textContent =
                    "▶ Chạy thử";

            }, 600);
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
                showMessage(
                    "submitMessage",
                    "⚠️ Bạn cần viết code trước khi nộp bài.",
                    "error"
                );

                return;
            }


            button.disabled = true;

            button.textContent =
                "Đang chấm bài...";


            setTimeout(() => {

                const result =
                    gradeCode(
                        code,
                        lesson
                    );


                // --------------------------------------------
                // Lưu kết quả
                // --------------------------------------------

                CppStorage.saveLessonProgress(
                    user.id,
                    lesson.id,
                    {
                        completed:
                            result.completed,

                        score:
                            result.score,

                        submittedCode:
                            code,

                        feedback:
                            result.feedback,

                        submittedAt:
                            new Date().toISOString()
                    }
                );


                CppStorage.saveLessonCode(
                    user.id,
                    lesson.id,
                    code
                );


                // --------------------------------------------
                // Hiển thị kết quả
                // --------------------------------------------

                showGradingResult(
                    result
                );


                // --------------------------------------------
                // Cập nhật trạng thái
                // --------------------------------------------

                updateLessonStatus({
                    completed:
                        result.completed,

                    score:
                        result.score
                });


                button.disabled = false;

                button.textContent =
                    "Nộp bài";


            }, 900);
        }
    );
}


// ============================================================
// CHẤM CODE
// ============================================================
//
// Đây là AI feedback giả lập.
// Không phải AI thật.
// Có thể thay bằng API/backend AI sau này.
// ============================================================

function gradeCode(
    code,
    lesson
) {
    let score = 0;

    const feedback = [];

    const normalized =
        code.toLowerCase();


    // --------------------------------------------------------
    // Có main()
    // --------------------------------------------------------

    if (
        normalized.includes("int main") ||
        normalized.includes("main()")
    ) {
        score += 20;

        feedback.push(
            "✓ Bạn đã tạo hàm main()."
        );
    } else {
        feedback.push(
            "⚠️ Bạn nên kiểm tra lại hàm main()."
        );
    }


    // --------------------------------------------------------
    // Có include
    // --------------------------------------------------------

    if (
        normalized.includes("#include")
    ) {
        score += 15;

        feedback.push(
            "✓ Bạn đã sử dụng thư viện."
        );
    }


    // --------------------------------------------------------
    // Có cout / cin
    // --------------------------------------------------------

    if (
        normalized.includes("cout")
    ) {
        score += 15;

        feedback.push(
            "✓ Bạn đã sử dụng cout để xuất dữ liệu."
        );
    }

    if (
        normalized.includes("cin")
    ) {
        score += 10;

        feedback.push(
            "✓ Bạn đã sử dụng cin để nhập dữ liệu."
        );
    }


    // --------------------------------------------------------
    // Biến
    // --------------------------------------------------------

    const hasVariable =
        /\b(int|float|double|char|string|bool)\s+\w+/.test(
            code
        );

    if (hasVariable) {
        score += 10;

        feedback.push(
            "✓ Bạn đã khai báo biến."
        );
    }


    // --------------------------------------------------------
    // if
    // --------------------------------------------------------

    if (
        normalized.includes("if")
    ) {
        score += 10;

        feedback.push(
            "✓ Bạn đã sử dụng câu điều kiện."
        );
    }


    // --------------------------------------------------------
    // vòng lặp
    // --------------------------------------------------------

    if (
        normalized.includes("for") ||
        normalized.includes("while")
    ) {
        score += 10;

        feedback.push(
            "✓ Bạn đã sử dụng vòng lặp."
        );
    }


    // --------------------------------------------------------
    // return
    // --------------------------------------------------------

    if (
        normalized.includes("return")
    ) {
        score += 5;

        feedback.push(
            "✓ Chương trình có return."
        );
    }


    // --------------------------------------------------------
    // Dấu ;
    // --------------------------------------------------------

    if (
        code.includes(";")
    ) {
        score += 5;
    }


    // --------------------------------------------------------
    // Giới hạn điểm
    // --------------------------------------------------------

    score =
        Math.min(
            score,
            100
        );


    // --------------------------------------------------------
    // Đánh giá
    // --------------------------------------------------------

    let level;
    let advice;

    if (score >= 80) {

        level =
            "Xuất sắc";

        advice =
            "Bạn đã nắm khá tốt kiến thức của bài học. " +
            "Hãy thử làm thêm các bài tập nâng cao để củng cố kiến thức.";

    } else if (score >= 60) {

        level =
            "Khá";

        advice =
            "Bạn đã hiểu được phần lớn nội dung. " +
            "Hãy xem lại những phần còn thiếu và thử viết lại chương trình.";

    } else if (score >= 40) {

        level =
            "Trung bình";

        advice =
            "Bạn đã có nền tảng nhưng cần luyện tập thêm. " +
            "Hãy đọc lại phần lý thuyết rồi thử làm lại bài.";

    } else {

        level =
            "Cần luyện tập thêm";

        advice =
            "Bạn nên học lại phần lý thuyết và xem code mẫu " +
            "trước khi thử lại bài tập.";
    }


    // --------------------------------------------------------
    // Hoàn thành
    // --------------------------------------------------------

    const completed =
        score >= 60;


    return {
        score,
        completed,
        level,
        advice,
        feedback
    };
}


// ============================================================
// HIỂN THỊ KẾT QUẢ CHẤM
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
    feedbackBox.style.display =
        "block";


    feedbackBox.innerHTML = `
        <div class="ai-feedback-header">

            <div>
                <span class="ai-badge">
                    🤖 AI Feedback
                </span>

                <h3>
                    Kết quả bài làm
                </h3>
            </div>

            <div class="ai-score">
                ${result.score}/100
            </div>

        </div>


        <div class="ai-feedback-level">
            <strong>
                Mức độ:
            </strong>

            ${escapeHtml(
                result.level
            )}
        </div>


        <div class="ai-feedback-advice">
            <strong>
                Nhận xét:
            </strong>

            <p>
                ${escapeHtml(
                    result.advice
                )}
            </p>
        </div>


        <div class="ai-feedback-details">

            <strong>
                Phân tích:
            </strong>

            <ul>
                ${result.feedback
                    .map(
                        item =>
                            `<li>${escapeHtml(item)}</li>`
                    )
                    .join("")
                }
            </ul>

        </div>


        ${
            result.completed
                ? `
                    <div class="ai-success">
                        🎉 Chúc mừng! Bạn đã hoàn thành bài học.
                    </div>
                `
                : `
                    <div class="ai-warning">
                        💡 Hãy thử lại để đạt ít nhất 60 điểm.
                    </div>
                `
        }
    `;
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
                        String(lesson.id) ===
                        String(currentId);


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
    const currentIndex =
        lessons.findIndex(
            lesson =>
                String(lesson.id) ===
                String(currentLesson.id)
        );


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

            nextButton.href =
                "lessons.html";

            nextButton.textContent =
                "Hoàn thành khóa học →";
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