// ============================================================
// CODELEARN C++ - HOME PAGE
// File: js/home.js
// ============================================================

document.addEventListener("DOMContentLoaded", () => {
    // Lấy người dùng hiện tại (nếu có)
    const currentUser = CppStorage.getCurrentUser();

    // 1. Hiển thị lời chào
    updateGreeting(currentUser);

    // 2. Hiển thị thống kê học tập
    updateLearningStats(currentUser);

    // 3. Hiển thị danh sách bài học
    renderFeaturedLessons(currentUser);

    // 4. Nút tiếp tục học
    setupContinueLearning(currentUser);
});


// ============================================================
// LỜI CHÀO
// ============================================================

function updateGreeting(user) {
    const greetingElement = document.getElementById(
        "homeGreeting"
    );

    const nameElement =
        document.getElementById("welcomeUsername") ||
        document.getElementById("homeUsername");

    if (greetingElement) {
        const hour = new Date().getHours();

        let greeting = "Xin chào";

        if (hour >= 5 && hour < 12) {
            greeting = "Chào buổi sáng";
        } else if (hour >= 12 && hour < 18) {
            greeting = "Chào buổi chiều";
        } else {
            greeting = "Chào buổi tối";
        }

        greetingElement.textContent = greeting;
    }

    if (nameElement) {
        nameElement.textContent =
            user && user.username ? `, ${user.username}` : " bạn đến với CodeLearn C++";
    }
}


// ============================================================
// THỐNG KÊ HỌC TẬP
// ============================================================

function updateLearningStats(user) {
    const lessons = CppStorage.getLessons();
    const progress = user ? CppStorage.getUserProgress(user.id) : {};

    const totalLessons = lessons.length;

    const completedLessons = lessons.filter(
        lesson => progress[lesson.id]?.completed
    ).length;

    const progressPercent =
        totalLessons > 0
            ? Math.round(
                (completedLessons / totalLessons) * 100
            )
            : 0;

    const scores = lessons
        .map(lesson => progress[lesson.id]?.score)
        .filter(score => typeof score === "number");

    const averageScore =
        scores.length > 0
            ? Math.round(
                scores.reduce((sum, score) => sum + score, 0) / scores.length
            )
            : 0;


    // Tổng bài học
    setText("totalLessons", totalLessons);

    // Bài đã hoàn thành
    setText("completedLessons", completedLessons);

    // Phần trăm tiến độ
    setText("progressPercent", `${progressPercent}%`);
    setText("progressCircleText", `${progressPercent}%`);

    // Stats section
    setText("statLessons", totalLessons);
    setText("statCompleted", completedLessons);
    setText("statExercises", totalLessons);
    setText("statScore", `${averageScore}/100`);


    // Progress bar
    const progressBar = document.getElementById("progressBar");
    if (progressBar) {
        progressBar.style.width = `${progressPercent}%`;
    }

    document.querySelectorAll(".progress-bar-fill, .progress-fill").forEach(bar => {
        bar.style.width = `${progressPercent}%`;
    });
}


// ============================================================
// HIỂN THỊ BÀI HỌC NỔI BẬT
// ============================================================

function renderFeaturedLessons(user) {
    const container = document.getElementById(
        "homeLessons"
    );

    if (!container) {
        return;
    }

    const lessons = CppStorage.getLessons();
    const progress = user ? CppStorage.getUserProgress(user.id) : {};

    if (!lessons.length) {
        container.innerHTML = `
            <div class="empty-state">
                <div class="empty-state-icon">📚</div>
                <h3>Chưa có bài học</h3>
                <p>
                    Hiện tại chưa có bài học nào
                    trong hệ thống.
                </p>
            </div>
        `;

        return;
    }


    // Chỉ hiển thị tối đa 6 bài học trên trang chủ
    const featuredLessons = lessons.slice(0, 6);

    container.innerHTML = featuredLessons
        .map((lesson, index) => {

            const lessonProgress =
                progress[lesson.id];

            const completed =
                lessonProgress?.completed === true;

            const statusClass =
                completed
                    ? "completed"
                    : "";

            const statusText =
                completed
                    ? "Đã hoàn thành"
                    : "Chưa học";


            return `
                <article class="lesson-card ${statusClass}">
                    
                    <div class="lesson-card-top">
                        <span class="lesson-number">
                            Bài ${String(index + 1).padStart(2, "0")}
                        </span>

                        <span class="lesson-status ${completed ? "completed" : ""}">
                            ${completed ? "✓ Đã hoàn thành" : "○ Chưa học"}
                        </span>
                    </div>

                    <div class="lesson-card-header">
                        <div class="lesson-card-icon">
                            ${getLessonIcon(index)}
                        </div>

                        <span class="lesson-chapter">
                            ${escapeHtml(
                                lesson.chapter ||
                                "C++ Cơ bản"
                            )}
                        </span>
                    </div>

                    <div class="lesson-card-content">
                        <h3>
                            ${escapeHtml(
                                lesson.title
                            )}
                        </h3>

                        <p>
                            ${escapeHtml(
                                lesson.description ||
                                "Bài học C++ cơ bản."
                            )}
                        </p>
                    </div>

                    <div class="lesson-card-footer">
                        <span class="lesson-duration">
                            ⏱ ${escapeHtml(
                                lesson.duration ||
                                "15 phút"
                            )}
                        </span>

                        <span class="lesson-action-pill ${completed ? "completed" : ""}">
                            ${completed ? "Ôn lại bài →" : "Vào học ngay →"}
                        </span>
                    </div>

                    <a
                        href="lesson-detail.html?id=${encodeURIComponent(
                            lesson.id
                        )}"
                        class="lesson-card-link"
                        aria-label="Học bài ${escapeHtml(
                            lesson.title
                        )}"
                    >
                        <span class="sr-only">Học bài ${escapeHtml(lesson.title)}</span>
                    </a>

                </article>
            `;
        })
        .join("");
}


// ============================================================
// NÚT TIẾP TỤC HỌC
// ============================================================

function setupContinueLearning(user) {
    const button = document.getElementById(
        "continueLearningButton"
    );

    if (!button) {
        return;
    }

    const lessons = CppStorage.getLessons();

    if (!user) {
        button.href = "lessons.html";
        button.textContent = "Bắt đầu học ngay →";
        return;
    }

    const progress = CppStorage.getUserProgress(
        user.id
    );


    // Tìm bài đầu tiên chưa hoàn thành
    const nextLesson = lessons.find(
        lesson => !progress[lesson.id]?.completed
    );


    // Nếu còn bài chưa học
    if (nextLesson) {
        button.href =
            `lesson-detail.html?id=${encodeURIComponent(
                nextLesson.id
            )}`;

        button.textContent =
            "Tiếp tục học →";

        return;
    }


    // Nếu đã hoàn thành tất cả
    if (lessons.length > 0) {
        button.href = "lessons.html";
        button.textContent =
            "Xem lại khóa học →";
    }
}


// ============================================================
// ICON CHO BÀI HỌC
// ============================================================

function getLessonIcon(index) {
    const icons = [
        "🚀",
        "📦",
        "⌨️",
        "➗",
        "🔀",
        "🔁",
        "🧩",
        "📝"
    ];

    return icons[index % icons.length];
}


// ============================================================
// SET TEXT AN TOÀN
// ============================================================

function setText(id, value) {
    const element = document.getElementById(id);

    if (element) {
        element.textContent = value;
    }
}


// ============================================================
// ESCAPE HTML
// ============================================================

function escapeHtml(value) {
    if (value === null || value === undefined) {
        return "";
    }

    return String(value)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");

    

}