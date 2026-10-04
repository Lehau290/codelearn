// ============================================================
// CODELEARN C++ - LESSONS PAGE
// File: js/lessons.js
// ============================================================

document.addEventListener("DOMContentLoaded", () => {
    const currentUser = CppStorage.getCurrentUser();

    // Lấy các thành phần trên trang
    const searchInput = document.getElementById("lessonSearch");
    const chapterFilter = document.getElementById("chapterFilter");
    const statusFilter = document.getElementById("statusFilter");
    const lessonList =
        document.getElementById("lessonsContainer") ||
        document.getElementById("lessonList");
    const clearFiltersButton = document.getElementById("clearFiltersButton");

    // Lưu dữ liệu để sử dụng khi lọc
    let allLessons = CppStorage.getLessons();
    const userProgress = currentUser ? CppStorage.getUserProgress(currentUser.id) : {};

    // Hiển thị bộ lọc chương
    renderChapterFilter(allLessons, chapterFilter);

    // Hiển thị danh sách ban đầu
    renderLessons(
        allLessons,
        userProgress,
        lessonList
    );

    // Cập nhật tổng tiến độ
    updateOverallProgress(
        allLessons,
        userProgress
    );

    // Tìm kiếm
    if (searchInput) {
        searchInput.addEventListener("input", () => {
            filterLessons(
                allLessons,
                userProgress,
                lessonList,
                searchInput,
                chapterFilter,
                statusFilter
            );
        });
    }

    // Lọc chương
    if (chapterFilter) {
        chapterFilter.addEventListener("change", () => {
            filterLessons(
                allLessons,
                userProgress,
                lessonList,
                searchInput,
                chapterFilter,
                statusFilter
            );
        });
    }

    // Lọc trạng thái
    if (statusFilter) {
        statusFilter.addEventListener("change", () => {
            filterLessons(
                allLessons,
                userProgress,
                lessonList,
                searchInput,
                chapterFilter,
                statusFilter
            );
        });
    }

    // Xóa bộ lọc
    if (clearFiltersButton) {
        clearFiltersButton.addEventListener("click", () => {
            if (searchInput) searchInput.value = "";
            if (chapterFilter) chapterFilter.value = "all";
            if (statusFilter) statusFilter.value = "all";
            filterLessons(
                allLessons,
                userProgress,
                lessonList,
                searchInput,
                chapterFilter,
                statusFilter
            );
        });
    }
});


// ============================================================
// HIỂN THỊ BỘ LỌC CHƯƠNG
// ============================================================

function renderChapterFilter(lessons, select) {
    if (!select) {
        return;
    }

    const chapters = [
        ...new Set(
            lessons
                .map(lesson => lesson.chapter)
                .filter(Boolean)
        )
    ];

    select.innerHTML = `
        <option value="all">
            Tất cả chương
        </option>
    `;

    chapters.forEach(chapter => {
        const option = document.createElement("option");

        option.value = chapter;
        option.textContent = chapter;

        select.appendChild(option);
    });
}


// ============================================================
// LỌC BÀI HỌC
// ============================================================

function filterLessons(
    lessons,
    progress,
    container,
    searchInput,
    chapterFilter,
    statusFilter
) {
    if (!container) {
        return;
    }

    const searchText = searchInput
        ? searchInput.value
            .trim()
            .toLowerCase()
        : "";

    const selectedChapter = chapterFilter
        ? chapterFilter.value
        : "all";

    const selectedStatus = statusFilter
        ? statusFilter.value
        : "all";


    const filteredLessons = lessons.filter(lesson => {
        // --------------------------------------------
        // Tìm kiếm
        // --------------------------------------------
        const title = String(
            lesson.title || ""
        ).toLowerCase();

        const description = String(
            lesson.description || ""
        ).toLowerCase();

        const chapter = String(
            lesson.chapter || ""
        ).toLowerCase();

        const matchesSearch =
            !searchText ||
            title.includes(searchText) ||
            description.includes(searchText) ||
            chapter.includes(searchText);


        // --------------------------------------------
        // Lọc chương
        // --------------------------------------------
        const matchesChapter =
            selectedChapter === "all" ||
            lesson.chapter === selectedChapter;


        // --------------------------------------------
        // Lọc trạng thái
        // --------------------------------------------
        const completed =
            progress[lesson.id]?.completed === true;

        let matchesStatus = true;

        if (selectedStatus === "completed") {
            matchesStatus = completed;
        }

        if (selectedStatus === "incomplete" || selectedStatus === "not-completed") {
            matchesStatus = !completed;
        }


        return (
            matchesSearch &&
            matchesChapter &&
            matchesStatus
        );
    });


    renderLessons(
        filteredLessons,
        progress,
        container
    );
}


// ============================================================
// HIỂN THỊ DANH SÁCH BÀI HỌC
// ============================================================

function renderLessons(
    lessons,
    progress,
    container
) {
    if (!container) {
        return;
    }

    const noLessons = document.getElementById("noLessons");

    // Không có kết quả
    if (!lessons.length) {
        if (noLessons) {
            noLessons.hidden = false;
        }
        container.innerHTML = `
            <div class="empty-state">
                <div class="empty-state-icon">
                    🔍
                </div>

                <h3>
                    Không tìm thấy bài học
                </h3>

                <p>
                    Hãy thử thay đổi từ khóa
                    hoặc bộ lọc.
                </p>
            </div>
        `;
        return;
    }

    if (noLessons) {
        noLessons.hidden = true;
    }


    container.innerHTML = lessons
        .map((lesson, index) => {
            return createLessonCard(
                lesson,
                progress,
                index
            );
        })
        .join("");
}


// ============================================================
// TẠO CARD BÀI HỌC
// ============================================================

function createLessonCard(
    lesson,
    progress,
    index
) {
    const lessonProgress =
        progress[lesson.id] || {};

    const completed =
        lessonProgress.completed === true;

    const statusClass =
        completed
            ? "completed"
            : "not-completed";

    const statusText =
        completed
            ? "Đã hoàn thành"
            : "Chưa hoàn thành";

    const level =
        lesson.level || "Cơ bản";

    const duration =
        lesson.duration || "15 phút";


    return `
        <article class="
            lesson-card
            lesson-list-card
            ${statusClass}
        ">

            <div class="lesson-card-top">

                <span class="lesson-number">
                    ${String(index + 1).padStart(2, "0")}
                </span>

                <span class="lesson-status">
                    ${
                        completed
                            ? "✓"
                            : "○"
                    }
                </span>

            </div>


            <div class="lesson-card-icon">
                ${getLessonIcon(index)}
            </div>


            <div class="lesson-card-content">

                <div class="lesson-card-meta">

                    <span class="lesson-chapter">
                        ${escapeHtml(
                            lesson.chapter ||
                            "C++ Cơ bản"
                        )}
                    </span>

                    <span class="lesson-level">
                        ${escapeHtml(level)}
                    </span>

                </div>


                <h3>
                    ${escapeHtml(
                        lesson.title ||
                        "Bài học C++"
                    )}
                </h3>


                <p>
                    ${escapeHtml(
                        lesson.description ||
                        "Học kiến thức C++ cơ bản."
                    )}
                </p>


                <div class="lesson-card-info">

                    <span>
                        ⏱ ${escapeHtml(duration)}
                    </span>

                    <span>
                        ${
                            completed
                                ? "✓ Hoàn thành"
                                : "○ Chưa học"
                        }
                    </span>

                </div>

            </div>


            <div class="lesson-card-action">

                <a
                    href="lesson-detail.html?id=${encodeURIComponent(
                        lesson.id
                    )}"
                    class="btn btn-primary"
                >
                    ${
                        completed
                            ? "Học lại"
                            : "Bắt đầu học"
                    }
                    →
                </a>

            </div>

        </article>
    `;
}


// ============================================================
// CẬP NHẬT TIẾN ĐỘ KHÓA HỌC
// ============================================================

function updateOverallProgress(
    lessons,
    progress
) {
    const total = lessons.length;

    const completed = lessons.filter(
        lesson =>
            progress[lesson.id]?.completed === true
    ).length;


    const percent =
        total > 0
            ? Math.round(
                (completed / total) * 100
            )
            : 0;


    // Phần trăm
    setText(
        "overallProgressPercent",
        `${percent}%`
    );
    setText(
        "courseProgressText",
        `${percent}%`
    );

    setText(
        "lessonsCompleted",
        completed
    );

    setText(
        "lessonsTotal",
        total
    );

    setText(
        "lessonCount",
        total
    );


    // Progress bar
    const progressBar =
        document.getElementById("courseProgressBar") ||
        document.getElementById("overallProgressBar");

    if (progressBar) {
        progressBar.style.width =
            `${percent}%`;
    }


    // Các progress bar dùng class chung
    document
        .querySelectorAll(
            ".overall-progress-fill"
        )
        .forEach(bar => {
            bar.style.width =
                `${percent}%`;
        });


    document
        .querySelectorAll(
            ".progress-fill"
        )
        .forEach(bar => {
            // Chỉ cập nhật nếu là progress tổng
            if (
                bar.dataset.progressType ===
                "overall"
            ) {
                bar.style.width =
                    `${percent}%`;
            }
        });
}


// ============================================================
// ICON BÀI HỌC
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
        "📝",
        "⚙️",
        "💡"
    ];

    return icons[
        index % icons.length
    ];
}


// ============================================================
// SET TEXT
// ============================================================

function setText(id, value) {
    const element =
        document.getElementById(id);

    if (element) {
        element.textContent = value;
    }
}


// ============================================================
// ESCAPE HTML
// ============================================================

function escapeHtml(value) {
    if (
        value === null ||
        value === undefined
    ) {
        return "";
    }

    return String(value)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}