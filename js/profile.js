// ============================================================
// CODELEARN C++ - PROFILE PAGE
// File: js/profile.js
// ============================================================

document.addEventListener("DOMContentLoaded", () => {
    const currentUser = CppStorage.getCurrentUser();

    if (!currentUser) {
        return;
    }

    // Hiển thị thông tin cá nhân
    renderProfile(currentUser);

    // Hiển thị thống kê học tập
    renderProfileStats(currentUser);

    // Hiển thị tiến độ
    renderProfileProgress(currentUser);

    // Hiển thị thành tích
    renderAchievements(currentUser);

    // Xử lý form chỉnh sửa tài khoản
    setupProfileForm(currentUser);

    // Xử lý đăng xuất
    setupProfileLogout();
});


// ============================================================
// HIỂN THỊ THÔNG TIN PROFILE
// ============================================================

function renderProfile(user) {

    // Username
    setText(
        "profileUsername",
        user.username || "Người học"
    );

    // Email
    setText(
        "profileEmail",
        user.email || "Chưa cập nhật"
    );

    // Username trong form
    const usernameInput =
        document.getElementById("profileUsernameInput");

    if (usernameInput) {
        usernameInput.value =
            user.username || "";
    }

    // Email trong form
    const emailInput =
        document.getElementById("profileEmailInput");

    if (emailInput) {
        emailInput.value =
            user.email || "";
    }

    // Role
    const roleElement =
        document.getElementById("profileRole");

    if (roleElement) {
        roleElement.textContent =
            user.role === "admin"
                ? "Quản trị viên"
                : "Học viên";
    }

    const adminLink =
        document.getElementById("profileAdminLink");

    if (adminLink) {
        adminLink.style.display =
            user.role === "admin"
                ? "flex"
                : "none";
    }

    // Ngày tham gia
    const joinDate =
        document.getElementById("profileJoinDate");

    if (joinDate) {
        joinDate.textContent =
            formatDate(
                user.createdAt
            );
    }

    // Avatar
    updateProfileAvatar(user);
}


// ============================================================
// AVATAR
// ============================================================

function updateProfileAvatar(user) {

    const avatar =
        document.getElementById(
            "profileAvatar"
        );

    if (!avatar) {
        return;
    }

    // Nếu có avatar
    if (user.avatar) {

        if (avatar.tagName === "IMG") {
            avatar.src = user.avatar;
            avatar.alt =
                `Ảnh đại diện ${user.username}`;
        }

        return;
    }

    // Nếu không có avatar
    const firstLetter =
        (
            user.username ||
            user.email ||
            "U"
        )
        .charAt(0)
        .toUpperCase();

    if (avatar.tagName === "IMG") {

        avatar.style.display =
            "none";

        const parent =
            avatar.parentElement;

        if (parent) {
            parent.setAttribute(
                "data-avatar-letter",
                firstLetter
            );
        }

    } else {

        avatar.textContent =
            firstLetter;
    }
}


// ============================================================
// THỐNG KÊ HỌC TẬP
// ============================================================

function renderProfileStats(user) {

    const lessons =
        CppStorage.getLessons();

    const progress =
        CppStorage.getUserProgress(
            user.id
        );


    const totalLessons =
        lessons.length;


    const completedLessons =
        lessons.filter(
            lesson =>
                progress[
                    lesson.id
                ]?.completed === true
        ).length;


    const percent =
        totalLessons > 0
            ? Math.round(
                completedLessons /
                totalLessons *
                100
            )
            : 0;


    // Tổng bài học
    setText(
        "profileTotalLessons",
        totalLessons
    );


    // Bài hoàn thành
    setText(
        "profileCompletedLessons",
        completedLessons
    );


    // Phần trăm
    setText(
        "profileProgress",
        `${percent}%`
    );

    setText(
        "profileProgressPercent",
        `${percent}%`
    );


    // Điểm trung bình
    const scores =
        lessons
            .map(
                lesson =>
                    progress[
                        lesson.id
                    ]?.score
            )
            .filter(
                score =>
                    typeof score === "number"
            );


    const averageScore =
        scores.length > 0
            ? Math.round(
                scores.reduce(
                    (sum, score) =>
                        sum + score,
                    0
                ) / scores.length
            )
            : 0;


    setText(
        "profileAverageScore",
        `${averageScore}/100`
    );
}


// ============================================================
// TIẾN ĐỘ HỌC
// ============================================================

function renderProfileProgress(user) {

    const lessons =
        CppStorage.getLessons();

    const progress =
        CppStorage.getUserProgress(
            user.id
        );


    const total =
        lessons.length;


    const completed =
        lessons.filter(
            lesson =>
                progress[
                    lesson.id
                ]?.completed === true
        ).length;


    const percent =
        total > 0
            ? Math.round(
                completed /
                total *
                100
            )
            : 0;


    // Progress bar
    const progressBar =
        document.getElementById(
            "profileProgressBar"
        );

    if (progressBar) {
        progressBar.style.width =
            `${percent}%`;
    }


    // Text
    setText(
        "profileProgressText",
        `${completed}/${total} bài học`
    );


    // Phần trăm
    setText(
        "profileProgressValue",
        `${percent}%`
    );


    // Danh sách bài học gần đây
    renderRecentLessons(
        lessons,
        progress
    );
}


// ============================================================
// BÀI HỌC GẦN ĐÂY
// ============================================================

function renderRecentLessons(
    lessons,
    progress
) {

    const container =
        document.getElementById(
            "recentLessons"
        );

    if (!container) {
        return;
    }


    const completedLessons =
        lessons
            .filter(
                lesson =>
                    progress[
                        lesson.id
                    ]?.completed === true
            )
            .slice(-5)
            .reverse();


    if (!completedLessons.length) {

        container.innerHTML = `
            <div class="empty-state">

                <div class="empty-state-icon">
                    📚
                </div>

                <h3>
                    Chưa có bài hoàn thành
                </h3>

                <p>
                    Hãy bắt đầu học bài đầu tiên
                    để theo dõi tiến độ của bạn.
                </p>

                <a
                    href="lessons.html"
                    class="btn btn-primary"
                >
                    Bắt đầu học →
                </a>

            </div>
        `;

        return;
    }


    container.innerHTML =
        completedLessons
            .map(
                (lesson, index) => {

                    const lessonProgress =
                        progress[
                            lesson.id
                        ] || {};


                    return `
                        <div class="recent-lesson-item">

                            <div class="recent-lesson-number">
                                ${index + 1}
                            </div>

                            <div class="recent-lesson-info">

                                <h4>
                                    ${escapeHtml(
                                        lesson.title
                                    )}
                                </h4>

                                <span>
                                    ${escapeHtml(
                                        lesson.chapter ||
                                        "C++ Cơ bản"
                                    )}
                                </span>

                            </div>

                            <div class="recent-lesson-score">
                                ${
                                    lessonProgress.score !==
                                    undefined
                                        ? `${lessonProgress.score}/100`
                                        : "✓"
                                }
                            </div>

                            <a
                                href="lesson-detail.html?id=${encodeURIComponent(
                                    lesson.id
                                )}"
                                aria-label="Xem lại bài ${escapeHtml(
                                    lesson.title
                                )}"
                            >
                                →
                            </a>

                        </div>
                    `;
                }
            )
            .join("");
}


// ============================================================
// THÀNH TÍCH
// ============================================================

function renderAchievements(user) {

    const container =
        document.getElementById(
            "achievementsList"
        );

    if (!container) {
        return;
    }


    const lessons =
        CppStorage.getLessons();

    const progress =
        CppStorage.getUserProgress(
            user.id
        );


    const completed =
        lessons.filter(
            lesson =>
                progress[
                    lesson.id
                ]?.completed === true
        ).length;


    const scores =
        lessons
            .map(
                lesson =>
                    progress[
                        lesson.id
                    ]?.score
            )
            .filter(
                score =>
                    typeof score === "number"
            );


    const average =
        scores.length
            ? Math.round(
                scores.reduce(
                    (sum, score) =>
                        sum + score,
                    0
                ) /
                scores.length
            )
            : 0;


    const achievements = [

        {
            icon: "🎯",
            title: "Bắt đầu học",
            description:
                "Hoàn thành bài học đầu tiên.",
            unlocked:
                completed >= 1
        },

        {
            icon: "🔥",
            title: "Đang tiến bộ",
            description:
                "Hoàn thành 3 bài học.",
            unlocked:
                completed >= 3
        },

        {
            icon: "🏆",
            title: "Chinh phục C++",
            description:
                "Hoàn thành toàn bộ khóa học.",
            unlocked:
                lessons.length > 0 &&
                completed >= lessons.length
        },

        {
            icon: "⭐",
            title: "Điểm cao",
            description:
                "Đạt điểm trung bình từ 80 trở lên.",
            unlocked:
                average >= 80
        },

        {
            icon: "💻",
            title: "Coder",
            description:
                "Hoàn thành ít nhất 5 bài.",
            unlocked:
                completed >= 5
        },

        {
            icon: "🚀",
            title: "C++ Master",
            description:
                "Hoàn thành khóa học với thành tích tốt.",
            unlocked:
                lessons.length > 0 &&
                completed >= lessons.length &&
                average >= 80
        }

    ];


    container.innerHTML =
        achievements
            .map(
                achievement => {

                    return `
                        <div class="
                            achievement-card
                            ${
                                achievement.unlocked
                                    ? "unlocked"
                                    : "locked"
                            }
                        ">

                            <div class="achievement-icon">
                                ${achievement.icon}
                            </div>

                            <div class="achievement-info">

                                <h3>
                                    ${achievement.title}
                                </h3>

                                <p>
                                    ${achievement.description}
                                </p>

                            </div>

                            <div class="achievement-status">
                                ${
                                    achievement.unlocked
                                        ? "✓"
                                        : "🔒"
                                }
                            </div>

                        </div>
                    `;
                }
            )
            .join("");
}


// ============================================================
// FORM CHỈNH SỬA PROFILE
// ============================================================

function setupProfileForm(
    currentUser
) {

    const form =
        document.getElementById(
            "profileForm"
        );

    if (!form) {
        return;
    }


    form.addEventListener(
        "submit",
        event => {

            event.preventDefault();


            const usernameInput =
                document.getElementById(
                    "profileUsernameInput"
                );

            const emailInput =
                document.getElementById(
                    "profileEmailInput"
                );


            const newUsername =
                usernameInput
                    ? usernameInput.value.trim()
                    : currentUser.username;


            const newEmail =
                emailInput
                    ? emailInput.value.trim()
                    : currentUser.email;


            // --------------------------------------------
            // Kiểm tra username
            // --------------------------------------------

            if (
                newUsername.length < 3
            ) {

                showProfileMessage(
                    "Tên người dùng phải có ít nhất 3 ký tự.",
                    "error"
                );

                return;
            }


            // --------------------------------------------
            // Kiểm tra email
            // --------------------------------------------

            if (
                !isValidEmail(newEmail)
            ) {

                showProfileMessage(
                    "Email không hợp lệ.",
                    "error"
                );

                return;
            }


            // --------------------------------------------
            // Kiểm tra username trùng
            // --------------------------------------------

            const users =
                CppStorage.getUsers();


            const duplicateUsername =
                users.find(
                    user =>
                        user.id !== currentUser.id &&
                        user.username.toLowerCase() ===
                        newUsername.toLowerCase()
                );


            if (duplicateUsername) {

                showProfileMessage(
                    "Tên người dùng đã tồn tại.",
                    "error"
                );

                return;
            }


            // --------------------------------------------
            // Kiểm tra mật khẩu (nếu có nhập)
            // --------------------------------------------

            const passwordInput =
                document.getElementById(
                    "profilePasswordInput"
                );

            const newPassword =
                passwordInput
                    ? passwordInput.value.trim()
                    : "";

            if (newPassword && newPassword.length < 6) {
                showProfileMessage(
                    "Mật khẩu mới phải có ít nhất 6 ký tự.",
                    "error"
                );
                return;
            }


            // --------------------------------------------
            // Cập nhật
            // --------------------------------------------

            const updateData = {
                username: newUsername,
                email: newEmail
            };

            if (newPassword) {
                updateData.password = newPassword;
            }

            const updatedUser =
                CppStorage.updateUser(
                    currentUser.id,
                    updateData
                );


            if (!updatedUser) {

                showProfileMessage(
                    "Không thể cập nhật tài khoản.",
                    "error"
                );

                return;
            }


            // --------------------------------------------
            // Cập nhật current user
            // --------------------------------------------

            CppStorage.setCurrentUser(
                updatedUser
            );


            // --------------------------------------------
            // Xóa trường mật khẩu
            // --------------------------------------------

            if (passwordInput) {
                passwordInput.value = "";
            }


            // --------------------------------------------
            // Hiển thị lại dữ liệu
            // --------------------------------------------

            renderProfile(
                updatedUser
            );


            showProfileMessage(
                "✓ Cập nhật thông tin thành công.",
                "success"
            );
        }
    );

    // Xử lý nút Hủy
    const cancelBtn = document.getElementById("cancelProfileEdit");
    if (cancelBtn) {
        cancelBtn.addEventListener("click", () => {
            const user = CppStorage.getCurrentUser() || currentUser;
            const uInput = document.getElementById("profileUsernameInput");
            const eInput = document.getElementById("profileEmailInput");
            const pInput = document.getElementById("profilePasswordInput");
            if (uInput) uInput.value = user.username || "";
            if (eInput) eInput.value = user.email || "";
            if (pInput) pInput.value = "";
            const msg = document.getElementById("profileMessage");
            if (msg) {
                msg.textContent = "";
                msg.className = "form-message";
                msg.hidden = true;
            }
        });
    }
}


// ============================================================
// ĐĂNG XUẤT
// ============================================================

function setupProfileLogout() {

    const button =
        document.getElementById(
            "profileLogoutButton"
        );

    if (!button) {
        return;
    }


    button.addEventListener(
        "click",
        event => {

            event.preventDefault();


            const confirmLogout =
                confirm(
                    "Bạn có chắc chắn muốn đăng xuất không?"
                );


            if (!confirmLogout) {
                return;
            }


            CppStorage.logout();

            window.location.href =
                "login.html";
        }
    );
}


// ============================================================
// MESSAGE
// ============================================================

function showProfileMessage(
    message,
    type
) {

    const element =
        document.getElementById(
            "profileMessage"
        );

    if (!element) {
        return;
    }


    element.textContent =
        message;


    element.className =
        `form-message ${type}`;


    // Tự ẩn sau 4 giây
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
// VALIDATE EMAIL
// ============================================================

function isValidEmail(
    email
) {

    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        .test(email);
}


// ============================================================
// FORMAT DATE
// ============================================================

function formatDate(
    value
) {

    if (!value) {
        return "Chưa xác định";
    }


    const date =
        new Date(value);


    if (Number.isNaN(
        date.getTime()
    )) {
        return "Chưa xác định";
    }


    return date.toLocaleDateString(
        "vi-VN",
        {
            day: "2-digit",
            month: "2-digit",
            year: "numeric"
        }
    );
}


// ============================================================
// SET TEXT
// ============================================================

function setText(
    id,
    value
) {

    const element =
        document.getElementById(id);


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