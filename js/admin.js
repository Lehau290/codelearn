// ============================================================
// CODELEARN C++ - ADMIN PAGE
// File: js/admin.js
// ============================================================

document.addEventListener("DOMContentLoaded", () => {
    const currentUser = CppStorage.getCurrentUser();

    // --------------------------------------------------------
    // Kiểm tra đăng nhập
    // --------------------------------------------------------

    if (!currentUser) {
        window.location.href = "login.html";
        return;
    }

    // --------------------------------------------------------
    // Kiểm tra quyền Admin
    // --------------------------------------------------------

    if (currentUser.role !== "admin") {
        alert(
            "Bạn không có quyền truy cập trang quản trị."
        );

        window.location.href = "home.html";
        return;
    }

    // --------------------------------------------------------
    // Khởi tạo trang Admin
    // --------------------------------------------------------

    renderAdminStats();

    renderAdminLessons();

    setupLessonSearch();

    setupLessonForm();

    setupCancelButton();

    setupAddNewButton();

    setupDatabaseSection();
});


// ============================================================
// THỐNG KÊ ADMIN
// ============================================================

function renderAdminStats() {

    const lessons =
        CppStorage.getLessons();

    const users =
        CppStorage.getUsers();


    // Tổng bài học
    setText(
        "adminTotalLessons",
        lessons.length
    );

    setText(
        "adminPublishedLessons",
        lessons.length
    );


    // Tổng người dùng
    setText(
        "adminTotalUsers",
        users.length
    );


    // Bài đã tạo gần đây
    const recentLessons =
        lessons.filter(
            lesson =>
                lesson.createdAt
        ).length;


    setText(
        "adminRecentLessons",
        recentLessons
    );


    // Tổng lượt hoàn thành
    let totalCompleted = 0;


    users.forEach(user => {

        const progress =
            CppStorage.getUserProgress(
                user.id
            );


        Object.values(
            progress
        ).forEach(item => {

            if (
                item &&
                item.completed === true
            ) {
                totalCompleted++;
            }

        });
    });


    setText(
        "adminCompletedLessons",
        totalCompleted
    );
}


// ============================================================
// HIỂN THỊ DANH SÁCH BÀI HỌC
// ============================================================

function renderAdminLessons(
    searchText = ""
) {

    const container =
        document.getElementById("lessonsAdminList") ||
        document.getElementById("adminLessonList");

    if (!container) {
        return;
    }


    const lessons =
        CppStorage.getLessons();


    const search =
        searchText
            .trim()
            .toLowerCase();


    const filteredLessons =
        lessons.filter(
            lesson => {

                if (!search) {
                    return true;
                }


                return (
                    String(
                        lesson.title || ""
                    )
                    .toLowerCase()
                    .includes(search)
                    ||

                    String(
                        lesson.chapter || ""
                    )
                    .toLowerCase()
                    .includes(search)
                    ||

                    String(
                        lesson.description || ""
                    )
                    .toLowerCase()
                    .includes(search)
                );
            }
        );


    if (!filteredLessons.length) {

        container.innerHTML = `
            <div class="empty-state">

                <h3>
                    Không tìm thấy bài học
                </h3>

                <p>
                    Hãy thử nhập từ khóa khác.
                </p>

            </div>
        `;

        return;
    }


    container.innerHTML =
        filteredLessons
            .map(
                (lesson, index) =>
                    createAdminLessonRow(
                        lesson,
                        index
                    )
            )
            .join("");


    // --------------------------------------------------------
    // Nút sửa
    // --------------------------------------------------------

    container
        .querySelectorAll(
            "[data-action='edit']"
        )
        .forEach(button => {

            button.addEventListener(
                "click",
                () => {

                    const id =
                        button.dataset.id;

                    editLesson(id);
                }
            );
        });


    // --------------------------------------------------------
    // Nút xóa
    // --------------------------------------------------------

    container
        .querySelectorAll(
            "[data-action='delete']"
        )
        .forEach(button => {

            button.addEventListener(
                "click",
                () => {

                    const id =
                        button.dataset.id;

                    deleteLesson(id);
                }
            );
        });
}


// ============================================================
// TẠO DÒNG BÀI HỌC ADMIN
// ============================================================

function createAdminLessonRow(
    lesson,
    index
) {

    return `
        <div class="admin-lesson-item">

            <div class="admin-lesson-number">
                ${index + 1}
            </div>


            <div class="admin-lesson-info">

                <span class="admin-lesson-chapter">
                    ${escapeHtml(
                        lesson.chapter ||
                        "C++ Cơ bản"
                    )}
                </span>

                <h3>
                    ${escapeHtml(
                        lesson.title ||
                        "Bài học"
                    )}
                </h3>

                <p>
                    ${escapeHtml(
                        lesson.description ||
                        "Chưa có mô tả."
                    )}
                </p>

            </div>


            <div class="admin-lesson-meta">

                <span>
                    ${escapeHtml(
                        lesson.level ||
                        "Cơ bản"
                    )}
                </span>

                <span>
                    ${escapeHtml(
                        lesson.duration ||
                        "15 phút"
                    )}
                </span>

            </div>


            <div class="admin-lesson-actions">

                <a
                    href="lesson-detail.html?id=${encodeURIComponent(
                        lesson.id
                    )}"
                    class="btn btn-secondary"
                    title="Xem trước bài học"
                >
                    Xem
                </a>

                <button
                    type="button"
                    class="btn btn-secondary"
                    data-action="edit"
                    data-id="${escapeHtml(
                        lesson.id
                    )}"
                >
                    Sửa
                </button>


                <button
                    type="button"
                    class="btn btn-danger"
                    data-action="delete"
                    data-id="${escapeHtml(
                        lesson.id
                    )}"
                >
                    Xóa
                </button>

            </div>

        </div>
    `;
}


// ============================================================
// TÌM KIẾM BÀI HỌC
// ============================================================

function setupLessonSearch() {

    const searchInput =
        document.getElementById(
            "adminLessonSearch"
        );

    if (!searchInput) {
        return;
    }


    searchInput.addEventListener(
        "input",
        () => {

            renderAdminLessons(
                searchInput.value
            );
        }
    );
}


// ============================================================
// HỖ TRỢ TRUY CẬP PHẦN TỬ FORM (HỖ TRỢ CẢ 2 BỘ ID)
// ============================================================

function getFormField(id1, id2) {
    return document.getElementById(id1) || (id2 ? document.getElementById(id2) : null);
}

function getFormValue(id1, id2) {
    const el = getFormField(id1, id2);
    return el ? el.value : "";
}

function setFormValue(id1, id2, val) {
    const el = getFormField(id1, id2);
    if (el) el.value = val ?? "";
}


// ============================================================
// NÚT THÊM BÀI HỌC MỚI
// ============================================================

function setupAddNewButton() {
    const btn = document.getElementById("addNewLessonButton");
    if (!btn) return;

    btn.addEventListener("click", () => {
        resetLessonForm();
        const formSection =
            document.getElementById("adminLessonFormSection") ||
            document.getElementById("adminLessonForm") ||
            document.getElementById("lessonForm");

        if (formSection) {
            formSection.scrollIntoView({ behavior: "smooth", block: "start" });
        }

        const titleInput = getFormField("lessonTitle", "lessonTitleInput");
        if (titleInput) {
            titleInput.focus();
        }
    });
}


// ============================================================
// FORM THÊM / SỬA BÀI HỌC
// ============================================================

function setupLessonForm() {
    const form =
        document.getElementById("adminLessonForm") ||
        document.getElementById("lessonForm");

    if (!form) {
        return;
    }

    form.addEventListener("submit", event => {
        event.preventDefault();
        saveLessonFromForm();
    });
}


// ============================================================
// LƯU BÀI HỌC
// ============================================================

function saveLessonFromForm() {
    const lessonId = getFormValue("editLessonId", "lessonId").trim();
    const title = getFormValue("lessonTitle", "lessonTitleInput").trim();
    const chapter = getFormValue("lessonChapter", "lessonChapterInput").trim() || "C++ Cơ bản";
    const description = getFormValue("lessonDescription", "lessonDescriptionInput").trim();
    const level = getFormValue("lessonLevel", "lessonLevelInput") || "Cơ bản";
    const duration = getFormValue("lessonDuration", "lessonDurationInput").trim() || "15 phút";
    const theory = getFormValue("lessonContent", "lessonTheoryInput").trim();
    const example = getFormValue("lessonExample", "lessonExampleInput");
    const exerciseTitle = getFormValue("lessonExerciseTitle", "lessonExerciseTitleInput").trim() || "Bài tập thực hành";
    const exerciseDescription = getFormValue("lessonExerciseDescription", "lessonExerciseDescriptionInput").trim();
    const starterCode = getFormValue("lessonStarterCode", "lessonStarterCodeInput");

    // --------------------------------------------------------
    // Kiểm tra bắt buộc
    // --------------------------------------------------------

    if (!title) {
        showAdminMessage(
            "Vui lòng nhập tên bài học.",
            "error"
        );
        return;
    }

    // --------------------------------------------------------
    // Tạo object bài học (hỗ trợ cả content/theory, example/exampleCode)
    // --------------------------------------------------------

    const lessonData = {
        title,
        chapter,
        description,
        level,
        duration,
        theory,
        content: theory,
        exampleCode: example,
        example: example,
        exerciseTitle,
        exerciseDescription,
        starterCode
    };

    // --------------------------------------------------------
    // Nếu có ID → sửa
    // --------------------------------------------------------

    if (lessonId) {
        const updated =
            CppStorage.updateLesson(
                lessonId,
                lessonData
            );

        if (!updated) {
            showAdminMessage(
                "Không thể cập nhật bài học.",
                "error"
            );
            return;
        }

        showAdminMessage(
            "Đã cập nhật bài học.",
            "success"
        );
    } else {
        // ----------------------------------------------------
        // Nếu không có ID → tạo mới
        // ----------------------------------------------------

        const newLesson =
            CppStorage.createLesson(
                lessonData
            );

        if (!newLesson) {
            showAdminMessage(
                "Không thể tạo bài học.",
                "error"
            );
            return;
        }

        showAdminMessage(
            "Đã tạo bài học mới.",
            "success"
        );
    }

    // --------------------------------------------------------
    // Reset form
    // --------------------------------------------------------

    resetLessonForm();


    // --------------------------------------------------------
    // Cập nhật giao diện
    // --------------------------------------------------------

    renderAdminStats();

    renderAdminLessons();
}


// ============================================================
// SỬA BÀI HỌC
// ============================================================

function editLesson(
    lessonId
) {

    const lessons =
        CppStorage.getLessons();


    const lesson =
        lessons.find(
            item =>
                String(item.id) ===
                String(lessonId)
        );


    if (!lesson) {

        showAdminMessage(
            "Không tìm thấy bài học.",
            "error"
        );

        return;
    }


    // --------------------------------------------------------
    // Đổ dữ liệu vào form
    // --------------------------------------------------------

    setFormValue("editLessonId", "lessonId", lesson.id);
    setFormValue("lessonTitle", "lessonTitleInput", lesson.title);
    setFormValue("lessonChapter", "lessonChapterInput", lesson.chapter);
    setFormValue("lessonDescription", "lessonDescriptionInput", lesson.description);
    setFormValue("lessonLevel", "lessonLevelInput", lesson.level);
    setFormValue("lessonDuration", "lessonDurationInput", lesson.duration);
    setFormValue("lessonContent", "lessonTheoryInput", lesson.content || lesson.theory || "");
    setFormValue("lessonExample", "lessonExampleInput", lesson.example || lesson.exampleCode || "");
    setFormValue("lessonExerciseTitle", "lessonExerciseTitleInput", lesson.exerciseTitle);
    setFormValue("lessonExerciseDescription", "lessonExerciseDescriptionInput", lesson.exerciseDescription);
    setFormValue("lessonStarterCode", "lessonStarterCodeInput", lesson.starterCode);

    // --------------------------------------------------------
    // Đổi tiêu đề form
    // --------------------------------------------------------

    setText("adminFormTitle", "Chỉnh sửa bài học");
    setText("lessonFormTitle", "Chỉnh sửa bài học");

    const submitButton =
        document.getElementById("saveLessonButton") ||
        document.querySelector("#adminLessonForm button[type='submit']") ||
        document.querySelector("#lessonForm button[type='submit']");

    if (submitButton) {
        submitButton.textContent = "Lưu thay đổi";
    }

    // --------------------------------------------------------
    // Cuộn tới form
    // --------------------------------------------------------

    const formSection =
        document.getElementById("adminLessonFormSection") ||
        document.getElementById("adminLessonForm") ||
        document.getElementById("lessonForm");

    if (formSection) {
        formSection.scrollIntoView({
            behavior: "smooth",
            block: "start"
        });
    }
}


// ============================================================
// XÓA BÀI HỌC
// ============================================================

function deleteLesson(
    lessonId
) {

    const lessons =
        CppStorage.getLessons();


    const lesson =
        lessons.find(
            item =>
                String(item.id) ===
                String(lessonId)
        );


    if (!lesson) {

        showAdminMessage(
            "Không tìm thấy bài học.",
            "error"
        );

        return;
    }


    const confirmed =
        confirm(
            `Bạn có chắc muốn xóa bài "${lesson.title}" không?`
        );


    if (!confirmed) {
        return;
    }


    const deleted =
        CppStorage.deleteLesson(
            lessonId
        );


    if (!deleted) {

        showAdminMessage(
            "Không thể xóa bài học.",
            "error"
        );

        return;
    }


    showAdminMessage(
        "Đã xóa bài học.",
        "success"
    );


    // Cập nhật giao diện
    renderAdminStats();

    renderAdminLessons();

    resetLessonForm();
}


// ============================================================
// NÚT HỦY
// ============================================================

function setupCancelButton() {
    const button =
        document.getElementById("cancelEdit") ||
        document.getElementById("cancelLessonButton");

    if (!button) {
        return;
    }

    button.addEventListener(
        "click",
        event => {
            event.preventDefault();
            resetLessonForm();
        }
    );
}


// ============================================================
// RESET FORM
// ============================================================

function resetLessonForm() {
    const form =
        document.getElementById("adminLessonForm") ||
        document.getElementById("lessonForm");

    if (form) {
        form.reset();
    }

    setFormValue("editLessonId", "lessonId", "");
    setText("adminFormTitle", "Thêm bài học");
    setText("lessonFormTitle", "Thêm bài học mới");

    const submitButton =
        document.getElementById("saveLessonButton") ||
        document.querySelector("#adminLessonForm button[type='submit']") ||
        document.querySelector("#lessonForm button[type='submit']");

    if (submitButton) {
        submitButton.textContent = "Lưu bài học";
    }
}


// ============================================================
// MESSAGE
// ============================================================

function showAdminMessage(
    message,
    type = "info"
) {

    const element =
        document.getElementById(
            "adminMessage"
        );


    if (!element) {
        return;
    }


    element.textContent =
        message;


    element.className =
        `form-message ${type}`;


    setTimeout(
        () => {

            element.textContent =
                "";

            element.className =
                "form-message";

        },
        4000
    );
}


// ============================================================
// SET INPUT
// ============================================================

function setInputValue(
    id,
    value
) {

    const element =
        document.getElementById(
            id
        );


    if (element) {
        element.value =
            value ?? "";
    }
}


// ============================================================
// SET TEXT
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
// QUẢN LÝ CƠ SỞ DỮ LIỆU (DATABASE SECTION)
// ============================================================

function setupDatabaseSection() {
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

    function loadDbStats() {
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
                .catch(() => {
                    const lessons = CppStorage.getLessons();
                    const users = CppStorage.getUsers();
                    setText("dbCountLessons", lessons.length);
                    setText("dbCountExercises", lessons.length * 3);
                    setText("dbCountUsers", users.length);
                });
        }
    }

    loadDbStats();

    if (btnBackup) {
        btnBackup.addEventListener("click", () => {
            btnBackup.disabled = true;
            btnBackup.textContent = "Đang sao lưu...";
            if (window.CodeLearnApi && typeof CodeLearnApi.admin?.database?.backup === "function") {
                CodeLearnApi.admin.database.backup()
                    .then(res => {
                        btnBackup.disabled = false;
                        btnBackup.textContent = "Sao lưu Database";
                        showDbMsg(`Đã tạo bản sao lưu thành công: ${res.filename} (${res.size_kb} KB)`, "success");
                        loadDbStats();
                    })
                    .catch(err => {
                        btnBackup.disabled = false;
                        btnBackup.textContent = "Sao lưu Database";
                        showDbMsg(`Lỗi khi tạo sao lưu: ${err.message}`, "error");
                    });
            } else {
                btnBackup.disabled = false;
                btnBackup.textContent = "Sao lưu Database";
                showDbMsg("Backend đang chạy chế độ offline hoặc chưa khởi động.", "info");
            }
        });
    }

    if (btnExport) {
        btnExport.addEventListener("click", () => {
            btnExport.disabled = true;
            btnExport.textContent = "Đang xuất...";
            if (window.CodeLearnApi && typeof CodeLearnApi.admin?.database?.export === "function") {
                CodeLearnApi.admin.database.export()
                    .then(res => {
                        btnExport.disabled = false;
                        btnExport.textContent = "Xuất SQL & JSON";
                        showDbMsg(`Đã xuất dữ liệu thành công ra backend/${res.sql} và backend/${res.json}!`, "success");
                    })
                    .catch(err => {
                        btnExport.disabled = false;
                        btnExport.textContent = "Xuất SQL & JSON";
                        showDbMsg(`Lỗi khi xuất dữ liệu: ${err.message}`, "error");
                    });
            } else {
                btnExport.disabled = false;
                btnExport.textContent = "Xuất SQL & JSON";
                showDbMsg("Backend đang chạy chế độ offline.", "info");
            }
        });
    }
}