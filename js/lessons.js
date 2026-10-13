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
    const heroStartBtn = document.getElementById("heroStartLearningButton");

    // Chặn trình duyệt tự động điền (autofill username/admin) vào ô tìm kiếm bài học
    let isUserFiltering = false;
    let userTypedSearchKeydown = false;
    if (searchInput) {
        searchInput.value = "";
        searchInput.addEventListener("keydown", (e) => {
            if (e.key && e.key !== "Tab" && e.key !== "Shift" && e.key !== "Control" && e.key !== "Alt") {
                userTypedSearchKeydown = true;
                isUserFiltering = true;
            }
        });
        // Xóa ngay nếu trình duyệt tự động điền "admin" sau khi trang tải
        [50, 150, 400, 900].forEach(delay => {
            setTimeout(() => {
                if (!userTypedSearchKeydown && searchInput.value) {
                    searchInput.value = "";
                }
            }, delay);
        });
    }
    if (chapterFilter) chapterFilter.value = "all";
    if (statusFilter) statusFilter.value = "all";

    // Lấy tiến độ người dùng
    const userProgress = currentUser ? CppStorage.getUserProgress(currentUser.id) : {};

    // 1. Tải danh sách bài học ngay từ Storage / DEFAULT_LESSONS để hiển thị tức thì
    let allLessons = CppStorage.getLessons();
    if (!allLessons || allLessons.length < 20) {
        if (typeof CppStorage.resetLessons === "function") {
            CppStorage.resetLessons();
        }
        allLessons = CppStorage.getLessons();
    }

    // Chuẩn hóa chương cho 20 bài học theo đúng cấu trúc 7 Chương (Chương 1..7)
    allLessons = normalizeCurriculumChapters(allLessons);

    // Cập nhật nút Bắt đầu học ngay trên Hero của trang Bài học
    function updateHeroStartButton(lessons, progress) {
        if (!heroStartBtn || !lessons || !lessons.length) return;
        const nextLesson = lessons.find(l => !progress[l.id]?.completed) || lessons[0];
        const targetId = nextLesson ? nextLesson.id : "lesson-01";
        heroStartBtn.href = `lesson-detail.html?id=${encodeURIComponent(targetId)}`;
        const completedCount = lessons.filter(l => progress[l.id]?.completed).length;
        if (completedCount > 0 && completedCount < lessons.length) {
            heroStartBtn.innerHTML = `Tiếp tục học: Bài ${String(nextLesson.order || 1).padStart(2, "0")} <span>→</span>`;
        } else {
            heroStartBtn.innerHTML = `Bắt đầu học ngay (Bài 01) <span>→</span>`;
        }
    }

    // Hiển thị bộ lọc chương
    renderChapterFilter(allLessons, chapterFilter);

    // Hiển thị danh sách ban đầu ngay theo 7 Chương
    renderLessons(
        allLessons,
        userProgress,
        lessonList
    );

    // Đồng bộ trạng thái trên khung Chương trình học (7 Chương - 20 Bài)
    updateCurriculumOverviewChips(allLessons, userProgress);

    // Cập nhật tổng tiến độ & nút bắt đầu học
    updateOverallProgress(
        allLessons,
        userProgress
    );
    updateHeroStartButton(allLessons, userProgress);

    // 2. Tự động đồng bộ với Backend API (/api/lessons) nếu máy chủ đang chạy
    if (window.CodeLearnApi && typeof CodeLearnApi.lessons?.getAll === "function") {
        try {
            const res = await CodeLearnApi.lessons.getAll();
            const apiLessons = (res && Array.isArray(res.lessons)) ? res.lessons : (Array.isArray(res) ? res : null);
            if (apiLessons && apiLessons.length > 0) {
                const storageMap = new Map((allLessons || []).map(l => [String(l.id), l]));
                const apiMap = new Map(apiLessons.map(l => [String(l.id), l]));
                const combinedIds = new Set([...storageMap.keys(), ...apiMap.keys()]);

                const mergedLessons = Array.from(combinedIds).map(id => {
                    const localL = storageMap.get(id) || {};
                    const apiL = apiMap.get(id) || {};
                    return {
                        ...localL,
                        ...apiL,
                        id: apiL.id || localL.id || id,
                        title: apiL.title || localL.title || "Bài học C++",
                        chapter: apiL.chapter || localL.chapter || "Chương 1: Bắt đầu với C++",
                        content: apiL.content || localL.content || localL.theory || "",
                        theory: apiL.content || localL.theory || localL.content || "",
                        starterCode: apiL.starterCode || localL.starterCode || "",
                        example: apiL.example || localL.example || "",
                        order: Number(apiL.order || localL.order || 1)
                    };
                }).sort((a, b) => Number(a.order || 0) - Number(b.order || 0));

                if (mergedLessons.length > 0) {
                    allLessons = normalizeCurriculumChapters(mergedLessons);
                    CppStorage.saveLessons(allLessons);
                }

                renderChapterFilter(allLessons, chapterFilter);
                updateCurriculumOverviewChips(allLessons, userProgress);

                if (!isUserFiltering) {
                    if (searchInput && !userTypedSearchKeydown) searchInput.value = "";
                    if (chapterFilter) chapterFilter.value = "all";
                    if (statusFilter) statusFilter.value = "all";
                    renderLessons(allLessons, userProgress, lessonList);
                } else {
                    filterLessons(
                        allLessons,
                        userProgress,
                        lessonList,
                        searchInput,
                        chapterFilter,
                        statusFilter,
                        userTypedSearchKeydown
                    );
                }
                updateOverallProgress(allLessons, userProgress);
                updateHeroStartButton(allLessons, userProgress);
            }
        } catch (err) {
            console.warn("Không thể đồng bộ từ API backend, sử dụng dữ liệu cục bộ:", err);
        }
    }

    // Helper kích hoạt lọc
    function triggerFilter() {
        if (!allLessons || allLessons.length === 0) {
            allLessons = normalizeCurriculumChapters(CppStorage.getLessons());
        }
        filterLessons(
            allLessons,
            userProgress,
            lessonList,
            searchInput,
            chapterFilter,
            statusFilter,
            userTypedSearchKeydown
        );
    }

    // Tìm kiếm
    if (searchInput) {
        searchInput.addEventListener("input", () => {
            const val = (searchInput.value || "").trim().toLowerCase();
            // Chặn hoàn toàn nếu trình duyệt tự động điền tài khoản admin
            if (!userTypedSearchKeydown && (val === "admin" || val === "letrunghau" || document.activeElement !== searchInput)) {
                searchInput.value = "";
                return;
            }
            if (val === "") {
                userTypedSearchKeydown = false;
            }
            isUserFiltering = Boolean(val) || (chapterFilter && chapterFilter.value !== "all") || (statusFilter && statusFilter.value !== "all");
            triggerFilter();
        });
    }

    // Lọc chương
    if (chapterFilter) {
        chapterFilter.addEventListener("change", () => {
            isUserFiltering = (chapterFilter.value !== "all") || userTypedSearchKeydown || (statusFilter && statusFilter.value !== "all");
            triggerFilter();
        });
    }

    // Lọc trạng thái
    if (statusFilter) {
        statusFilter.addEventListener("change", () => {
            isUserFiltering = (statusFilter.value !== "all") || userTypedSearchKeydown || (chapterFilter && chapterFilter.value !== "all");
            triggerFilter();
        });
    }

    // Xóa bộ lọc
    if (clearFiltersButton) {
        clearFiltersButton.addEventListener("click", () => {
            isUserFiltering = false;
            userTypedSearchKeydown = false;
            if (searchInput) searchInput.value = "";
            if (chapterFilter) chapterFilter.value = "all";
            if (statusFilter) statusFilter.value = "all";
            const allPills = document.querySelectorAll(".chapter-pill");
            allPills.forEach(p => {
                p.classList.toggle("active", p.getAttribute("data-chapter") === "all");
            });
            renderLessons(allLessons, userProgress, lessonList);
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
            const targetChap = pill.getAttribute("data-chapter") || "all";
            isUserFiltering = targetChap !== "all";
            if (chapterFilter) {
                if (targetChap === "all") {
                    chapterFilter.value = "all";
                } else {
                    const matchedOption = Array.from(chapterFilter.options).find(opt =>
                        opt.value.toLowerCase().includes(targetChap.toLowerCase())
                    );
                    if (matchedOption) {
                        chapterFilter.value = matchedOption.value;
                    } else {
                        chapterFilter.value = "all";
                    }
                }
                triggerFilter();
            }
        });
    });

    if (chapterFilter) {
        chapterFilter.addEventListener("change", () => {
            const val = (chapterFilter.value || "all").toLowerCase();
            pills.forEach(p => {
                const pChap = (p.getAttribute("data-chapter") || "").toLowerCase();
                if (val === "all" && pChap === "all") {
                    p.classList.add("active");
                } else if (val !== "all" && pChap !== "all" && val.includes(pChap)) {
                    p.classList.add("active");
                } else {
                    p.classList.remove("active");
                }
            });
        });
    }

    // 5. Điều hướng trực tiếp khi click vào nút "Bắt đầu học" hoặc bất kỳ vị trí nào trên thẻ bài học
    if (lessonList) {
        lessonList.addEventListener("click", (e) => {
            const actionBtn = e.target.closest(".btn-lesson-interactive, a[href*='lesson-detail.html']");
            if (actionBtn) {
                e.preventDefault();
                e.stopPropagation();
                const lessonId = actionBtn.getAttribute("data-lesson-id") || actionBtn.getAttribute("href")?.split("id=")[1];
                if (lessonId) {
                    window.location.href = `lesson-detail.html?id=${encodeURIComponent(lessonId)}`;
                } else {
                    const href = actionBtn.getAttribute("href");
                    if (href) window.location.href = href;
                }
                return;
            }

            const card = e.target.closest(".lesson-list-card");
            if (!card) return;
            const targetLessonId = card.getAttribute("data-lesson-id");
            if (targetLessonId) {
                window.location.href = `lesson-detail.html?id=${encodeURIComponent(targetLessonId)}`;
            }
        });
    }
});


// ============================================================
// ĐỊNH NGHĨA CHUẨN 7 CHƯƠNG CỦA CHƯƠNG TRÌNH HỌC (20 BÀI)
// ============================================================

const CURRICULUM_CHAPTERS_META = [
    {
        key: "Chương 1",
        fullTitle: "Chương 1: Bắt đầu với C++",
        lessonRangeText: "Bao gồm Bài 1, Bài 2, Bài 3, Bài 4",
        summary: "Làm quen ngôn ngữ C++, biến, kiểu dữ liệu, nhập xuất cin/cout và các toán tử cơ bản",
        orders: [1, 2, 3, 4]
    },
    {
        key: "Chương 2",
        fullTitle: "Chương 2: Cấu trúc rẽ nhánh",
        lessonRangeText: "Bao gồm Bài 5, Bài 6",
        summary: "Điều khiển luồng thực thi chương trình với cấu trúc điều kiện if - else và switch - case",
        orders: [5, 6]
    },
    {
        key: "Chương 3",
        fullTitle: "Chương 3: Cấu trúc vòng lặp",
        lessonRangeText: "Bao gồm Bài 7, Bài 8, Bài 9",
        summary: "Tự động hóa các thao tác lặp với vòng lặp for, while, do-while và lệnh break, continue",
        orders: [7, 8, 9]
    },
    {
        key: "Chương 4",
        fullTitle: "Chương 4: Hàm & Tổ chức mã nguồn",
        lessonRangeText: "Bao gồm Bài 10, Bài 11",
        summary: "Chia nhỏ chương trình thành hàm (Functions), truyền tham số, nạp chồng hàm và đệ quy",
        orders: [10, 11]
    },
    {
        key: "Chương 5",
        fullTitle: "Chương 5: Mảng & Chuỗi ký tự",
        lessonRangeText: "Bao gồm Bài 12, Bài 13, Bài 14, Bài 15",
        summary: "Mảng một chiều, các thuật toán mảng cơ bản, chuỗi ký tự std::string và mảng hai chiều (Ma trận)",
        orders: [12, 13, 14, 15]
    },
    {
        key: "Chương 6",
        fullTitle: "Chương 6: Con trỏ & Quản lý bộ nhớ",
        lessonRangeText: "Bao gồm Bài 16, Bài 17",
        summary: "Làm chủ địa chỉ bộ nhớ, con trỏ (Pointers) và cấp phát bộ nhớ động với new & delete",
        orders: [16, 17]
    },
    {
        key: "Chương 7",
        fullTitle: "Chương 7: Lập trình Hướng đối tượng (OOP)",
        lessonRangeText: "Bao gồm Bài 18, Bài 19, Bài 20",
        summary: "Kiểu dữ liệu cấu trúc (struct), Lớp (Class) & Đối tượng (Object), Constructor, Destructor và Kế thừa",
        orders: [18, 19, 20]
    }
];

function normalizeCurriculumChapters(lessons) {
    if (!Array.isArray(lessons)) return [];
    return lessons.map((lesson, idx) => {
        const orderNum = Number(lesson.order || (idx + 1));
        const matchedMeta = CURRICULUM_CHAPTERS_META.find(c => c.orders.includes(orderNum));
        return {
            ...lesson,
            order: orderNum,
            chapter: matchedMeta ? matchedMeta.fullTitle : (lesson.chapter || "Chương 1: Bắt đầu với C++")
        };
    }).sort((a, b) => Number(a.order || 0) - Number(b.order || 0));
}

function updateCurriculumOverviewChips(lessons, progress) {
    const chips = document.querySelectorAll(".curr-lesson-chip");
    if (!chips.length) return;
    chips.forEach(chip => {
        const lessonId = chip.getAttribute("data-lesson-id");
        if (!lessonId) return;
        const isDone = progress && progress[lessonId]?.completed === true;
        chip.classList.toggle("completed", isDone);
    });
}


// ============================================================
// HIỂN THỊ BỘ LỌC CHƯƠNG
// ============================================================

function renderChapterFilter(lessons, select) {
    if (!select) {
        return;
    }

    const currentVal = select.value;

    select.innerHTML = `
        <option value="all">
            Tất cả chương (Chương 1 - Chương 7)
        </option>
    `;

    CURRICULUM_CHAPTERS_META.forEach(meta => {
        const option = document.createElement("option");
        option.value = meta.fullTitle;
        const nums = meta.orders.join(", ");
        option.textContent = `${meta.fullTitle} (Bài ${nums})`;
        select.appendChild(option);
    });

    // Thêm các chương tùy chỉnh nếu Admin tạo thêm chương mới ngoài 7 chương chuẩn
    const extraChapters = [
        ...new Set(
            (lessons || [])
                .map(lesson => lesson.chapter)
                .filter(ch => ch && !CURRICULUM_CHAPTERS_META.some(m => m.fullTitle === ch))
        )
    ];

    extraChapters.forEach(chapter => {
        const option = document.createElement("option");
        option.value = chapter;
        option.textContent = chapter;
        select.appendChild(option);
    });

    if (currentVal && Array.from(select.options).some(o => o.value === currentVal)) {
        select.value = currentVal;
    } else {
        select.value = "all";
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
    statusFilter,
    userTypedSearchKeydown = false
) {
    if (!container) {
        return;
    }

    let currentLessons = (lessons && lessons.length > 0)
        ? lessons
        : CppStorage.getLessons();

    if (!currentLessons || currentLessons.length === 0) {
        if (typeof CppStorage.resetLessons === "function") {
            currentLessons = CppStorage.resetLessons();
        }
    }

    currentLessons = normalizeCurriculumChapters(currentLessons);

    let searchText = "";
    if (searchInput && userTypedSearchKeydown) {
        searchText = searchInput.value.trim().toLowerCase();
    } else if (searchInput && searchInput.value) {
        searchInput.value = "";
    }

    const selectedChapter = (chapterFilter && chapterFilter.value)
        ? chapterFilter.value
        : "all";

    const selectedStatus = (statusFilter && statusFilter.value)
        ? statusFilter.value
        : "all";


    const filteredLessons = currentLessons.filter(lesson => {
        // --------------------------------------------
        // Tìm kiếm
        // --------------------------------------------
        const orderNum = lesson.order || 1;
        const title = String(lesson.title || "").toLowerCase();
        const description = String(lesson.description || "").toLowerCase();
        const chapter = String(lesson.chapter || "").toLowerCase();
        const baiLabel = `bài ${orderNum}`;
        const baiLabelPad = `bài 0${orderNum}`;

        const matchesSearch =
            !searchText ||
            title.includes(searchText) ||
            description.includes(searchText) ||
            chapter.includes(searchText) ||
            baiLabel.includes(searchText) ||
            baiLabelPad.includes(searchText);


        // --------------------------------------------
        // Lọc chương
        // --------------------------------------------
        const matchesChapter =
            !selectedChapter ||
            selectedChapter === "all" ||
            lesson.chapter === selectedChapter ||
            (lesson.chapter && lesson.chapter.toLowerCase().includes(selectedChapter.toLowerCase()));


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
// HIỂN THỊ DANH SÁCH BÀI HỌC THEO 7 CHƯƠNG (CHƯƠNG 1..7)
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
            noLessons.style.display = "";
        }
        container.innerHTML = "";
        return;
    }

    if (noLessons) {
        noLessons.hidden = true;
        noLessons.style.display = "none";
    }

    // Gom nhóm bài học theo 7 Chương chuẩn
    const groupedHtml = [];
    const usedLessonIds = new Set();

    CURRICULUM_CHAPTERS_META.forEach((chapMeta, chapIdx) => {
        const chapLessons = lessons.filter(l => {
            const ord = Number(l.order || 0);
            const chapStr = String(l.chapter || "");
            return chapMeta.orders.includes(ord) || chapStr.startsWith(chapMeta.key);
        });

        if (chapLessons.length === 0) return;

        chapLessons.forEach(l => usedLessonIds.add(l.id));

        const completedInChap = chapLessons.filter(l => progress && progress[l.id]?.completed === true).length;
        const cardsHtml = chapLessons
            .map((lesson, idx) => createLessonCard(lesson, progress, (lesson.order ? lesson.order - 1 : idx)))
            .join("");

        groupedHtml.push(`
            <div class="chapter-group-section" data-chapter-group="${escapeHtml(chapMeta.key)}">
                <div class="chapter-group-header">
                    <div class="chapter-group-title-wrap">
                        <span class="chapter-group-badge">CHƯƠNG ${chapIdx + 1}</span>
                        <div>
                            <h3>${escapeHtml(chapMeta.fullTitle)}</h3>
                            <p><strong>${escapeHtml(chapMeta.lessonRangeText)}</strong> — ${escapeHtml(chapMeta.summary)}</p>
                        </div>
                    </div>
                    <div class="chapter-group-right">
                        <span class="chapter-group-count">${completedInChap}/${chapLessons.length} bài hoàn thành</span>
                    </div>
                </div>
                <div class="chapter-group-lessons">
                    ${cardsHtml}
                </div>
            </div>
        `);
    });

    // Hiển thị các bài học bổ sung (nếu Admin thêm bài thứ 21+)
    const extraLessons = lessons.filter(l => !usedLessonIds.has(l.id));
    if (extraLessons.length > 0) {
        const extraCardsHtml = extraLessons
            .map((lesson, idx) => createLessonCard(lesson, progress, (lesson.order ? lesson.order - 1 : 20 + idx)))
            .join("");
        groupedHtml.push(`
            <div class="chapter-group-section" data-chapter-group="Chương mở rộng">
                <div class="chapter-group-header">
                    <div class="chapter-group-title-wrap">
                        <span class="chapter-group-badge">MỞ RỘNG</span>
                        <div>
                            <h3>Chuyên đề nâng cao &amp; Bổ sung</h3>
                            <p>Các bài giảng bổ sung do Quản trị viên cập nhật</p>
                        </div>
                    </div>
                    <div class="chapter-group-right">
                        <span class="chapter-group-count">${extraLessons.length} bài học</span>
                    </div>
                </div>
                <div class="chapter-group-lessons">
                    ${extraCardsHtml}
                </div>
            </div>
        `);
    }

    container.innerHTML = groupedHtml.join("");
}


// ============================================================
// TẠO CARD BÀI HỌC
// ============================================================

function createLessonCard(
    lesson,
    progress,
    index
) {
    const rawId = lesson.id || (lesson.order ? `lesson-${String(lesson.order).padStart(2, "0")}` : `lesson-${String(index + 1).padStart(2, "0")}`);
    const safeLessonId = (typeof rawId === "string" && /^lesson-\d$/.test(rawId))
        ? `lesson-0${rawId.slice(7)}`
        : String(rawId);

    const lessonProgress = progress[safeLessonId] || progress[lesson.id] || {};
    const completed = lessonProgress.completed === true;
    const statusClass = completed ? "completed" : "not-completed";
    const level = lesson.level || "Cơ bản";
    const duration = lesson.duration || "15 phút";
    const lessonOrderNumber = lesson.order || (index + 1);
    const rawTitle = String(lesson.title || "Bài học C++").trim();
    const displayTitle = /^bài\s+\d+/i.test(rawTitle)
        ? rawTitle
        : `Bài ${lessonOrderNumber}: ${rawTitle}`;

    return `
        <article class="lesson-card lesson-list-card ${statusClass}" data-lesson-id="${safeLessonId}" style="--item-idx: ${index}; cursor: pointer;">

            <div class="lesson-card-top">
                <span class="lesson-number">
                    ${String(lessonOrderNumber).padStart(2, "0")}
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
                        ${completed ? '<span class="status-dot-pulse"></span> Hoàn thành' : `Bài ${lessonOrderNumber}`}
                    </span>
                </div>

                <h3>
                    <a href="lesson-detail.html?id=${encodeURIComponent(safeLessonId)}" style="color: inherit; text-decoration: none;">
                        ${escapeHtml(displayTitle)}
                    </a>
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
                    href="lesson-detail.html?id=${encodeURIComponent(safeLessonId)}"
                    class="btn-lesson-interactive ${completed ? 'btn-relearn' : ''}"
                    data-lesson-id="${safeLessonId}"
                    title="${completed ? "Học lại bài này" : "Bắt đầu học bài này"}"
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