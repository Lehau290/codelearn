// ============================================================
// CODELEARN C++ - ADMIN DASHBOARD
// File: js/admin.js
// Quản trị bài giảng, bài tập, phân quyền thành viên & tri thức AI
// ============================================================

document.addEventListener("DOMContentLoaded", () => {
    const currentUser = CppStorage.getCurrentUser();

    // 1. Kiểm tra đăng nhập
    if (!currentUser) {
        window.location.href = "login.html";
        return;
    }

    // 2. Kiểm tra quyền Admin
    if (currentUser.role !== "admin") {
        alert("Bạn không có quyền truy cập trang quản trị.");
        window.location.href = "home.html";
        return;
    }

    // 3. Khởi tạo các module
    setupAdminTabs();
    setupAnalyticsSection();
    renderAdminStats();
    renderAdminLessons();
    setupLessonSearch();
    setupLessonForm();
    setupCancelButton();
    setupAddNewButton();

    setupExerciseManagement();
    setupUserManagement();
    setupMonitorSection();
    setupCommunitySection();
    setupDatabaseAndKnowledgeSection();
    setupModalDialog();
});

// ============================================================
// 1. CHUYỂN ĐỔI TAB QUẢN TRỊ (ADMIN TABS NAVIGATION)
// ============================================================
function setupAdminTabs() {
    const tabButtons = document.querySelectorAll(".admin-tab-btn");
    const tabPanes = document.querySelectorAll(".admin-tab-pane");

    tabButtons.forEach(btn => {
        btn.addEventListener("click", () => {
            const targetTab = btn.getAttribute("data-tab");
            if (!targetTab) return;

            tabButtons.forEach(b => b.classList.remove("active"));
            tabPanes.forEach(p => p.classList.remove("active"));

            btn.classList.add("active");
            const targetPane = document.getElementById(targetTab);
            if (targetPane) {
                targetPane.classList.add("active");
            }

            // Kích hoạt nạp dữ liệu tương ứng khi mở tab
            if (targetTab === "tab-analytics") {
                loadAdminAnalytics();
            } else if (targetTab === "tab-lessons") {
                renderAdminStats();
                renderAdminLessons();
            } else if (targetTab === "tab-exercises") {
                loadLessonOptionsForExercises();
                loadAdminExercises();
            } else if (targetTab === "tab-users") {
                loadAdminUsers();
            } else if (targetTab === "tab-monitor") {
                loadAdminSubmissions();
                loadAdminAiChats();
            } else if (targetTab === "tab-community") {
                loadAdminAnnouncements();
                loadAdminComments();
            } else if (targetTab === "tab-database") {
                if (typeof window.loadDbStats === "function") window.loadDbStats();
                loadAiKnowledge();
            }
        });
    });
}

// ============================================================
// 2. THỐNG KÊ TỔNG QUAN (ADMIN STATS)
// ============================================================
function renderAdminStats() {
    if (window.CodeLearnApi && typeof CodeLearnApi.admin?.getStats === "function") {
        CodeLearnApi.admin.getStats()
            .then(data => {
                setText("adminTotalLessons", data.totalLessons ?? 20);
                setText("adminPublishedLessons", data.totalLessons ?? 20);
                setText("adminTotalUsers", data.totalUsers ?? 2);
            })
            .catch(() => {
                const lessons = CppStorage.getLessons();
                const users = CppStorage.getUsers();
                setText("adminTotalLessons", lessons.length);
                setText("adminPublishedLessons", lessons.length);
                setText("adminTotalUsers", users.length);
            });
    } else {
        const lessons = CppStorage.getLessons();
        const users = CppStorage.getUsers();
        setText("adminTotalLessons", lessons.length);
        setText("adminPublishedLessons", lessons.length);
        setText("adminTotalUsers", users.length);
    }
}

// ============================================================
// 3. QUẢN LÝ BÀI GIẢNG (LESSONS MANAGEMENT)
// ============================================================
function renderAdminLessons(searchText = "") {
    const container = document.getElementById("lessonsAdminList");
    if (!container) return;

    const lessons = CppStorage.getLessons();
    const search = searchText.trim().toLowerCase();

    const filtered = lessons.filter(l => {
        if (!search) return true;
        return (
            (l.title && l.title.toLowerCase().includes(search)) ||
            (l.chapter && l.chapter.toLowerCase().includes(search)) ||
            (l.id && l.id.toLowerCase().includes(search))
        );
    });

    if (filtered.length === 0) {
        container.innerHTML = `
            <div class="empty-state" style="padding: 24px; text-align: center; color: var(--text-secondary);">
                <p>Không tìm thấy bài học nào phù hợp.</p>
            </div>
        `;
        return;
    }

    container.innerHTML = filtered.map((lesson, idx) => `
        <div class="admin-lesson-item" style="display: flex; justify-content: space-between; align-items: center; padding: 14px; margin-bottom: 10px; border-radius: 12px; border: 1px solid var(--border-light, #e2e8f0); background: var(--bg-card, #ffffff);">
            <div style="flex: 1; padding-right: 14px;">
                <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px;">
                    <span class="badge-role badge-role-student" style="font-size: 0.72rem;">${escapeHtml(lesson.id || `Bài ${idx + 1}`)}</span>
                    <strong style="color: var(--text-primary);">${escapeHtml(lesson.title)}</strong>
                </div>
                <div style="font-size: 0.8rem; color: var(--text-secondary);">
                    <span>${escapeHtml(lesson.chapter || "Chương")}</span> &bull;
                    <span>${escapeHtml(lesson.level || "Cơ bản")}</span> &bull;
                    <span>${escapeHtml(lesson.duration || "20 phút")}</span>
                </div>
            </div>
            <div style="display: flex; gap: 8px; flex-shrink: 0;">
                <button type="button" class="btn btn-secondary btn-sm edit-lesson-btn" data-id="${escapeHtml(lesson.id)}" style="padding: 6px 12px; font-size: 0.82rem;">
                    Sửa
                </button>
                <button type="button" class="btn btn-sm delete-lesson-btn" data-id="${escapeHtml(lesson.id)}" style="padding: 6px 12px; font-size: 0.82rem; background: rgba(239, 68, 68, 0.12); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.25);">
                    Xóa
                </button>
            </div>
        </div>
    `).join("");

    // Gắn sự kiện sửa
    container.querySelectorAll(".edit-lesson-btn").forEach(btn => {
        btn.addEventListener("click", () => {
            const lid = btn.getAttribute("data-id");
            editLesson(lid);
        });
    });

    // Gắn sự kiện xóa
    container.querySelectorAll(".delete-lesson-btn").forEach(btn => {
        btn.addEventListener("click", () => {
            const lid = btn.getAttribute("data-id");
            deleteLesson(lid);
        });
    });
}

function setupLessonSearch() {
    const searchInput = document.getElementById("adminLessonSearch");
    if (!searchInput) return;

    searchInput.addEventListener("input", (e) => {
        renderAdminLessons(e.target.value);
    });
}

function setupLessonForm() {
    const form = document.getElementById("adminLessonForm");
    if (!form) return;

    form.addEventListener("submit", async (e) => {
        e.preventDefault();

        const editId = document.getElementById("editLessonId")?.value;
        const title = document.getElementById("lessonTitle")?.value.trim();
        const chapter = document.getElementById("lessonChapter")?.value.trim();
        const description = document.getElementById("lessonDescription")?.value.trim();
        const level = document.getElementById("lessonLevel")?.value;
        const duration = document.getElementById("lessonDuration")?.value.trim();
        const content = document.getElementById("lessonContent")?.value.trim();
        const example = document.getElementById("lessonExample")?.value.trim();
        const exerciseTitle = document.getElementById("lessonExerciseTitle")?.value.trim();
        const exerciseDescription = document.getElementById("lessonExerciseDescription")?.value.trim();
        const starterCode = document.getElementById("lessonStarterCode")?.value.trim();

        if (!title || !chapter || !description || !content) {
            showFormMessage("adminMessage", "Vui lòng điền đầy đủ các trường bắt buộc.", "error");
            return;
        }

        const payload = {
            title,
            chapter,
            description,
            level,
            duration: duration || "20 phút",
            content,
            example,
            exerciseTitle: exerciseTitle || "Bài tập thực hành",
            exerciseDescription,
            starterCode
        };

        const submitBtn = document.getElementById("saveLessonButton");
        if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.textContent = "Đang lưu...";
        }

        try {
            if (editId) {
                // Cập nhật bài học
                if (window.CodeLearnApi && typeof CodeLearnApi.admin?.updateLesson === "function") {
                    await CodeLearnApi.admin.updateLesson(editId, payload);
                }
                CppStorage.updateLesson(editId, payload);
                showFormMessage("adminMessage", "Cập nhật bài học thành công!", "success");
            } else {
                // Thêm bài học mới
                let newId = null;
                if (window.CodeLearnApi && typeof CodeLearnApi.admin?.createLesson === "function") {
                    const res = await CodeLearnApi.admin.createLesson(payload);
                    newId = res.id;
                }
                CppStorage.addLesson({ ...payload, id: newId });
                showFormMessage("adminMessage", "Thêm bài học mới thành công!", "success");
            }

            resetLessonForm();
            renderAdminLessons();
            renderAdminStats();
        } catch (err) {
            showFormMessage("adminMessage", `Lỗi: ${err.message}`, "error");
        } finally {
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.textContent = "Lưu bài học";
            }
        }
    });
}

function editLesson(lessonId) {
    const lesson = CppStorage.getLessonById(lessonId);
    if (!lesson) return;

    setInputValue("editLessonId", lesson.id);
    setInputValue("lessonTitle", lesson.title);
    setInputValue("lessonChapter", lesson.chapter);
    setInputValue("lessonDescription", lesson.description);
    setInputValue("lessonLevel", lesson.level || "Cơ bản");
    setInputValue("lessonDuration", lesson.duration || "20 phút");
    setInputValue("lessonContent", lesson.content);
    setInputValue("lessonExample", lesson.example);
    setInputValue("lessonExerciseTitle", lesson.exerciseTitle);
    setInputValue("lessonExerciseDescription", lesson.exerciseDescription);
    setInputValue("lessonStarterCode", lesson.starterCode);

    setText("adminFormTitle", `Chỉnh sửa: ${lesson.title}`);

    const formSection = document.getElementById("adminLessonFormSection");
    if (formSection) {
        formSection.scrollIntoView({ behavior: "smooth", block: "start" });
    }
}

async function deleteLesson(lessonId) {
    if (!confirm(`Bạn có chắc chắn muốn xóa bài học '${lessonId}' không? Toàn bộ bài tập và tiến độ thuộc bài học này sẽ bị xóa.`)) {
        return;
    }

    try {
        if (window.CodeLearnApi && typeof CodeLearnApi.admin?.deleteLesson === "function") {
            await CodeLearnApi.admin.deleteLesson(lessonId);
        }
        CppStorage.deleteLesson(lessonId);
        showFormMessage("adminMessage", `Đã xóa bài học '${lessonId}' thành công.`, "success");
        renderAdminLessons();
        renderAdminStats();
    } catch (err) {
        showFormMessage("adminMessage", `Lỗi xóa bài học: ${err.message}`, "error");
    }
}

function resetLessonForm() {
    setInputValue("editLessonId", "");
    setInputValue("lessonTitle", "");
    setInputValue("lessonChapter", "");
    setInputValue("lessonDescription", "");
    setInputValue("lessonLevel", "Cơ bản");
    setInputValue("lessonDuration", "20 phút");
    setInputValue("lessonContent", "");
    setInputValue("lessonExample", "");
    setInputValue("lessonExerciseTitle", "");
    setInputValue("lessonExerciseDescription", "");
    setInputValue("lessonStarterCode", "#include <iostream>\nusing namespace std;\n\nint main() {\n    // Viết code tại đây\n    return 0;\n}");

    setText("adminFormTitle", "Thêm bài học");
}

function setupCancelButton() {
    const cancelBtn = document.getElementById("cancelEdit");
    if (cancelBtn) {
        cancelBtn.addEventListener("click", resetLessonForm);
    }
}

function setupAddNewButton() {
    const addBtn = document.getElementById("addNewLessonButton");
    if (addBtn) {
        addBtn.addEventListener("click", () => {
            resetLessonForm();
            const formSection = document.getElementById("adminLessonFormSection");
            if (formSection) {
                formSection.scrollIntoView({ behavior: "smooth" });
            }
        });
    }
}

// ============================================================
// 4. QUẢN LÝ BÀI TẬP (EXERCISES MANAGEMENT)
// ============================================================
let _adminExercisesCache = [];

function loadLessonOptionsForExercises() {
    const filterSelect = document.getElementById("exerciseLessonFilter");
    const targetSelect = document.getElementById("exerciseTargetLesson");
    const lessons = CppStorage.getLessons();

    if (filterSelect) {
        const curVal = filterSelect.value;
        filterSelect.innerHTML = `<option value="">-- Tất cả bài học (${lessons.length * 3} bài tập) --</option>` +
            lessons.map(l => `<option value="${escapeHtml(l.id)}">${escapeHtml(l.order_num ? `Bài ${l.order_num}: ` : '')}${escapeHtml(l.title)}</option>`).join("");
        filterSelect.value = curVal;
    }

    if (targetSelect) {
        const curVal = targetSelect.value;
        targetSelect.innerHTML = lessons.map(l => `<option value="${escapeHtml(l.id)}">${escapeHtml(l.order_num ? `Bài ${l.order_num}: ` : '')}${escapeHtml(l.title)}</option>`).join("");
        if (curVal) targetSelect.value = curVal;
    }
}

async function loadAdminExercises() {
    const container = document.getElementById("exercisesAdminList");
    if (!container) return;

    container.innerHTML = `<div style="padding: 20px; text-align: center; color: var(--text-secondary);">Đang tải danh sách bài tập...</div>`;

    const filterVal = document.getElementById("exerciseLessonFilter")?.value || "";

    try {
        let exercises = [];
        if (window.CodeLearnApi && typeof CodeLearnApi.admin?.getExercises === "function") {
            const res = await CodeLearnApi.admin.getExercises(filterVal);
            exercises = res.exercises || [];
        }

        // Nếu backend chưa có hoặc rỗng, tạo fallback từ CppStorage
        if (exercises.length === 0) {
            const lessons = CppStorage.getLessons();
            lessons.forEach(l => {
                if (!filterVal || l.id === filterVal) {
                    exercises.push({
                        id: `ex-${l.id}-01`,
                        lessonId: l.id,
                        lessonTitle: l.title,
                        title: l.exerciseTitle || `Thực hành: ${l.title}`,
                        level: "Cơ bản",
                        difficulty: "easy",
                        points: 100,
                        description: l.exerciseDescription || "Hoàn thành bài tập theo lý thuyết.",
                        starterCode: l.starterCode || "",
                        expectedOutput: "",
                        hint: "",
                        testKeywords: "[]",
                        orderNum: 1
                    });
                }
            });
        }

        _adminExercisesCache = exercises;
        renderExerciseList(exercises);
    } catch (err) {
        container.innerHTML = `<div class="form-message error">Lỗi tải bài tập: ${escapeHtml(err.message)}</div>`;
    }
}

function renderExerciseList(exercises) {
    const container = document.getElementById("exercisesAdminList");
    if (!container) return;

    const search = (document.getElementById("adminExerciseSearch")?.value || "").trim().toLowerCase();

    const filtered = exercises.filter(ex => {
        if (!search) return true;
        return (
            (ex.title && ex.title.toLowerCase().includes(search)) ||
            (ex.lessonTitle && ex.lessonTitle.toLowerCase().includes(search)) ||
            (ex.description && ex.description.toLowerCase().includes(search))
        );
    });

    if (filtered.length === 0) {
        container.innerHTML = `
            <div style="padding: 24px; text-align: center; color: var(--text-secondary);">
                Không tìm thấy bài tập nào phù hợp.
            </div>
        `;
        return;
    }

    container.innerHTML = filtered.map(ex => {
        const diffClass = ex.difficulty === "hard" ? "badge-diff-hard" : ex.difficulty === "medium" ? "badge-diff-medium" : "badge-diff-easy";
        return `
            <div class="admin-lesson-item" style="padding: 14px; margin-bottom: 10px; border-radius: 12px; border: 1px solid var(--border-light, #e2e8f0); background: var(--bg-card, #ffffff);">
                <div style="display: flex; justify-content: space-between; align-items: flex-start; gap: 10px;">
                    <div>
                        <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; flex-wrap: wrap;">
                            <span class="badge-role badge-role-student" style="font-size: 0.72rem;">${escapeHtml(ex.lessonId)}</span>
                            <strong style="color: var(--text-primary);">${escapeHtml(ex.title)}</strong>
                            <span class="badge-diff ${diffClass}">${escapeHtml(ex.level || 'Cơ bản')} (${ex.difficulty || 'easy'})</span>
                            <span style="font-size: 0.75rem; color: #10b981; font-weight: 700;">+${ex.points || 100} điểm</span>
                        </div>
                        <p style="font-size: 0.82rem; color: var(--text-secondary); margin: 4px 0;">
                            ${escapeHtml(ex.description?.slice(0, 140))}${ex.description?.length > 140 ? '...' : ''}
                        </p>
                    </div>
                    <div style="display: flex; gap: 6px; flex-shrink: 0;">
                        <button type="button" class="btn btn-secondary btn-sm btn-edit-exercise" data-id="${escapeHtml(ex.id)}" data-lesson="${escapeHtml(ex.lessonId)}" style="padding: 5px 10px; font-size: 0.8rem;">
                            Sửa
                        </button>
                        <button type="button" class="btn btn-sm btn-delete-exercise" data-id="${escapeHtml(ex.id)}" data-lesson="${escapeHtml(ex.lessonId)}" style="padding: 5px 10px; font-size: 0.8rem; background: rgba(239, 68, 68, 0.12); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.25);">
                            Xóa
                        </button>
                    </div>
                </div>
            </div>
        `;
    }).join("");

    container.querySelectorAll(".btn-edit-exercise").forEach(btn => {
        btn.addEventListener("click", () => {
            const exId = btn.getAttribute("data-id");
            const lessonId = btn.getAttribute("data-lesson");
            editExercise(exId, lessonId);
        });
    });

    container.querySelectorAll(".btn-delete-exercise").forEach(btn => {
        btn.addEventListener("click", () => {
            const exId = btn.getAttribute("data-id");
            const lessonId = btn.getAttribute("data-lesson");
            deleteExercise(exId, lessonId);
        });
    });
}

function setupExerciseManagement() {
    setupTestCasesModule();
    const filterSelect = document.getElementById("exerciseLessonFilter");
    if (filterSelect) {
        filterSelect.addEventListener("change", () => {
            loadAdminExercises();
        });
    }

    const searchInput = document.getElementById("adminExerciseSearch");
    if (searchInput) {
        searchInput.addEventListener("input", () => {
            renderExerciseList(_adminExercisesCache);
        });
    }

    const btnOpenAdd = document.getElementById("btnOpenAddExercise");
    if (btnOpenAdd) {
        btnOpenAdd.addEventListener("click", () => {
            resetExerciseForm();
            const formSec = document.getElementById("adminExerciseFormSection");
            if (formSec) formSec.scrollIntoView({ behavior: "smooth" });
        });
    }

    const cancelBtn = document.getElementById("cancelExerciseEdit");
    if (cancelBtn) {
        cancelBtn.addEventListener("click", resetExerciseForm);
    }

    const form = document.getElementById("adminExerciseForm");
    if (form) {
        form.addEventListener("submit", async (e) => {
            e.preventDefault();

            const editId = document.getElementById("editExerciseId")?.value;
            const lessonId = document.getElementById("exerciseTargetLesson")?.value;
            const title = document.getElementById("exerciseTitle")?.value.trim();
            const level = document.getElementById("exerciseLevel")?.value;
            const difficulty = document.getElementById("exerciseDifficulty")?.value;
            const points = parseInt(document.getElementById("exercisePoints")?.value || "100", 10);
            const orderNum = parseInt(document.getElementById("exerciseOrderNum")?.value || "1", 10);
            const description = document.getElementById("exerciseDescription")?.value.trim();
            const starterCode = document.getElementById("exerciseStarterCode")?.value;
            const expectedOutput = document.getElementById("exerciseExpectedOutput")?.value.trim();
            const hint = document.getElementById("exerciseHint")?.value.trim();
            const keywordsInput = document.getElementById("exerciseTestKeywords")?.value.trim();

            if (!lessonId || !title || !description) {
                showFormMessage("exerciseActionMessage", "Vui lòng nhập chuyên đề bài học, tên bài tập và đề bài.", "error");
                return;
            }

            const keywordsArray = keywordsInput
                ? keywordsInput.split(",").map(k => k.trim()).filter(Boolean)
                : [];

            const payload = {
                lessonId,
                title,
                level,
                difficulty,
                points,
                orderNum,
                description,
                starterCode,
                expectedOutput,
                hint,
                testKeywords: keywordsArray
            };

            const submitBtn = document.getElementById("saveExerciseButton");
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.textContent = "Đang lưu...";
            }

            try {
                if (editId) {
                    if (window.CodeLearnApi && typeof CodeLearnApi.admin?.updateExercise === "function") {
                        await CodeLearnApi.admin.updateExercise(editId, payload);
                    }
                    showFormMessage("exerciseActionMessage", "Cập nhật bài tập thành công!", "success");
                } else {
                    if (window.CodeLearnApi && typeof CodeLearnApi.admin?.createExercise === "function") {
                        await CodeLearnApi.admin.createExercise(payload);
                    }
                    showFormMessage("exerciseActionMessage", "Tạo bài tập mới thành công!", "success");
                }

                resetExerciseForm();
                loadAdminExercises();
            } catch (err) {
                showFormMessage("exerciseActionMessage", `Lỗi: ${err.message}`, "error");
            } finally {
                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.textContent = "Lưu bài tập";
                }
            }
        });
    }
}

function editExercise(exId, lessonId) {
    const ex = _adminExercisesCache.find(item => item.id === exId && (!lessonId || item.lessonId === lessonId));
    if (!ex) return;

    setInputValue("editExerciseId", ex.id);
    setInputValue("exerciseTargetLesson", ex.lessonId);
    setInputValue("exerciseTitle", ex.title);
    setInputValue("exerciseLevel", ex.level || "Cơ bản");
    setInputValue("exerciseDifficulty", ex.difficulty || "easy");
    setInputValue("exercisePoints", ex.points || 100);
    setInputValue("exerciseOrderNum", ex.orderNum || 1);
    setInputValue("exerciseDescription", ex.description);
    setInputValue("exerciseStarterCode", ex.starterCode);
    setInputValue("exerciseExpectedOutput", ex.expectedOutput || "");
    setInputValue("exerciseHint", ex.hint || "");

    let kwStr = "";
    try {
        if (typeof ex.testKeywords === "string") {
            const arr = JSON.parse(ex.testKeywords);
            kwStr = Array.isArray(arr) ? arr.join(", ") : ex.testKeywords;
        } else if (Array.isArray(ex.testKeywords)) {
            kwStr = ex.testKeywords.join(", ");
        }
    } catch (_) {
        kwStr = ex.testKeywords || "";
    }
    setInputValue("exerciseTestKeywords", kwStr);

    setText("adminExerciseFormTitle", `Chỉnh sửa: ${ex.title}`);
    loadExerciseTestCases(ex.id, ex.lessonId);

    const formSec = document.getElementById("adminExerciseFormSection");
    if (formSec) formSec.scrollIntoView({ behavior: "smooth" });
}

let _currentExerciseTestCases = [];

async function loadExerciseTestCases(exerciseId, lessonId) {
    const container = document.getElementById("testCasesContainer");
    const badge = document.getElementById("tcCountBadge");
    if (!container) return;

    container.innerHTML = `<div style="padding:10px; text-align:center; color:var(--text-secondary); font-size:12px;">Đang nạp bộ test cases...</div>`;

    try {
        const res = await CodeLearnApi.admin.getExerciseTestCases(exerciseId, lessonId);
        _currentExerciseTestCases = res.testcases || [];
        if (badge) badge.textContent = `${_currentExerciseTestCases.length} Test Cases`;
        renderTestCasesList();
    } catch (err) {
        container.innerHTML = `<div style="color:#ef4444; font-size:12px; padding:8px;">Lỗi nạp test cases: ${escapeHtml(err.message)}</div>`;
    }
}

function renderTestCasesList() {
    const container = document.getElementById("testCasesContainer");
    const badge = document.getElementById("tcCountBadge");
    if (!container) return;

    if (badge) badge.textContent = `${_currentExerciseTestCases.length} Test Cases`;

    if (!_currentExerciseTestCases.length) {
        container.innerHTML = `
            <div style="font-size:12px; color:var(--text-secondary); font-style:italic; text-align:center; padding:12px; background:var(--bg-tertiary); border-radius:8px;">
                Chưa có Test Case nào cho bài tập này. Hãy thêm mới bên dưới để Sandbox g++ tự động chấm điểm.
            </div>
        `;
        return;
    }

    container.innerHTML = _currentExerciseTestCases.map((tc, idx) => {
        const isHidden = tc.is_hidden === 1;
        const inputDisplay = tc.input_data ? escapeHtml(tc.input_data) : '<em style="color:var(--text-secondary); font-size:11px;">(không có stdin)</em>';
        const outputDisplay = escapeHtml(tc.expected_output || "");

        return `
            <div style="display:flex; justify-content:space-between; align-items:flex-start; gap:12px; padding:10px 14px; border-radius:8px; border:1px solid var(--border-color); background:var(--bg-card); ${isHidden ? 'border-left: 3px solid #8b5cf6;' : 'border-left: 3px solid #10b981;'}">
                <div style="flex:1; min-width:0;">
                    <div style="display:flex; align-items:center; gap:8px; margin-bottom:4px;">
                        <span style="font-weight:700; font-size:12px; color:var(--text-primary);">Test Case #${idx + 1}</span>
                        ${isHidden ? '<span class="status-tag warning" style="font-size:10px; padding:2px 6px;">🔒 Ẩn (Chống gian lận)</span>' : '<span class="status-tag success" style="font-size:10px; padding:2px 6px;">🟢 Công khai</span>'}
                        <span style="font-size:11px; color:#10b981; font-weight:600;">+${tc.weight_points || 50} điểm</span>
                    </div>
                    <div style="display:grid; grid-template-columns: 1fr 1fr; gap:8px; font-size:11px; font-family:monospace; margin-top:4px;">
                        <div style="background:var(--bg-tertiary); padding:6px 8px; border-radius:4px; max-height:60px; overflow-y:auto;">
                            <span style="color:var(--text-secondary); font-weight:600; display:block;">Input (stdin):</span>
                            ${inputDisplay}
                        </div>
                        <div style="background:var(--bg-tertiary); padding:6px 8px; border-radius:4px; max-height:60px; overflow-y:auto;">
                            <span style="color:var(--text-secondary); font-weight:600; display:block;">Expected Output:</span>
                            <span style="color:#0ea5e9;">${outputDisplay}</span>
                        </div>
                    </div>
                </div>
                <div style="display:flex; gap:6px; flex-shrink:0;">
                    <button type="button" class="btn btn-secondary btn-sm" onclick="editTestCaseItem('${tc.id}')" style="padding:4px 8px; font-size:11px;" title="Sửa Test Case">
                        Sửa
                    </button>
                    <button type="button" class="btn btn-danger btn-sm" onclick="deleteTestCaseItem('${tc.id}')" style="padding:4px 8px; font-size:11px;" title="Xóa Test Case">
                        🗑️
                    </button>
                </div>
            </div>
        `;
    }).join("");
}

function resetTestCaseForm() {
    const editId = document.getElementById("tcEditId");
    const inputData = document.getElementById("tcInputData");
    const outputData = document.getElementById("tcExpectedOutput");
    const isHidden = document.getElementById("tcIsHidden");
    const weightPoints = document.getElementById("tcWeightPoints");
    const boxTitle = document.getElementById("tcBoxTitle");
    const cancelBtn = document.getElementById("btnCancelTestCase");

    if (editId) editId.value = "";
    if (inputData) inputData.value = "";
    if (outputData) outputData.value = "";
    if (isHidden) isHidden.checked = false;
    if (weightPoints) weightPoints.value = "50";
    if (boxTitle) boxTitle.textContent = "➕ Thêm Test Case mới cho bài tập";
    if (cancelBtn) cancelBtn.hidden = true;
}

function editTestCaseItem(tcId) {
    const tc = _currentExerciseTestCases.find(t => t.id === tcId);
    if (!tc) return;

    setInputValue("tcEditId", tc.id);
    setInputValue("tcInputData", tc.input_data || "");
    setInputValue("tcExpectedOutput", tc.expected_output || "");
    const isHidden = document.getElementById("tcIsHidden");
    if (isHidden) isHidden.checked = (tc.is_hidden === 1);
    setInputValue("tcWeightPoints", tc.weight_points || 50);

    setText("tcBoxTitle", `✏️ Chỉnh sửa Test Case (${tc.id})`);
    const cancelBtn = document.getElementById("btnCancelTestCase");
    if (cancelBtn) cancelBtn.hidden = false;

    const box = document.getElementById("addTestCaseBox");
    if (box) box.scrollIntoView({ behavior: "smooth" });
}

async function deleteTestCaseItem(tcId) {
    if (!confirm("Bạn có chắc chắn muốn xóa Test Case này khỏi bài tập?")) return;
    try {
        await CodeLearnApi.admin.deleteTestCase(tcId);
        _currentExerciseTestCases = _currentExerciseTestCases.filter(t => t.id !== tcId);
        renderTestCasesList();
    } catch (err) {
        alert("Lỗi xóa Test Case: " + err.message);
    }
}

function setupTestCasesModule() {
    const saveBtn = document.getElementById("btnSaveTestCase");
    const cancelBtn = document.getElementById("btnCancelTestCase");

    if (cancelBtn) {
        cancelBtn.addEventListener("click", resetTestCaseForm);
    }

    if (saveBtn) {
        saveBtn.addEventListener("click", async () => {
            const exerciseId = document.getElementById("editExerciseId")?.value;
            const lessonId = document.getElementById("exerciseTargetLesson")?.value;
            if (!exerciseId) {
                alert("Vui lòng chọn hoặc lưu bài tập trước khi tạo Test Case!");
                return;
            }

            const tcId = document.getElementById("tcEditId")?.value;
            const inputData = document.getElementById("tcInputData")?.value || "";
            const expectedOutput = document.getElementById("tcExpectedOutput")?.value.trim();
            const isHidden = document.getElementById("tcIsHidden")?.checked ? 1 : 0;
            const weightPoints = parseInt(document.getElementById("tcWeightPoints")?.value || "50", 10);

            if (!expectedOutput) {
                alert("Vui lòng nhập kết quả mong đợi (Expected Output) của Test Case!");
                return;
            }

            saveBtn.disabled = true;
            saveBtn.textContent = "Đang lưu...";

            try {
                if (tcId) {
                    await CodeLearnApi.admin.updateTestCase(tcId, {
                        inputData,
                        expectedOutput,
                        isHidden,
                        weightPoints
                    });
                } else {
                    await CodeLearnApi.admin.createTestCase(exerciseId, {
                        lessonId,
                        inputData,
                        expectedOutput,
                        isHidden,
                        weightPoints,
                        orderNum: _currentExerciseTestCases.length + 1
                    });
                }
                resetTestCaseForm();
                await loadExerciseTestCases(exerciseId, lessonId);
            } catch (err) {
                alert("Lỗi lưu Test Case: " + err.message);
            } finally {
                saveBtn.disabled = false;
                saveBtn.textContent = "Lưu Test Case";
            }
        });
    }
}

window.editTestCaseItem = editTestCaseItem;
window.deleteTestCaseItem = deleteTestCaseItem;

async function deleteExercise(exId, lessonId) {
    if (!confirm(`Bạn có chắc chắn muốn xóa bài tập '${exId}' thuộc bài '${lessonId}' không?`)) {
        return;
    }

    try {
        if (window.CodeLearnApi && typeof CodeLearnApi.admin?.deleteExercise === "function") {
            await CodeLearnApi.admin.deleteExercise(exId, lessonId);
        }
        showFormMessage("exerciseActionMessage", "Đã xóa bài tập thành công.", "success");
        loadAdminExercises();
    } catch (err) {
        showFormMessage("exerciseActionMessage", `Lỗi xóa bài tập: ${err.message}`, "error");
    }
}

function resetExerciseForm() {
    setInputValue("editExerciseId", "");
    setInputValue("exerciseTitle", "");
    setInputValue("exerciseLevel", "Cơ bản");
    setInputValue("exerciseDifficulty", "easy");
    setInputValue("exercisePoints", "100");
    setInputValue("exerciseOrderNum", "1");
    setInputValue("exerciseDescription", "");
    setInputValue("exerciseStarterCode", "#include <iostream>\nusing namespace std;\n\nint main() {\n    // Code của bạn\n    return 0;\n}");
    setInputValue("exerciseExpectedOutput", "");
    setInputValue("exerciseHint", "");
    setInputValue("exerciseTestKeywords", "");
    setText("adminExerciseFormTitle", "Thêm bài tập mới");
    resetTestCaseForm();
    const tcContainer = document.getElementById("testCasesContainer");
    if (tcContainer) {
        tcContainer.innerHTML = `<div style="font-size:13px; color:var(--text-secondary); font-style:italic; text-align:center; padding:12px; background:var(--bg-tertiary); border-radius:8px;">Vui lòng chọn bài tập trong danh sách để quản lý các Test Cases.</div>`;
    }
    const badge = document.getElementById("tcCountBadge");
    if (badge) badge.textContent = "0 Test Cases";
}

// ============================================================
// 5. QUẢN LÝ THÀNH VIÊN & CẤP QUYỀN (USERS & ROLES)
// ============================================================
let _adminUsersCache = [];

async function loadAdminUsers() {
    const tbody = document.getElementById("adminUsersTableBody");
    if (!tbody) return;

    tbody.innerHTML = `<tr><td colspan="5" style="text-align: center; padding: 24px; color: var(--text-secondary);">Đang tải danh sách người dùng...</td></tr>`;

    try {
        let users = [];
        if (window.CodeLearnApi && typeof CodeLearnApi.admin?.getUsers === "function") {
            const res = await CodeLearnApi.admin.getUsers();
            users = res.users || [];
        }

        if (users.length === 0) {
            users = CppStorage.getUsers().map(u => ({
                id: u.id,
                username: u.username,
                email: u.email || `${u.username}@codelearn.local`,
                fullName: u.fullName || u.username,
                role: u.role || "student",
                avatar: u.avatar || "",
                createdAt: u.createdAt || "2026-01-01"
            }));
        }

        _adminUsersCache = users;
        renderUsersTable(users);
    } catch (err) {
        tbody.innerHTML = `<tr><td colspan="5" style="text-align: center; color: #ef4444; padding: 24px;">Lỗi tải người dùng: ${escapeHtml(err.message)}</td></tr>`;
    }
}

function renderUsersTable(users) {
    const tbody = document.getElementById("adminUsersTableBody");
    if (!tbody) return;

    const search = (document.getElementById("adminUserSearch")?.value || "").trim().toLowerCase();
    const roleFilter = document.getElementById("adminUserRoleFilter")?.value || "";

    const filtered = users.filter(u => {
        if (roleFilter && u.role !== roleFilter) return false;
        if (!search) return true;
        return (
            (u.username && u.username.toLowerCase().includes(search)) ||
            (u.fullName && u.fullName.toLowerCase().includes(search)) ||
            (u.email && u.email.toLowerCase().includes(search))
        );
    });

    if (filtered.length === 0) {
        tbody.innerHTML = `<tr><td colspan="5" style="text-align: center; padding: 24px; color: var(--text-secondary);">Không tìm thấy người dùng nào phù hợp.</td></tr>`;
        return;
    }

    const curUser = CppStorage.getCurrentUser();

    tbody.innerHTML = filtered.map(user => {
        const roleBadge = user.role === "admin"
            ? `<span class="badge-role badge-role-admin">Quản trị viên</span>`
            : user.role === "moderator"
            ? `<span class="badge-role badge-role-moderator">Trợ giảng</span>`
            : `<span class="badge-role badge-role-student">Học viên</span>`;

        const isMe = curUser && curUser.id === user.id;
        const isSuspended = user.status === "suspended";
        const statusBadge = isSuspended 
            ? `<span class="badge" style="background: rgba(239, 68, 68, 0.15); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.3); padding: 3px 8px; border-radius: 999px; font-size: 0.75rem; font-weight: 700;">Đã khóa</span>` 
            : `<span class="badge" style="background: rgba(16, 185, 129, 0.15); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.3); padding: 3px 8px; border-radius: 999px; font-size: 0.75rem; font-weight: 700;">Hoạt động</span>`;

        return `
            <tr style="${isSuspended ? 'opacity: 0.75; background: rgba(239, 68, 68, 0.04);' : ''}">
                <td>
                    <div class="table-user-cell">
                        <div class="table-user-avatar">
                            ${user.avatar ? `<img src="${escapeHtml(user.avatar)}" alt="${escapeHtml(user.username)}">` : escapeHtml((user.fullName || user.username || 'U')[0].toUpperCase())}
                        </div>
                        <div class="table-user-details">
                            <span class="table-user-name">${escapeHtml(user.fullName || user.username)} ${isMe ? '<small style="color: var(--primary);">(Bạn)</small>' : ''}</span>
                            <span class="table-user-sub">@${escapeHtml(user.username)}</span>
                        </div>
                    </div>
                </td>
                <td>${escapeHtml(user.email || 'N/A')}</td>
                <td>${roleBadge}</td>
                <td>${statusBadge}</td>
                <td style="font-size: 0.82rem; color: var(--text-secondary);">${user.createdAt ? user.createdAt.split('T')[0] : '2026-01-01'}</td>
                <td>
                    <div style="display: flex; gap: 6px; align-items: center; flex-wrap: wrap;">
                        <select class="profile-input select-user-role" data-id="${escapeHtml(user.id)}" style="padding: 4px 6px; font-size: 0.78rem; width: auto;" ${isMe ? 'disabled title="Không thể tự hạ quyền của bạn"' : ''}>
                            <option value="student" ${user.role === 'student' ? 'selected' : ''}>Học viên</option>
                            <option value="moderator" ${user.role === 'moderator' ? 'selected' : ''}>Trợ giảng</option>
                            <option value="admin" ${user.role === 'admin' ? 'selected' : ''}>Quản trị</option>
                        </select>
                        <button type="button" class="btn btn-primary btn-sm btn-save-role" data-id="${escapeHtml(user.id)}" style="padding: 5px 8px; font-size: 0.78rem;" ${isMe ? 'disabled' : ''}>
                            Cấp quyền
                        </button>
                        ${!isMe ? `
                            <button type="button" class="btn btn-sm btn-toggle-status" data-id="${escapeHtml(user.id)}" data-status="${escapeHtml(user.status || 'active')}" data-name="${escapeHtml(user.username)}" style="padding: 5px 8px; font-size: 0.78rem; background: ${isSuspended ? 'rgba(16, 185, 129, 0.12); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.25);' : 'rgba(245, 158, 11, 0.12); color: #d97706; border: 1px solid rgba(245, 158, 11, 0.25);'}" title="${isSuspended ? 'Mở khóa tài khoản' : 'Tạm khóa tài khoản'}">
                                ${isSuspended ? '🔓 Mở' : '🔒 Khóa'}
                            </button>
                            <button type="button" class="btn btn-sm btn-reset-password" data-id="${escapeHtml(user.id)}" data-name="${escapeHtml(user.username)}" style="padding: 5px 8px; font-size: 0.78rem; background: rgba(99, 102, 241, 0.12); color: #6366f1; border: 1px solid rgba(99, 102, 241, 0.25);" title="Cấp lại mật khẩu">
                                🔑 Đổi MK
                            </button>
                            <button type="button" class="btn btn-sm btn-delete-user" data-id="${escapeHtml(user.id)}" data-name="${escapeHtml(user.username)}" style="padding: 5px 8px; font-size: 0.78rem; background: rgba(239, 68, 68, 0.12); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.25);" title="Xóa tài khoản">
                                ✕
                            </button>
                        ` : ''}
                    </div>
                </td>
            </tr>
        `;
    }).join("");

    // Sự kiện cấp quyền
    tbody.querySelectorAll(".btn-save-role").forEach(btn => {
        btn.addEventListener("click", async () => {
            const uid = btn.getAttribute("data-id");
            const select = tbody.querySelector(`.select-user-role[data-id="${uid}"]`);
            if (!select) return;

            const newRole = select.value;
            btn.disabled = true;
            btn.textContent = "Đang lưu...";

            try {
                if (window.CodeLearnApi && typeof CodeLearnApi.admin?.changeUserRole === "function") {
                    await CodeLearnApi.admin.changeUserRole(uid, newRole);
                }
                showFormMessage("adminUserMessage", `Đã cập nhật quyền thành công!`, "success");
                loadAdminUsers();
            } catch (err) {
                showFormMessage("adminUserMessage", `Lỗi cấp quyền: ${err.message}`, "error");
            } finally {
                btn.disabled = false;
                btn.textContent = "Cấp quyền";
            }
        });
    });

    // Sự kiện khóa / mở khóa tài khoản
    tbody.querySelectorAll(".btn-toggle-status").forEach(btn => {
        btn.addEventListener("click", async () => {
            const uid = btn.getAttribute("data-id");
            const curStatus = btn.getAttribute("data-status") || "active";
            const uname = btn.getAttribute("data-name");
            const newStatus = curStatus === "active" ? "suspended" : "active";
            const actionText = newStatus === "suspended" ? "khóa tạm thời" : "mở khóa";

            if (!confirm(`Bạn có chắc chắn muốn ${actionText} tài khoản '${uname}' không?`)) {
                return;
            }

            try {
                if (window.CodeLearnApi && typeof CodeLearnApi.admin?.changeUserStatus === "function") {
                    await CodeLearnApi.admin.changeUserStatus(uid, newStatus);
                }
                showFormMessage("adminUserMessage", `Đã ${actionText} tài khoản '${uname}' thành công!`, "success");
                loadAdminUsers();
            } catch (err) {
                showFormMessage("adminUserMessage", `Lỗi cập nhật trạng thái: ${err.message}`, "error");
            }
        });
    });

    // Sự kiện cấp lại mật khẩu
    tbody.querySelectorAll(".btn-reset-password").forEach(btn => {
        btn.addEventListener("click", async () => {
            const uid = btn.getAttribute("data-id");
            const uname = btn.getAttribute("data-name");
            const newPass = prompt(`Nhập mật khẩu mới cho tài khoản '${uname}':`, "Cpp@123456");
            if (!newPass) return;

            try {
                if (window.CodeLearnApi && typeof CodeLearnApi.admin?.resetUserPassword === "function") {
                    await CodeLearnApi.admin.resetUserPassword(uid, newPass);
                }
                alert(`Đã cấp lại mật khẩu cho '${uname}' thành công!
Mật khẩu mới: ${newPass}`);
                showFormMessage("adminUserMessage", `Đã cấp lại mật khẩu cho '${uname}'.`, "success");
            } catch (err) {
                showFormMessage("adminUserMessage", `Lỗi cấp lại mật khẩu: ${err.message}`, "error");
            }
        });
    });

    // Sự kiện xóa user
    tbody.querySelectorAll(".btn-delete-user").forEach(btn => {
        btn.addEventListener("click", async () => {
            const uid = btn.getAttribute("data-id");
            const uname = btn.getAttribute("data-name");
            if (!confirm(`Bạn có chắc chắn muốn xóa vĩnh viễn tài khoản '${uname}' không?`)) {
                return;
            }

            try {
                if (window.CodeLearnApi && typeof CodeLearnApi.admin?.deleteUser === "function") {
                    await CodeLearnApi.admin.deleteUser(uid);
                }
                showFormMessage("adminUserMessage", `Đã xóa tài khoản '${uname}' thành công.`, "success");
                loadAdminUsers();
            } catch (err) {
                showFormMessage("adminUserMessage", `Lỗi xóa tài khoản: ${err.message}`, "error");
            }
        });
    });
}

function setupUserManagement() {
    const searchInput = document.getElementById("adminUserSearch");
    if (searchInput) {
        searchInput.addEventListener("input", () => {
            renderUsersTable(_adminUsersCache);
        });
    }

    const roleFilter = document.getElementById("adminUserRoleFilter");
    if (roleFilter) {
        roleFilter.addEventListener("change", () => {
            renderUsersTable(_adminUsersCache);
        });
    }

    const refreshBtn = document.getElementById("btnRefreshUsers");
    if (refreshBtn) {
        refreshBtn.addEventListener("click", () => {
            loadAdminUsers();
        });
    }
}

// ============================================================
// 6. NHẬT KÝ NỘP BÀI & GIÁM SÁT AI (MONITOR SECTION)
// ============================================================
let _adminSubmissionsCache = [];

async function loadAdminSubmissions() {
    const tbody = document.getElementById("adminSubmissionsTableBody");
    if (!tbody) return;

    tbody.innerHTML = `<tr><td colspan="7" style="text-align: center; padding: 20px; color: var(--text-secondary);">Đang tải lịch sử nộp bài...</td></tr>`;

    try {
        let subs = [];
        if (window.CodeLearnApi && typeof CodeLearnApi.admin?.getSubmissions === "function") {
            const res = await CodeLearnApi.admin.getSubmissions(50);
            subs = res.submissions || [];
        }

        _adminSubmissionsCache = subs;

        if (subs.length === 0) {
            tbody.innerHTML = `<tr><td colspan="7" style="text-align: center; padding: 20px; color: var(--text-secondary);">Chưa có bài nộp code nào được ghi nhận trong CSDL.</td></tr>`;
            return;
        }

        tbody.innerHTML = subs.map(s => {
            const isOverridden = s.teacherScore !== null && s.teacherScore !== undefined;
            const finalScore = isOverridden ? s.teacherScore : s.score;
            const scoreColor = finalScore >= 80 ? "#10b981" : finalScore >= 50 ? "#f59e0b" : "#ef4444";
            const statusBadge = s.passed
                ? `<span class="badge-role" style="background: rgba(16, 185, 129, 0.12); color: #10b981;">Đạt</span>`
                : `<span class="badge-role" style="background: rgba(239, 68, 68, 0.12); color: #ef4444;">Chưa đạt</span>`;

            return `
                <tr>
                    <td style="font-size: 0.8rem; color: var(--text-secondary); white-space: nowrap;">
                        ${s.submittedAt ? s.submittedAt.replace('T', ' ').slice(0, 19) : 'N/A'}
                    </td>
                    <td>
                        <div style="font-weight: 700; color: var(--text-primary);">${escapeHtml(s.fullName || s.username)}</div>
                        <div style="font-size: 0.75rem; color: var(--text-secondary);">@${escapeHtml(s.username)}</div>
                    </td>
                    <td>
                        <div style="font-weight: 600;">${escapeHtml(s.lessonTitle || s.lessonId)}</div>
                        <div style="font-size: 0.75rem; color: var(--text-secondary);">${escapeHtml(s.exerciseTitle || s.exerciseId)}</div>
                    </td>
                    <td>
                        <strong style="color: ${scoreColor}; font-size: 1rem;">${finalScore}/100</strong>
                        ${isOverridden ? '<div style="font-size: 0.72rem; color: #10b981; font-weight: 700;">✍️ GV đã chấm</div>' : '<div style="font-size: 0.72rem; color: var(--text-secondary);">🤖 AI chấm</div>'}
                    </td>
                    <td>${statusBadge}</td>
                    <td style="font-size: 0.82rem;">${s.executionTimeMs ? `${s.executionTimeMs}ms` : '0ms'}</td>
                    <td>
                        <button type="button" class="btn btn-secondary btn-sm btn-view-sub" data-id="${escapeHtml(s.id)}" style="padding: 5px 10px; font-size: 0.8rem;">
                            Xem Code &amp; AI
                        </button>
                    </td>
                </tr>
            `;
        }).join("");

        tbody.querySelectorAll(".btn-view-sub").forEach(btn => {
            btn.addEventListener("click", () => {
                const subId = btn.getAttribute("data-id");
                const item = _adminSubmissionsCache.find(x => x.id === subId);
                if (item) showSubmissionDetailModal(item);
            });
        });
    } catch (err) {
        tbody.innerHTML = `<tr><td colspan="7" style="text-align: center; color: #ef4444; padding: 20px;">Lỗi tải bài nộp: ${escapeHtml(err.message)}</td></tr>`;
    }
}

async function loadAdminAiChats() {
    const tbody = document.getElementById("adminAiChatsTableBody");
    if (!tbody) return;

    tbody.innerHTML = `<tr><td colspan="5" style="text-align: center; padding: 20px; color: var(--text-secondary);">Đang tải lịch sử trò chuyện AI...</td></tr>`;

    try {
        let chats = [];
        if (window.CodeLearnApi && typeof CodeLearnApi.admin?.getAiChats === "function") {
            const res = await CodeLearnApi.admin.getAiChats(50);
            chats = res.messages || [];
        }

        if (chats.length === 0) {
            tbody.innerHTML = `<tr><td colspan="5" style="text-align: center; padding: 20px; color: var(--text-secondary);">Chưa có lượt tương tác hỏi đáp AI nào được ghi nhận.</td></tr>`;
            return;
        }

        tbody.innerHTML = chats.map(c => `
            <tr>
                <td style="font-size: 0.8rem; color: var(--text-secondary); white-space: nowrap;">
                    ${c.createdAt ? c.createdAt.replace('T', ' ').slice(0, 19) : 'N/A'}
                </td>
                <td>
                    <div style="font-weight: 700;">${escapeHtml(c.fullName || c.username)}</div>
                    <div style="font-size: 0.75rem; color: var(--text-secondary);">@${escapeHtml(c.username)}</div>
                </td>
                <td>
                    <span class="badge-role badge-role-student" style="font-size: 0.72rem;">${escapeHtml(c.persona || 'tutor')}</span>
                </td>
                <td style="max-width: 250px;">
                    <div style="font-size: 0.85rem; color: var(--text-primary); white-space: pre-wrap; word-break: break-word;">${escapeHtml(c.role === 'user' ? c.content : '[Phản hồi của AI]')}</div>
                </td>
                <td style="max-width: 350px;">
                    <div style="font-size: 0.82rem; color: var(--text-secondary); max-height: 80px; overflow-y: auto; white-space: pre-wrap; word-break: break-word;">
                        ${escapeHtml(c.content?.slice(0, 300))}${c.content?.length > 300 ? '...' : ''}
                    </div>
                </td>
            </tr>
        `).join("");
    } catch (err) {
        tbody.innerHTML = `<tr><td colspan="5" style="text-align: center; color: #ef4444; padding: 20px;">Lỗi tải tin nhắn AI: ${escapeHtml(err.message)}</td></tr>`;
    }
}

function setupMonitorSection() {
    const btnRefSub = document.getElementById("btnRefreshSubmissions");
    if (btnRefSub) btnRefSub.addEventListener("click", loadAdminSubmissions);

    const btnRefAi = document.getElementById("btnRefreshAiChats");
    if (btnRefAi) btnRefAi.addEventListener("click", loadAdminAiChats);
}

// ============================================================
// 7. CSDL & TRI THỨC AI HUẤN LUYỆN (DATABASE & KNOWLEDGE BASE)
// ============================================================
async function loadAiKnowledge() {
    const vnoiTbody = document.getElementById("adminVnoiTableBody");
    const msgBox = document.getElementById("aiKnowledgeMessage");

    try {
        if (window.CodeLearnApi && typeof CodeLearnApi.admin?.getAiKnowledge === "function") {
            const data = await CodeLearnApi.admin.getAiKnowledge();
            setText("aiStatVnoi", data.vnoiCount ?? 19);
            setText("aiStatLessons", data.lessonCount ?? 20);
            setText("aiStatExercises", data.exerciseCount ?? 60);
            setText("aiStatLearned", data.submissionsLearned ?? 0);

            if (vnoiTbody && data.articles) {
                vnoiTbody.innerHTML = data.articles.map(art => `
                    <tr>
                        <td>
                            <strong style="color: var(--text-primary);">${escapeHtml(art.title)}</strong>
                        </td>
                        <td>
                            <span class="badge-role badge-role-student" style="font-size: 0.72rem;">${escapeHtml(art.category)}</span>
                        </td>
                        <td style="font-size: 0.84rem;">
                            ${escapeHtml(art.author || 'Cộng đồng VNOI')}
                        </td>
                        <td>
                            <a href="${escapeHtml(art.source_url)}" target="_blank" rel="noopener noreferrer" style="color: var(--primary); text-decoration: underline; font-size: 0.82rem;">
                                Xem bài viết &rarr;
                            </a>
                        </td>
                    </tr>
                `).join("");
            }
        }
    } catch (err) {
        console.warn("Lỗi load tri thức AI:", err);
    }
}

function setupDatabaseAndKnowledgeSection() {
    // 1. Sao lưu & Xuất DB
    const btnBackup = document.getElementById("btnDbBackup");
    const btnExport = document.getElementById("btnDbExport");
    const msgBox = document.getElementById("dbActionMessage");

    function showDbMsg(text, type = "success") {
        if (!msgBox) return;
        msgBox.textContent = text;
        msgBox.className = `form-message ${type}`;
        msgBox.hidden = false;
        setTimeout(() => {
            msgBox.hidden = true;
            msgBox.textContent = "";
        }, 5000);
    }

    window.loadDbStats = function () {
        if (window.CodeLearnApi && typeof CodeLearnApi.admin?.database?.getStats === "function") {
            CodeLearnApi.admin.database.getStats()
                .then(res => {
                    const stats = res.stats || {};
                    const tables = stats.tables || {};
                    setText("dbCountLessons", tables.lessons ?? 20);
                    setText("dbCountExercises", tables.exercises ?? 60);
                    setText("dbCountUsers", tables.users ?? 2);
                    setText("dbCountSubmissions", tables.submissions ?? 0);
                    setText("dbSizeKb", `${stats.size_kb || 144} KB`);
                    setText("dbStatus", res.integrity?.status || "HEALTHY");
                })
                .catch(() => {});
        }
    };

    window.loadDbStats();

    if (btnBackup) {
        btnBackup.addEventListener("click", async () => {
            btnBackup.disabled = true;
            btnBackup.textContent = "Đang sao lưu...";
            try {
                const res = await CodeLearnApi.admin.database.backup();
                showDbMsg(`Đã tạo bản sao lưu thành công: ${res.filename} (${res.size_kb} KB)`, "success");
                window.loadDbStats();
            } catch (err) {
                showDbMsg(`Lỗi khi tạo sao lưu: ${err.message}`, "error");
            } finally {
                btnBackup.disabled = false;
                btnBackup.textContent = "Sao lưu Database";
            }
        });
    }

    if (btnExport) {
        btnExport.addEventListener("click", async () => {
            btnExport.disabled = true;
            btnExport.textContent = "Đang xuất...";
            try {
                const res = await CodeLearnApi.admin.database.export();
                showDbMsg(`Đã xuất dữ liệu thành công ra backend/${res.sql} và backend/${res.json}!`, "success");
            } catch (err) {
                showDbMsg(`Lỗi khi xuất dữ liệu: ${err.message}`, "error");
            } finally {
                btnExport.disabled = false;
                btnExport.textContent = "Xuất SQL & JSON";
            }
        });
    }

    // 2. Đồng bộ tri thức vào AI
    const btnSyncAi = document.getElementById("btnSyncAiKnowledge");
    if (btnSyncAi) {
        btnSyncAi.addEventListener("click", async () => {
            btnSyncAi.disabled = true;
            btnSyncAi.textContent = "Đang đồng bộ...";
            try {
                const res = await CodeLearnApi.admin.syncAiKnowledge();
                showFormMessage("aiKnowledgeMessage", res.message || "Đã đồng bộ tri thức vào AI thành công!", "success");
                loadAiKnowledge();
            } catch (err) {
                showFormMessage("aiKnowledgeMessage", `Lỗi đồng bộ tri thức: ${err.message}`, "error");
            } finally {
                btnSyncAi.disabled = false;
                btnSyncAi.textContent = "⚡ Đồng bộ tri thức vào AI";
            }
        });
    }

    // 3. Hộp thử nghiệm AI Mentor
    const btnTestAi = document.getElementById("btnTestAiQuery");
    const inputTest = document.getElementById("aiTestQuestionInput");
    const resBox = document.getElementById("aiTestResponseBox");

    if (btnTestAi && inputTest && resBox) {
        btnTestAi.addEventListener("click", async () => {
            const query = inputTest.value.trim();
            if (!query) return;

            btnTestAi.disabled = true;
            btnTestAi.textContent = "AI đang suy nghĩ...";
            resBox.style.display = "block";
            resBox.innerHTML = `<em>Đang tra cứu dữ liệu thật từ CSDL và tạo phản hồi...</em>`;

            try {
                const res = await fetch(`${CodeLearnApi.API_BASE_URL}/ai/ask`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": `Bearer ${CodeLearnApi.getToken()}`
                    },
                    body: JSON.stringify({
                        message: query,
                        persona: "tutor"
                    })
                });
                const data = await res.json();
                const replyHtml = escapeHtml(data.reply || "Không có phản hồi.")
                    .replace(/\n\n/g, "<br><br>")
                    .replace(/\n/g, "<br>");

                resBox.innerHTML = `
                    <div style="font-weight: 700; color: var(--primary); margin-bottom: 8px;">
                        Phản hồi từ AI Trợ giảng (Dữ liệu CSDL):
                    </div>
                    <div>${replyHtml}</div>
                `;
            } catch (err) {
                resBox.innerHTML = `<span style="color: #ef4444;">Lỗi thử nghiệm AI: ${escapeHtml(err.message)}</span>`;
            } finally {
                btnTestAi.disabled = false;
                btnTestAi.textContent = "Gửi AI thử nghiệm";
            }
        });
    }
}

// ============================================================
// 8. MODAL DIALOG PREVIEW
// ============================================================
function setupModalDialog() {
    const modal = document.getElementById("adminDetailModal");
    const closeBtn = document.getElementById("btnCloseDetailModal");

    if (modal && closeBtn) {
        closeBtn.addEventListener("click", () => {
            modal.style.display = "none";
        });

        modal.addEventListener("click", (e) => {
            if (e.target === modal) {
                modal.style.display = "none";
            }
        });
    }
}

function showSubmissionDetailModal(item) {
    const modal = document.getElementById("adminDetailModal");
    const body = document.getElementById("adminModalBody");
    const title = document.getElementById("adminModalTitle");
    if (!modal || !body) return;

    if (title) {
        title.textContent = `Bài nộp: ${item.fullName || item.username} - ${item.exerciseTitle || item.exerciseId}`;
    }

    body.innerHTML = `
        <div style="margin-bottom: 16px; font-size: 0.9rem;">
            <strong>Học viên:</strong> ${escapeHtml(item.fullName || item.username)} (@${escapeHtml(item.username)})<br>
            <strong>Chuyên đề:</strong> ${escapeHtml(item.lessonTitle || item.lessonId)} &bull; <strong>Bài tập:</strong> ${escapeHtml(item.exerciseTitle || item.exerciseId)}<br>
            <strong>Điểm số:</strong> <span style="color: ${item.score >= 80 ? '#10b981' : '#ef4444'}; font-weight: 700;">${item.score}/100</span> &bull; 
            <strong>Thời gian thực thi:</strong> ${item.executionTimeMs || 0}ms<br>
            <strong>Thời điểm nộp:</strong> ${item.submittedAt ? item.submittedAt.replace('T', ' ') : 'N/A'}
        </div>

        <h4 style="margin-bottom: 8px;">Mã nguồn C++ học viên đã viết:</h4>
        <pre style="background: #0f172a; color: #f8fafc; padding: 14px; border-radius: 10px; font-family: monospace; font-size: 0.85rem; overflow-x: auto; max-height: 250px;"><code>${escapeHtml(item.code || '// Không có code')}</code></pre>

        ${item.output ? `
            <h4 style="margin: 12px 0 8px 0;">Kết quả thực thi g++:</h4>
            <pre style="background: rgba(0,0,0,0.06); padding: 10px; border-radius: 8px; font-family: monospace; font-size: 0.82rem; overflow-x: auto;">${escapeHtml(item.output)}</pre>
        ` : ''}

        ${item.aiFeedback ? `
            <h4 style="margin: 14px 0 8px 0; color: var(--primary);">Đánh giá &amp; Nhận xét của AI:</h4>
            <div style="background: rgba(99, 102, 241, 0.08); border-left: 4px solid var(--primary); padding: 12px; border-radius: 6px; font-size: 0.88rem; line-height: 1.5; white-space: pre-wrap;">
                ${escapeHtml(item.aiFeedback)}
            </div>
        ` : ''}

        <!-- Teacher Grading & Feedback Form -->
        <div style="margin-top: 18px; padding: 16px; border-radius: 12px; background: rgba(16, 185, 129, 0.05); border: 1px solid rgba(16, 185, 129, 0.3);">
            <h4 style="margin: 0 0 10px 0; color: #10b981; display: flex; align-items: center; gap: 8px;">
                <span>✍️</span> Can thiệp Chấm điểm &amp; Lời phê của Giảng viên (Teacher Override)
            </h4>
            <div style="display: flex; gap: 12px; margin-bottom: 12px; flex-wrap: wrap;">
                <div style="flex: 1; min-width: 140px;">
                    <label style="font-size: 0.8rem; font-weight: 700; display: block; margin-bottom: 4px;">Điểm số (0 - 100):</label>
                    <input type="number" id="teacherOverrideScore" class="profile-input" min="0" max="100" value="${item.teacherScore !== null && item.teacherScore !== undefined ? item.teacherScore : item.score}">
                </div>
                <div style="flex: 1; min-width: 140px;">
                    <label style="font-size: 0.8rem; font-weight: 700; display: block; margin-bottom: 4px;">Trạng thái bài nộp:</label>
                    <select id="teacherOverridePassed" class="profile-input">
                        <option value="1" ${item.passed ? 'selected' : ''}>Đạt (Passed)</option>
                        <option value="0" ${!item.passed ? 'selected' : ''}>Chưa đạt (Failed)</option>
                    </select>
                </div>
            </div>
            <div style="margin-bottom: 12px;">
                <label style="font-size: 0.8rem; font-weight: 700; display: block; margin-bottom: 4px;">Lời phê / Nhận xét của Giảng viên:</label>
                <textarea id="teacherOverrideFeedback" class="profile-input" rows="3" placeholder="Nhập lời phê chuyên môn hoặc góp ý tối ưu thuật toán...">${escapeHtml(item.teacherFeedback || '')}</textarea>
            </div>
            ${item.gradedBy ? `
                <div style="font-size: 0.8rem; color: var(--text-secondary); margin-bottom: 10px;">
                    <em>Đã được chấm lại bởi <strong>${escapeHtml(item.gradedBy)}</strong> lúc ${item.gradedAt ? item.gradedAt.replace('T', ' ').slice(0, 19) : ''}</em>
                </div>
            ` : ''}
            <div style="display: flex; gap: 8px;">
                <button type="button" id="btnSaveTeacherGrade" class="btn btn-primary" style="padding: 7px 14px; font-size: 0.85rem;">
                    💾 Lưu điểm &amp; Gửi lời phê
                </button>
            </div>
        </div>
    `;

    modal.style.display = "flex";

    const btnSaveGrade = document.getElementById("btnSaveTeacherGrade");
    if (btnSaveGrade) {
        btnSaveGrade.addEventListener("click", async () => {
            const scoreVal = parseInt(document.getElementById("teacherOverrideScore")?.value || "100", 10);
            const passedVal = document.getElementById("teacherOverridePassed")?.value === "1";
            const feedbackVal = document.getElementById("teacherOverrideFeedback")?.value || "";

            btnSaveGrade.disabled = true;
            btnSaveGrade.textContent = "Đang lưu...";
            try {
                if (window.CodeLearnApi && typeof CodeLearnApi.admin?.gradeSubmission === "function") {
                    const res = await CodeLearnApi.admin.gradeSubmission(item.id, {
                        score: scoreVal,
                        passed: passedVal,
                        feedback: feedbackVal
                    });
                    alert(res.message || "Đã lưu điểm và gửi lời phê thành công!");
                    modal.style.display = "none";
                    loadAdminSubmissions();
                    if (typeof loadAdminAnalytics === "function") loadAdminAnalytics();
                } else {
                    item.score = scoreVal;
                    item.passed = passedVal;
                    item.teacherScore = scoreVal;
                    item.teacherFeedback = feedbackVal;
                    alert("Đã cập nhật điểm số bài nộp!");
                    modal.style.display = "none";
                    loadAdminSubmissions();
                }
            } catch (err) {
                alert(`Lỗi khi lưu điểm: ${err.message}`);
            } finally {
                btnSaveGrade.disabled = false;
                btnSaveGrade.textContent = "💾 Lưu điểm & Gửi lời phê";
            }
        });
    }
}

// ============================================================
// 8. QUẢN TRỊ TƯƠNG TÁC & THÔNG BÁO (COMMUNITY & ANNOUNCEMENTS)
// ============================================================
let _adminCommentsList = [];

function setupCommunitySection() {
    const annForm = document.getElementById("formBroadcastAnnouncement");
    if (annForm) {
        annForm.addEventListener("submit", async (e) => {
            e.preventDefault();
            const titleInput = document.getElementById("annTitleInput");
            const typeSelect = document.getElementById("annTypeSelect");
            const contentInput = document.getElementById("annContentInput");
            const submitBtn = document.getElementById("btnSubmitAnnouncement");

            const title = titleInput.value.trim();
            const type = typeSelect.value;
            const content = contentInput.value.trim();

            if (!title || !content) {
                alert("Vui lòng điền đầy đủ tiêu đề và nội dung thông báo.");
                return;
            }

            submitBtn.disabled = true;
            submitBtn.textContent = "Đang gửi...";

            try {
                const res = await CodeLearnApi.admin.createAnnouncement({ title, type, content });
                if (res && res.message) {
                    if (typeof window.showToast === "function") {
                        window.showToast("Đã phát thanh thông báo thành công!", "success");
                    } else {
                        alert("Đã phát thanh thông báo thành công!");
                    }
                    annForm.reset();
                    loadAdminAnnouncements();
                } else {
                    alert(res?.error || "Không thể tạo thông báo.");
                }
            } catch (err) {
                console.error("Lỗi tạo thông báo:", err);
                alert("Đã xảy ra lỗi khi tạo thông báo: " + err.message);
            } finally {
                submitBtn.disabled = false;
                submitBtn.innerHTML = `<span>🚀</span> Phát thông báo ngay`;
            }
        });
    }

    const filterStatus = document.getElementById("filterCommentStatus");
    if (filterStatus) {
        filterStatus.addEventListener("change", () => {
            renderCommentsTable();
        });
    }

    const refreshBtn = document.getElementById("btnRefreshComments");
    if (refreshBtn) {
        refreshBtn.addEventListener("click", () => {
            loadAdminComments();
        });
    }
}

async function loadAdminAnnouncements() {
    const tbody = document.getElementById("announcementsTableBody");
    if (!tbody) return;
    tbody.innerHTML = `<tr><td colspan="6" style="text-align:center; padding:20px; color:var(--text-secondary);">Đang nạp danh sách thông báo...</td></tr>`;

    try {
        const res = await CodeLearnApi.admin.getAnnouncements();
        const announcements = res.announcements || [];
        if (!announcements.length) {
            tbody.innerHTML = `<tr><td colspan="6" style="text-align:center; padding:20px; color:var(--text-secondary);">Chưa có thông báo nào được phát.</td></tr>`;
            return;
        }

        const typeLabels = {
            info: { text: "Thông tin", class: "status-tag info", icon: "ℹ️" },
            warning: { text: "Lưu ý", class: "status-tag warning", icon: "⚠️" },
            success: { text: "Sự kiện", class: "status-tag success", icon: "🎉" },
            urgent: { text: "Khẩn cấp", class: "status-tag error", icon: "🚨" }
        };

        tbody.innerHTML = announcements.map(ann => {
            const meta = typeLabels[ann.type] || typeLabels.info;
            const timeStr = ann.created_at ? new Date(ann.created_at).toLocaleString("vi-VN") : "---";
            const isActive = ann.is_active === 1;

            return `
                <tr>
                    <td style="font-weight:600; color:var(--text-primary);">${escapeHtml(ann.title)}</td>
                    <td style="color:var(--text-secondary); max-width:280px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${escapeHtml(ann.content)}">${escapeHtml(ann.content)}</td>
                    <td>
                        <span class="${meta.class}" style="font-size:12px; padding:3px 8px; border-radius:6px;">
                            ${meta.icon} ${meta.text}
                        </span>
                    </td>
                    <td style="font-size:12px; color:var(--text-secondary);">${timeStr}</td>
                    <td>
                        <span class="status-tag ${isActive ? "success" : "warning"}" style="font-size:12px;">
                            ${isActive ? "🟢 Đang phát" : "⚪ Đã ẩn"}
                        </span>
                    </td>
                    <td style="text-align:center; white-space:nowrap;">
                        <button type="button" class="btn btn-sm ${isActive ? "btn-secondary" : "btn-primary"}" onclick="toggleAnnouncementStatus('${ann.id}', ${isActive ? 0 : 1})" title="${isActive ? "Ẩn thông báo" : "Kích hoạt phát"}">
                            ${isActive ? "Tắt" : "Bật"}
                        </button>
                        <button type="button" class="btn btn-sm btn-danger" onclick="deleteAnnouncement('${ann.id}')" title="Xóa thông báo" style="margin-left:4px;">
                            🗑️
                        </button>
                    </td>
                </tr>
            `;
        }).join("");
    } catch (err) {
        console.error("Lỗi nạp thông báo:", err);
        tbody.innerHTML = `<tr><td colspan="6" style="text-align:center; padding:20px; color:#ef4444;">Lỗi nạp dữ liệu: ${err.message}</td></tr>`;
    }
}

async function toggleAnnouncementStatus(id, newStatus) {
    try {
        await CodeLearnApi.admin.updateAnnouncement(id, { isActive: newStatus === 1 });
        loadAdminAnnouncements();
    } catch (err) {
        alert("Lỗi cập nhật thông báo: " + err.message);
    }
}

async function deleteAnnouncement(id) {
    if (!confirm("Bạn có chắc chắn muốn xóa vĩnh viễn thông báo này?")) return;
    try {
        await CodeLearnApi.admin.deleteAnnouncement(id);
        loadAdminAnnouncements();
    } catch (err) {
        alert("Lỗi xóa thông báo: " + err.message);
    }
}

async function loadAdminComments() {
    const tbody = document.getElementById("commentsTableBody");
    if (!tbody) return;
    tbody.innerHTML = `<tr><td colspan="6" style="text-align:center; padding:20px; color:var(--text-secondary);">Đang nạp danh sách bình luận...</td></tr>`;

    try {
        const res = await CodeLearnApi.admin.getComments();
        _adminCommentsList = res.comments || [];
        renderCommentsTable();
    } catch (err) {
        console.error("Lỗi nạp bình luận:", err);
        tbody.innerHTML = `<tr><td colspan="6" style="text-align:center; padding:20px; color:#ef4444;">Lỗi nạp bình luận: ${err.message}</td></tr>`;
    }
}

function renderCommentsTable() {
    const tbody = document.getElementById("commentsTableBody");
    if (!tbody) return;

    const filter = document.getElementById("filterCommentStatus")?.value || "all";
    let list = _adminCommentsList;

    if (filter === "approved") {
        list = list.filter(c => c.status !== "hidden");
    } else if (filter === "hidden") {
        list = list.filter(c => c.status === "hidden");
    } else if (filter === "pinned") {
        list = list.filter(c => c.is_pinned === 1);
    }

    if (!list.length) {
        tbody.innerHTML = `<tr><td colspan="6" style="text-align:center; padding:24px; color:var(--text-secondary);">Không có bình luận nào phù hợp bộ lọc.</td></tr>`;
        return;
    }

    tbody.innerHTML = list.map(c => {
        const isHidden = c.status === "hidden";
        const isPinned = c.is_pinned === 1;
        const timeStr = c.created_at ? new Date(c.created_at).toLocaleString("vi-VN") : "---";
        const authorName = c.full_name || c.username || "Ẩn danh";
        const roleLabel = c.role === "admin" ? '<span class="status-tag primary" style="font-size:10px;">Admin</span>' : '';

        return `
            <tr style="${isHidden ? 'opacity: 0.65; background: rgba(239, 68, 68, 0.05);' : ''}">
                <td>
                    <div style="display:flex; align-items:center; gap:8px;">
                        <span style="font-size:16px;">👤</span>
                        <div>
                            <div style="font-weight:600; font-size:13px; color:var(--text-primary);">${escapeHtml(authorName)} ${roleLabel}</div>
                            <div style="font-size:11px; color:var(--text-secondary);">@${escapeHtml(c.username || "")}</div>
                        </div>
                    </div>
                </td>
                <td style="font-size:13px; color:var(--text-secondary);">
                    <div style="font-weight:500; color:var(--text-primary);">${escapeHtml(c.lesson_title || c.lesson_id)}</div>
                    <div style="font-size:11px; color:var(--text-secondary);">${escapeHtml(c.lesson_id)}</div>
                </td>
                <td style="color:var(--text-primary); font-size:13px; max-width:320px; word-break:break-word;">
                    ${isPinned ? '<span style="color:#f59e0b; font-weight:700; margin-right:4px;">📌 [Đã Ghim]</span>' : ''}
                    ${escapeHtml(c.content)}
                </td>
                <td style="font-size:12px; color:var(--text-secondary);">${timeStr}</td>
                <td>
                    ${isHidden ? '<span class="status-tag error" style="font-size:12px;">🚫 Đã ẩn</span>' : '<span class="status-tag success" style="font-size:12px;">✅ Hiển thị</span>'}
                </td>
                <td style="text-align:center; white-space:nowrap;">
                    <button type="button" class="btn btn-sm ${isPinned ? 'btn-secondary' : 'btn-outline'}" onclick="toggleCommentPin('${c.id}', ${isPinned ? 0 : 1})" title="${isPinned ? 'Bỏ ghim' : 'Ghim bình luận lên đầu'}" style="margin-right:4px;">
                        ${isPinned ? '📍 Bỏ ghim' : '📌 Ghim'}
                    </button>
                    <button type="button" class="btn btn-sm ${isHidden ? 'btn-primary' : 'btn-secondary'}" onclick="toggleCommentHidden('${c.id}', '${isHidden ? 'approved' : 'hidden'}')" title="${isHidden ? 'Hiện lại bình luận' : 'Ẩn bình luận khỏi học viên'}" style="margin-right:4px;">
                        ${isHidden ? '👁️ Hiện' : '🚫 Ẩn'}
                    </button>
                    <button type="button" class="btn btn-sm btn-danger" onclick="deleteComment('${c.id}')" title="Xóa vĩnh viễn">
                        🗑️
                    </button>
                </td>
            </tr>
        `;
    }).join("");
}

async function toggleCommentPin(id, pinVal) {
    try {
        await CodeLearnApi.admin.updateCommentStatus(id, { isPinned: pinVal });
        loadAdminComments();
    } catch (err) {
        alert("Lỗi cập nhật ghim bình luận: " + err.message);
    }
}

async function toggleCommentHidden(id, statusVal) {
    try {
        await CodeLearnApi.admin.updateCommentStatus(id, { status: statusVal });
        loadAdminComments();
    } catch (err) {
        alert("Lỗi cập nhật hiển thị bình luận: " + err.message);
    }
}

async function deleteComment(id) {
    if (!confirm("Bạn có chắc muốn xóa bình luận này vĩnh viễn?")) return;
    try {
        await CodeLearnApi.admin.deleteComment(id);
        loadAdminComments();
    } catch (err) {
        alert("Lỗi xóa bình luận: " + err.message);
    }
}

window.toggleAnnouncementStatus = toggleAnnouncementStatus;
window.deleteAnnouncement = deleteAnnouncement;
window.toggleCommentPin = toggleCommentPin;
window.toggleCommentHidden = toggleCommentHidden;
window.deleteComment = deleteComment;

// ============================================================
// TIỆN ÍCH DÙNG CHUNG (UTILITIES)
// ============================================================
function showFormMessage(elementId, message, type = "success") {
    const el = document.getElementById(elementId);
    if (!el) return;

    el.textContent = message;
    el.className = `form-message ${type}`;
    el.hidden = false;

    if (typeof window.showToast === "function") {
        window.showToast(message, type);
    }

    setTimeout(() => {
        el.hidden = true;
        el.textContent = "";
    }, 4500);
}

function setInputValue(id, value) {
    const el = document.getElementById(id);
    if (el) el.value = value ?? "";
}

function setText(id, value) {
    const el = document.getElementById(id);
    if (el) el.textContent = value;
}

function escapeHtml(value) {
    if (value === null || value === undefined) return "";
    return String(value)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}