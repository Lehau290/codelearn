// ============================================================
// CODELEARN C++ - LESSONS PAGE
// File: js/lessons.js
// ============================================================

document.addEventListener("DOMContentLoaded", async () => {
    const currentUser = CppStorage.getCurrentUser();

    // Lấy các thành phần trên trang
    const searchInput = document.getElementById("lessonSearch");
    const chapterFilter = document.getElementById("chapterFilter");
    const statusFilter = document.getElementById("statusFilter");
    const lessonList =
        document.getElementById("lessonsContainer") ||
        document.getElementById("lessonList");
    const clearFiltersButton = document.getElementById("clearFiltersButton");

    // Lấy tiến độ người dùng
    const userProgress = currentUser ? CppStorage.getUserProgress(currentUser.id) : {};

    // 1. Tải danh sách bài học ngay từ Storage / DEFAULT_LESSONS để hiển thị tức thì
    let allLessons = CppStorage.getLessons();
    if (!allLessons || allLessons.length === 0) {
        if (typeof CppStorage.resetLessons === "function") {
            CppStorage.resetLessons();
        }
        allLessons = CppStorage.getLessons();
    }

    // Hiển thị bộ lọc chương
    renderChapterFilter(allLessons, chapterFilter);

    // Hiển thị danh sách ban đầu ngay
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

    // 2. Tự động đồng bộ với Backend API (/api/lessons) nếu máy chủ đang chạy
    if (window.CodeLearnApi && typeof CodeLearnApi.lessons?.getAll === "function") {
        try {
            const res = await CodeLearnApi.lessons.getAll();
            const apiLessons = (res && Array.isArray(res.lessons)) ? res.lessons : (Array.isArray(res) ? res : null);
            if (apiLessons && apiLessons.length > 0) {
                const storageMap = new Map((allLessons || []).map(l => [String(l.id), l]));
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

                allLessons = mergedLessons;
                CppStorage.saveLessons(mergedLessons);

                renderChapterFilter(allLessons, chapterFilter);
                filterLessons(
                    allLessons,
                    userProgress,
                    lessonList,
                    searchInput,
                    chapterFilter,
                    statusFilter
                );
                updateOverallProgress(allLessons, userProgress);
            }
        } catch (err) {
            console.warn("Không thể đồng bộ từ API backend, sử dụng dữ liệu cục bộ:", err);
        }
    }

    // Helper kích hoạt lọc
    function triggerFilter() {
        if (!allLessons || allLessons.length === 0) {
            allLessons = CppStorage.getLessons();
        }
        filterLessons(
            allLessons,
            userProgress,
            lessonList,
            searchInput,
            chapterFilter,
            statusFilter
        );
    }

    // Tìm kiếm
    if (searchInput) {
        searchInput.addEventListener("input", triggerFilter);
    }

    // Lọc chương
    if (chapterFilter) {
        chapterFilter.addEventListener("change", triggerFilter);
    }

    // Lọc trạng thái
    if (statusFilter) {
        statusFilter.addEventListener("change", triggerFilter);
    }

    // Xóa bộ lọc
    if (clearFiltersButton) {
        clearFiltersButton.addEventListener("click", () => {
            if (searchInput) searchInput.value = "";
            if (chapterFilter) chapterFilter.value = "all";
            if (statusFilter) statusFilter.value = "all";
            triggerFilter();
        });
    }

    // 3. Hiệu ứng Mouse Spotlight Glow trên Banner Lộ trình
    const lessonsHero = document.getElementById("lessonsHeroSection");
    if (lessonsHero) {
        let heroRaf = null;
        lessonsHero.addEventListener("mousemove", (e) => {
            if (heroRaf) cancelAnimationFrame(heroRaf);
            heroRaf = requestAnimationFrame(() => {
                const rect = lessonsHero.getBoundingClientRect();
                const x = Math.round(e.clientX - rect.left);
                const y = Math.round(e.clientY - rect.top);
                lessonsHero.style.setProperty("--lessons-spotlight-x", `${x}px`);
                lessonsHero.style.setProperty("--lessons-spotlight-y", `${y}px`);
            });
        });
        lessonsHero.addEventListener("mouseleave", () => {
            lessonsHero.style.setProperty("--lessons-spotlight-x", "50%");
            lessonsHero.style.setProperty("--lessons-spotlight-y", "40%");
        });
    }

    // 4. Quick Chapter Filter Pills
    const pills = document.querySelectorAll(".chapter-pill");
    pills.forEach(pill => {
        pill.addEventListener("click", () => {
            pills.forEach(p => p.classList.remove("active"));
            pill.classList.add("active");
            const targetChap = pill.getAttribute("data-chapter");
            if (chapterFilter) {
                if (targetChap === "all") {
                    chapterFilter.value = "all";
                } else {
                    const matchedOption = Array.from(chapterFilter.options).find(opt => 
                        opt.value.toLowerCase().includes(targetChap.toLowerCase())
                    );
                    if (matchedOption) {
                        chapterFilter.value = matchedOption.value;
                    }
                }
                triggerFilter();
            }
        });
    });

    if (chapterFilter) {
        chapterFilter.addEventListener("change", () => {
            const val = chapterFilter.value.toLowerCase();
            pills.forEach(p => {
                const pChap = (p.getAttribute("data-chapter") || "").toLowerCase();
                if (val === "all" && pChap === "all") {
                    p.classList.add("active");
                } else if (val !== "all" && val.includes(pChap)) {
                    p.classList.add("active");
                } else {
                    p.classList.remove("active");
                }
            });
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

    const currentVal = select.value;

    const chapters = [
        ...new Set(
            (lessons || [])
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

    if (currentVal && Array.from(select.options).some(o => o.value === currentVal)) {
        select.value = currentVal;
    }
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

    const currentLessons = (lessons && lessons.length > 0)
        ? lessons
        : CppStorage.getLessons();

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


    const filteredLessons = currentLessons.filter(lesson => {
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
            lesson.chapter === selectedChapter ||
            (selectedChapter && lesson.chapter && lesson.chapter.toLowerCase().includes(selectedChapter.toLowerCase()));


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
    if (!lessons || !lessons.length) {
        if (noLessons) {
            noLessons.hidden = false;
        }
        // Giữ container trống, KHÔNG hiển thị thêm thẻ empty-state thứ 2 để tránh trùng lặp
        container.innerHTML = "";
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
    const lessonProgress = progress[lesson.id] || {};
    const completed = lessonProgress.completed === true;
    const statusClass = completed ? "completed" : "not-completed";
    const level = lesson.level || "Cơ bản";
    const duration = lesson.duration || "15 phút";

    return `
        <article class="lesson-card lesson-list-card ${statusClass}" style="--item-idx: ${index};">

            <div class="lesson-card-top">
                <span class="lesson-number">
                    ${String(index + 1).padStart(2, "0")}
                </span>
                <span class="lesson-status ${completed ? 'completed' : ''}">
                    ${completed ? "✓" : "○"}
                </span>
            </div>

            <div class="lesson-card-icon">
                ${getLessonIcon(index)}
            </div>

            <div class="lesson-card-content">
                <div class="lesson-card-meta">
                    <span class="lesson-chapter">
                        ${escapeHtml(lesson.chapter || "C++ Cơ bản")}
                    </span>
                    <span class="lesson-level">
                        ${escapeHtml(level)}
                    </span>
                    <span class="status-badge-pill ${completed ? 'completed' : 'pending'}">
                        ${completed ? '<span class="status-dot-pulse"></span> Hoàn thành' : 'Chưa học'}
                    </span>
                </div>

                <h3>
                    ${escapeHtml(lesson.title || "Bài học C++")}
                </h3>

                <p>
                    ${escapeHtml(lesson.description || "Học kiến thức C++ cơ bản.")}
                </p>

                <div class="lesson-card-info">
                    <span>⏱ ${escapeHtml(duration)}</span>
                    <span>${completed ? '✓ Đã đạt: ' + (lessonProgress.score || 100) + '/100 điểm' : '⚡ 3 Bài tập thực hành'}</span>
                </div>
            </div>

            <div class="lesson-card-action">
                <a
                    href="lesson-detail.html?id=${encodeURIComponent(lesson.id)}"
                    class="btn-lesson-interactive ${completed ? 'btn-relearn' : ''}"
                >
                    <span>${completed ? "Học lại" : "Bắt đầu học"}</span>
                    <span class="btn-arrow">→</span>
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

    // Cập nhật widget tiến độ trên Hero banner
    const heroLabel = document.getElementById("heroProgressLabel");
    const heroFill = document.getElementById("heroProgressFill");
    if (heroLabel) heroLabel.textContent = `${completed}/${total} bài (${percent}%)`;
    if (heroFill) heroFill.style.width = `${percent}%`;

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