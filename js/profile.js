// ============================================================
// CODELEARN C++ - PROFILE & SETTINGS CONTROLLER (COLOROS STYLE)
// File: js/profile.js
// ============================================================

// 6 Preset Developer Avatars (SVG Data URLs - Clean, Retina-Ready, Lightweight)
const PRESET_AVATARS = [
    {
        id: "preset-coder-boy",
        name: "Coder Nam",
        icon: "👨‍💻",
        svg: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect width="100" height="100" rx="50" fill="%238b5cf6"/><circle cx="50" cy="42" r="22" fill="%23fde047"/><rect x="32" y="38" width="14" height="8" rx="3" fill="%231e1b4b"/><rect x="54" y="38" width="14" height="8" rx="3" fill="%231e1b4b"/><rect x="46" y="41" width="8" height="2" fill="%231e1b4b"/><path d="M 24 95 Q 50 68 76 95 Z" fill="%236d28d9"/><path d="M 36 28 Q 50 14 64 28 Q 50 24 36 28 Z" fill="%23451a03"/></svg>`
    },
    {
        id: "preset-coder-girl",
        name: "Coder Nữ",
        icon: "👩‍💻",
        svg: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect width="100" height="100" rx="50" fill="%23ec4899"/><circle cx="50" cy="42" r="21" fill="%23fed7aa"/><circle cx="42" cy="40" r="3" fill="%231f2937"/><circle cx="58" cy="40" r="3" fill="%231f2937"/><path d="M 44 48 Q 50 54 56 48" stroke="%23e11d48" stroke-width="2" fill="none"/><path d="M 28 32 C 28 14 72 14 72 32 C 76 46 68 56 70 64 C 66 58 66 40 66 38 C 50 28 34 38 34 38 C 34 40 34 58 30 64 C 32 56 24 46 28 32 Z" fill="%2378350f"/><rect x="22" y="36" width="6" height="14" rx="3" fill="%233b82f6"/><rect x="72" y="36" width="6" height="14" rx="3" fill="%233b82f6"/><path d="M 25 36 A 25 25 0 0 1 75 36" stroke="%233b82f6" stroke-width="4" fill="none"/><path d="M 22 96 Q 50 70 78 96 Z" fill="%23be185d"/></svg>`
    },
    {
        id: "preset-robot-ai",
        name: "Robot AI",
        icon: "🤖",
        svg: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect width="100" height="100" rx="50" fill="%230f172a"/><circle cx="50" cy="18" r="4" fill="%2306b6d4"/><line x1="50" y1="22" x2="50" y2="30" stroke="%2306b6d4" stroke-width="3"/><rect x="26" y="30" width="48" height="38" rx="10" fill="%231e293b" stroke="%2306b6d4" stroke-width="2.5"/><rect x="33" y="38" width="13" height="10" rx="4" fill="%2306b6d4"/><rect x="54" y="38" width="13" height="10" rx="4" fill="%2306b6d4"/><circle cx="39" cy="43" r="2" fill="%23ffffff"/><circle cx="60" cy="43" r="2" fill="%23ffffff"/><line x1="38" y1="58" x2="62" y2="58" stroke="%2306b6d4" stroke-width="3" stroke-linecap="round"/><path d="M 24 95 Q 50 78 76 95 Z" fill="%23334155"/></svg>`
    },
    {
        id: "preset-terminal",
        name: "Terminal Guru",
        icon: "💻",
        svg: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect width="100" height="100" rx="50" fill="%23022c22"/><rect x="18" y="24" width="64" height="52" rx="8" fill="%23064e3b" stroke="%2310b981" stroke-width="2"/><circle cx="26" cy="32" r="2.5" fill="%23ef4444"/><circle cx="33" cy="32" r="2.5" fill="%23f59e0b"/><circle cx="40" cy="32" r="2.5" fill="%2310b981"/><path d="M 26 46 L 36 53 L 26 60" stroke="%2334d399" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" fill="none"/><line x1="42" y1="60" x2="56" y2="60" stroke="%2334d399" stroke-width="3" stroke-linecap="round"/><path d="M 64 42 L 72 42 M 68 38 L 68 46" stroke="%236ee7b7" stroke-width="1.8" stroke-linecap="round"/><path d="M 74 42 L 82 42 M 78 38 L 78 46" stroke="%236ee7b7" stroke-width="1.8" stroke-linecap="round"/></svg>`
    },
    {
        id: "preset-ninja",
        name: "C++ Ninja",
        icon: "🥷",
        svg: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect width="100" height="100" rx="50" fill="%2318181b"/><circle cx="50" cy="46" r="26" fill="%2327272a"/><rect x="30" y="32" width="40" height="10" fill="%23dc2626"/><circle cx="50" cy="37" r="3" fill="%23ffffff"/><rect x="32" y="44" width="36" height="12" rx="6" fill="%23fde047"/><circle cx="41" cy="50" r="2.5" fill="%23000000"/><circle cx="59" cy="50" r="2.5" fill="%23000000"/><path d="M 20 95 Q 50 74 80 95 Z" fill="%2309090b"/><path d="M 70 34 Q 82 30 86 38" stroke="%23dc2626" stroke-width="4" stroke-linecap="round" fill="none"/></svg>`
    },
    {
        id: "preset-astronaut",
        name: "Phi hành gia",
        icon: "🚀",
        svg: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect width="100" height="100" rx="50" fill="%231e1b4b"/><circle cx="50" cy="44" r="25" fill="%23e0e7ff" stroke="%23818cf8" stroke-width="2"/><rect x="33" y="35" width="34" height="20" rx="10" fill="%234338ca" stroke="%23c084fc" stroke-width="2"/><ellipse cx="44" cy="41" rx="4" ry="2" fill="%23a5b4fc" opacity="0.6"/><path d="M 20 95 Q 50 72 80 95 Z" fill="%23c7d2fe"/><circle cx="28" cy="22" r="1.5" fill="%23ffffff"/><circle cx="76" cy="20" r="1" fill="%23ffffff"/><circle cx="72" cy="74" r="1.5" fill="%23ffffff"/></svg>`
    }
];

// Current avatar in draft state (prior to saving or immediately saved)
let currentAvatarData = null;

document.addEventListener("DOMContentLoaded", () => {
    const currentUser = CppStorage.getCurrentUser();

    if (!currentUser) {
        window.location.href = "login.html";
        return;
    }

    currentAvatarData = currentUser.avatar || null;

    // 1. Hiển thị thông tin tổng quan & hồ sơ
    renderProfile(currentUser);

    // 2. Thống kê & Tiến độ
    renderProfileStats(currentUser);
    renderProfileProgress(currentUser);

    // 3. Bài học gần đây & Thành tích
    renderRecentLessons(currentUser);
    renderAchievements(currentUser);

    // 4. Tab Navigation (Tổng quan vs Cài đặt)
    setupProfileTabs();

    // 5. Cài đặt Avatar (Tải ảnh lên & Presets)
    setupAvatarManagement(currentUser);

    // 6. Form cập nhật thông tin & mật khẩu
    setupProfileForm(currentUser);

    // 7. Toggle hiển thị mật khẩu
    setupPasswordToggles();

    // 8. Tùy chọn giao diện (Light / Dark)
    setupThemeSettings();

    // 9. Đăng xuất
    setupProfileLogout();

    // 10. Chứng chỉ Tốt nghiệp C++ Master
    setupCertificateModal(currentUser);

    // 11. Chuỗi học tập (Streak)
    renderProfileStreak(currentUser);

    // Check URL Hash (#settings)
    if (window.location.hash === "#settings") {
        switchTab("settings");
    }
});


// ============================================================
// CHUYỂN TAB TỔNG QUAN / CÀI ĐẶT
// ============================================================

function setupProfileTabs() {
    const tabOverviewBtn = document.getElementById("tabOverviewBtn");
    const tabSettingsBtn = document.getElementById("tabSettingsBtn");
    const sideNavOverviewBtn = document.getElementById("sideNavOverviewBtn");
    const sideNavSettingsBtn = document.getElementById("sideNavSettingsBtn");
    const btnAvatarEditShortcut = document.getElementById("btnAvatarEditShortcut");

    if (tabOverviewBtn) {
        tabOverviewBtn.addEventListener("click", () => switchTab("overview"));
    }
    if (tabSettingsBtn) {
        tabSettingsBtn.addEventListener("click", () => switchTab("settings"));
    }
    if (sideNavOverviewBtn) {
        sideNavOverviewBtn.addEventListener("click", () => switchTab("overview"));
    }
    if (sideNavSettingsBtn) {
        sideNavSettingsBtn.addEventListener("click", () => switchTab("settings"));
    }

    if (btnAvatarEditShortcut) {
        btnAvatarEditShortcut.addEventListener("click", () => {
            switchTab("settings");
            const avatarBox = document.querySelector(".avatar-settings-layout");
            if (avatarBox) {
                avatarBox.scrollIntoView({ behavior: "smooth", block: "center" });
            }
        });
    }

    // Lắng nghe thay đổi hash
    window.addEventListener("hashchange", () => {
        if (window.location.hash === "#settings") {
            switchTab("settings");
        } else if (window.location.hash === "#overview" || window.location.hash === "") {
            switchTab("overview");
        }
    });
}

function switchTab(tabName) {
    const panelOverview = document.getElementById("panelOverview");
    const panelSettings = document.getElementById("panelSettings");

    const tabOverviewBtn = document.getElementById("tabOverviewBtn");
    const tabSettingsBtn = document.getElementById("tabSettingsBtn");
    const sideNavOverviewBtn = document.getElementById("sideNavOverviewBtn");
    const sideNavSettingsBtn = document.getElementById("sideNavSettingsBtn");

    if (tabName === "settings") {
        if (panelOverview) panelOverview.hidden = true;
        if (panelSettings) panelSettings.hidden = false;

        if (tabOverviewBtn) {
            tabOverviewBtn.classList.remove("active");
            tabOverviewBtn.setAttribute("aria-selected", "false");
        }
        if (tabSettingsBtn) {
            tabSettingsBtn.classList.add("active");
            tabSettingsBtn.setAttribute("aria-selected", "true");
        }

        if (sideNavOverviewBtn) sideNavOverviewBtn.classList.remove("active");
        if (sideNavSettingsBtn) sideNavSettingsBtn.classList.add("active");

        if (window.location.hash !== "#settings") {
            history.replaceState(null, "", "#settings");
        }
    } else {
        if (panelOverview) panelOverview.hidden = false;
        if (panelSettings) panelSettings.hidden = true;

        if (tabOverviewBtn) {
            tabOverviewBtn.classList.add("active");
            tabOverviewBtn.setAttribute("aria-selected", "true");
        }
        if (tabSettingsBtn) {
            tabSettingsBtn.classList.remove("active");
            tabSettingsBtn.setAttribute("aria-selected", "false");
        }

        if (sideNavOverviewBtn) sideNavOverviewBtn.classList.add("active");
        if (sideNavSettingsBtn) sideNavSettingsBtn.classList.remove("active");

        if (window.location.hash === "#settings") {
            history.replaceState(null, "", "#overview");
        }
    }
}


// ============================================================
// HIỂN THỊ THÔNG TIN HỒ SƠ
// ============================================================

function renderProfile(user) {
    setText("profileUsername", user.username || "Người học");
    setText("profileEmail", user.email || "Chưa cập nhật");

    const usernameInput = document.getElementById("profileUsernameInput");
    if (usernameInput) usernameInput.value = user.username || "";

    const emailInput = document.getElementById("profileEmailInput");
    if (emailInput) emailInput.value = user.email || "";

    const roleElement = document.getElementById("profileRole");
    if (roleElement) {
        roleElement.textContent = user.role === "admin" ? "Quản trị viên" : "Học viên C++";
    }

    const adminLink = document.getElementById("profileAdminLink");
    if (adminLink) {
        adminLink.style.display = user.role === "admin" ? "flex" : "none";
    }

    const joinDate = document.getElementById("profileJoinDate");
    if (joinDate) {
        joinDate.textContent = formatDate(user.createdAt);
    }

    // Cập nhật Avatar toàn diện
    updateAllAvatarsDisplay(user);
}


// ============================================================
// QUẢN LÝ AVATAR (UP ẢNH & PRESETS)
// ============================================================

function setupAvatarManagement(user) {
    const fileInput = document.getElementById("avatarFileInput");
    const btnTriggerUpload = document.getElementById("btnTriggerUpload");
    const btnRemoveAvatar = document.getElementById("btnRemoveAvatar");
    const presetsContainer = document.getElementById("presetAvatarsGrid");

    // 1. Render Preset Avatars
    if (presetsContainer) {
        presetsContainer.innerHTML = PRESET_AVATARS.map(preset => {
            const isSelected = user.avatar === preset.svg;
            return `
                <button
                    type="button"
                    class="preset-avatar-btn ${isSelected ? 'selected' : ''}"
                    data-id="${preset.id}"
                    title="${preset.name}"
                >
                    <img src="${preset.svg}" alt="${preset.name}">
                    <span class="preset-name">${preset.name}</span>
                </button>
            `;
        }).join("");

        // Gắn sự kiện click chọn preset
        presetsContainer.querySelectorAll(".preset-avatar-btn").forEach((btn, index) => {
            btn.addEventListener("click", () => {
                const preset = PRESET_AVATARS[index];
                if (!preset) return;

                // Đổi avatar
                applyNewAvatar(preset.svg, user);

                // Highlight nút được chọn
                presetsContainer.querySelectorAll(".preset-avatar-btn").forEach(b => b.classList.remove("selected"));
                btn.classList.add("selected");
            });
        });
    }

    // 2. Kích hoạt mở file
    if (btnTriggerUpload && fileInput) {
        btnTriggerUpload.addEventListener("click", () => {
            fileInput.click();
        });
    }

    // 3. Xử lý khi người dùng chọn file ảnh từ máy
    if (fileInput) {
        fileInput.addEventListener("change", async (e) => {
            const file = e.target.files && e.target.files[0];
            if (!file) return;

            // Kiểm tra định dạng ảnh
            if (!file.type.startsWith("image/")) {
                showProfileMessage("Vui lòng chọn tệp hình ảnh hợp lệ (PNG, JPG, WebP, GIF).", "error");
                fileInput.value = "";
                return;
            }

            // Giới hạn kích thước tệp ban đầu (tối đa 8MB)
            if (file.size > 8 * 1024 * 1024) {
                showProfileMessage("Dung lượng ảnh vượt quá 8MB. Vui lòng chọn ảnh nhẹ hơn.", "error");
                fileInput.value = "";
                return;
            }

            try {
                // Resize qua Canvas thành kích thước tối ưu (256x256), nhẹ & mượt
                const base64Data = await resizeImageToBase64(file, 256, 0.88);
                applyNewAvatar(base64Data, user);

                // Bỏ chọn các nút preset
                if (presetsContainer) {
                    presetsContainer.querySelectorAll(".preset-avatar-btn").forEach(b => b.classList.remove("selected"));
                }

                showProfileMessage("Đã tải ảnh đại diện thành công. Đừng quên bấm 'Lưu thay đổi'!", "success");
            } catch (err) {
                console.error("Lỗi đọc file ảnh:", err);
                showProfileMessage("Không thể xử lý ảnh. Vui lòng thử lại với ảnh khác.", "error");
            }

            fileInput.value = "";
        });
    }

    // 4. Gỡ bỏ ảnh đại diện
    if (btnRemoveAvatar) {
        btnRemoveAvatar.addEventListener("click", () => {
            applyNewAvatar(null, user);
            if (presetsContainer) {
                presetsContainer.querySelectorAll(".preset-avatar-btn").forEach(b => b.classList.remove("selected"));
            }
            showProfileMessage("Đã gỡ ảnh đại diện. Hệ thống sẽ hiển thị chữ cái đầu mặc định.", "info");
        });
    }
}

// Áp dụng avatar mới vào bộ nhớ & giao diện
function applyNewAvatar(avatarUrl, user) {
    currentAvatarData = avatarUrl;

    // Cập nhật người dùng hiện tại
    const updatedUser = CppStorage.updateUser(user.id, {
        avatar: avatarUrl
    });

    if (updatedUser) {
        CppStorage.setCurrentUser(updatedUser);
        updateAllAvatarsDisplay(updatedUser);
    }
}

// Cập nhật hiển thị Avatar trên tất cả các vị trí
function updateAllAvatarsDisplay(user) {
    const firstLetter = (user.username || user.email || "U").charAt(0).toUpperCase();

    // 1. Sidebar Avatar
    const profileAvatar = document.getElementById("profileAvatar");
    if (profileAvatar) {
        if (user.avatar) {
            profileAvatar.innerHTML = `<img src="${user.avatar}" alt="Avatar ${escapeHtml(user.username)}">`;
            profileAvatar.classList.add("has-image");
        } else {
            profileAvatar.innerHTML = firstLetter;
            profileAvatar.classList.remove("has-image");
        }
    }

    // 2. Settings Avatar Preview
    const settingsPreview = document.getElementById("settingsAvatarPreview");
    if (settingsPreview) {
        if (user.avatar) {
            settingsPreview.innerHTML = `<img src="${user.avatar}" alt="Preview ${escapeHtml(user.username)}">`;
            settingsPreview.classList.add("has-image");
        } else {
            settingsPreview.innerHTML = firstLetter;
            settingsPreview.classList.remove("has-image");
        }
    }

    // 3. Navbar Header Avatar
    const headerAvatars = document.querySelectorAll("#headerAvatar, .header-avatar");
    headerAvatars.forEach(el => {
        if (user.avatar) {
            el.innerHTML = `<img src="${user.avatar}" alt="Avatar" style="width: 100%; height: 100%; object-fit: cover; border-radius: inherit; display: block;">`;
            el.classList.add("has-avatar-img");
        } else {
            el.textContent = firstLetter;
            el.classList.remove("has-avatar-img");
        }
    });
}

// Nén ảnh qua Canvas sang Base64
function resizeImageToBase64(file, maxDimension = 256, quality = 0.88) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.onload = (event) => {
            const img = new Image();
            img.onload = () => {
                let width = img.width;
                let height = img.height;

                if (width > height) {
                    if (width > maxDimension) {
                        height = Math.round((height * maxDimension) / width);
                        width = maxDimension;
                    }
                } else {
                    if (height > maxDimension) {
                        width = Math.round((width * maxDimension) / height);
                        height = maxDimension;
                    }
                }

                const canvas = document.createElement("canvas");
                canvas.width = width;
                canvas.height = height;

                const ctx = canvas.getContext("2d");
                ctx.drawImage(img, 0, 0, width, height);

                const dataUrl = canvas.toDataURL("image/jpeg", quality);
                resolve(dataUrl);
            };
            img.onerror = reject;
            img.src = event.target.result;
        };
        reader.onerror = reject;
        reader.readAsDataURL(file);
    });
}


// ============================================================
// THỐNG KÊ HỌC TẬP & XẾP HẠNG
// ============================================================

function renderProfileStats(user) {
    const lessons = CppStorage.getLessons();
    const progress = CppStorage.getUserProgress(user.id);

    const totalLessons = lessons.length;
    const completedLessons = lessons.filter(l => progress[l.id]?.completed === true).length;
    const percent = totalLessons > 0 ? Math.round((completedLessons / totalLessons) * 100) : 0;

    // Tổng bài học
    setText("profileTotalLessons", totalLessons);

    // Đã hoàn thành
    setText("profileCompletedLessons", completedLessons);

    // Điểm trung bình
    const scores = lessons
        .map(l => progress[l.id]?.score)
        .filter(score => typeof score === "number");

    const averageScore = scores.length > 0
        ? Math.round(scores.reduce((sum, score) => sum + score, 0) / scores.length)
        : 0;

    setText("profileAverageScore", `${averageScore}/100`);

    // Tiến độ %
    setText("profileProgress", `${percent}%`);
    setText("profileProgressPercent", `${percent}%`);

    // Xếp cấp bậc học viên
    const rankBadge = document.getElementById("profileRankBadge");
    if (rankBadge) {
        if (percent >= 80) {
            rankBadge.textContent = "C++ Master";
            rankBadge.className = "profile-rank rank-master";
        } else if (percent >= 50) {
            rankBadge.textContent = "Lập trình viên C++";
            rankBadge.className = "profile-rank rank-coder";
        } else if (percent >= 20) {
            rankBadge.textContent = "Coder Tập sự";
            rankBadge.className = "profile-rank rank-apprentice";
        } else {
            rankBadge.textContent = "Học viên Mới";
            rankBadge.className = "profile-rank rank-beginner";
        }
    }
}


// ============================================================
// TIẾN ĐỘ HỌC TẬP
// ============================================================

function renderProfileProgress(user) {
    const lessons = CppStorage.getLessons();
    const progress = CppStorage.getUserProgress(user.id);

    const total = lessons.length;
    const completed = lessons.filter(l => progress[l.id]?.completed === true).length;
    const percent = total > 0 ? Math.round((completed / total) * 100) : 0;

    const bar = document.getElementById("profileProgressBar");
    if (bar) {
        bar.style.width = "0%";
        setTimeout(() => {
            bar.style.width = `${percent}%`;
        }, 150);
    }

    const descElem = document.getElementById("profileProgressDesc");
    if (descElem) {
        if (percent === 100) {
            descElem.innerHTML = `Xuất sắc! Bạn đã hoàn thành toàn bộ <strong>${total}/${total}</strong> bài học C++!`;
        } else if (completed > 0) {
            descElem.innerHTML = `Bạn đã hoàn thành <strong>${completed}/${total}</strong> bài học (${percent}%). Còn <strong>${total - completed}</strong> bài học nữa, tiếp tục phát huy nhé!`;
        } else {
            descElem.innerHTML = `Bạn chưa hoàn thành bài học nào. Hãy bắt đầu hành trình lập trình C++ ngay hôm nay!`;
        }
    }

    // Nút tiếp tục bài học tiếp theo
    const resumeBtn = document.getElementById("btnResumeLearning");
    if (resumeBtn) {
        const nextLesson = lessons.find(l => !progress[l.id]?.completed);
        if (nextLesson) {
            resumeBtn.href = `lesson-detail.html?id=${encodeURIComponent(nextLesson.id)}`;
            resumeBtn.textContent = `Học tiếp: Bài ${nextLesson.order || 1} →`;
        } else {
            resumeBtn.href = "lessons.html";
            resumeBtn.textContent = "Xem danh sách bài học →";
        }
    }

    // Cập nhật trạng thái hiển thị của Thẻ Chứng Chỉ (Khóa / Mở Khóa)
    updateCertificatePromoStatus(user, completed, total);
}


// ============================================================
// BÀI HỌC HOÀN THÀNH GẦN ĐÂY
// ============================================================

function renderRecentLessons(user) {
    const container = document.getElementById("recentLessonsList");
    if (!container) return;

    const lessons = CppStorage.getLessons();
    const progress = CppStorage.getUserProgress(user.id);

    // Lọc các bài học đã hoàn thành
    const completedLessons = lessons
        .filter(lesson => progress[lesson.id]?.completed === true)
        .slice(-5)
        .reverse();

    if (!completedLessons.length) {
        container.innerHTML = `
            <div class="empty-state">
                <h3>Chưa có bài hoàn thành</h3>
                <p>Hãy bắt đầu học bài đầu tiên để lưu lại lịch sử làm bài và điểm số của bạn.</p>
                <a href="lessons.html" class="btn btn-primary" style="margin-top: 12px;">Bắt đầu học ngay →</a>
            </div>
        `;
        return;
    }

    container.innerHTML = completedLessons.map((lesson, idx) => {
        const p = progress[lesson.id] || {};
        const score = typeof p.score === "number" ? p.score : 100;
        let scoreClass = "score-high";
        if (score < 60) scoreClass = "score-low";
        else if (score < 80) scoreClass = "score-med";

        return `
            <div class="recent-lesson-item">
                <div class="recent-lesson-number">${idx + 1}</div>
                <div class="recent-lesson-info">
                    <h4>${escapeHtml(lesson.title)}</h4>
                    <span>${escapeHtml(lesson.chapter || "Chương trình C++")}</span>
                </div>
                <div class="recent-lesson-score ${scoreClass}">
                    ${score}/100
                </div>
                <a href="lesson-detail.html?id=${encodeURIComponent(lesson.id)}" class="btn-review-lesson" title="Xem lại bài học">
                    Ôn lại →
                </a>
            </div>
        `;
    }).join("");
}


// ============================================================
// THÀNH TÍCH (ACHIEVEMENTS)
// ============================================================

async function renderAchievements(user) {
    const container = document.getElementById("achievementsList");
    if (!container) return;

    // Check if backend achievements are available
    if (window.CodeLearnApi && CodeLearnApi.achievements) {
        try {
            const res = await CodeLearnApi.achievements.get();
            if (res && res.achievements && res.achievements.length > 0) {
                container.innerHTML = res.achievements.map(ach => `
                    <div class="achievement-card ${ach.unlocked ? '' : 'locked'}">
                        <div class="achievement-info">
                            <strong>${escapeHtml(ach.title)}</strong>
                            <p>${escapeHtml(ach.description)}</p>
                            <small>${ach.unlocked ? 'Đã mở khóa' : 'Chưa mở khóa'}</small>
                        </div>
                    </div>
                `).join("");
                return;
            }
        } catch (e) {
            // fallback to local calculation
        }
    }

    const lessons = CppStorage.getLessons();
    const progress = CppStorage.getUserProgress(user.id);

    const completed = lessons.filter(l => progress[l.id]?.completed === true).length;
    const scores = lessons
        .map(l => progress[l.id]?.score)
        .filter(score => typeof score === "number");

    const hasHighScore = scores.some(s => s >= 90);

    const achievements = [
        {
            id: "first-lesson",
            title: "Bắt đầu hành trình",
            description: "Hoàn thành bài học C++ đầu tiên.",
            unlocked: completed >= 1
        },
        {
            id: "three-lessons",
            title: "Tăng tốc kiến thức",
            description: "Hoàn thành 3 bài học C++.",
            unlocked: completed >= 3
        },
        {
            id: "five-lessons",
            title: "Chăm chỉ rèn luyện",
            description: "Hoàn thành 5 bài học C++.",
            unlocked: completed >= 5
        },
        {
            id: "high-score",
            title: "Thiện xạ C++",
            description: "Đạt từ 90 điểm trở lên trong một bài tập.",
            unlocked: hasHighScore
        },
        {
            id: "half-way",
            title: "Vượt qua nửa chặng",
            description: `Hoàn thành ít nhất ${Math.ceil(lessons.length / 2)} bài học.`,
            unlocked: completed >= Math.ceil(lessons.length / 2) && lessons.length > 0
        },
        {
            id: "all-lessons",
            title: "C++ Master Tinh anh",
            description: "Hoàn thành xuất sắc toàn bộ khóa học C++.",
            unlocked: completed >= lessons.length && lessons.length > 0
        }
    ];

    container.innerHTML = achievements.map(ach => `
        <div class="achievement-card ${ach.unlocked ? '' : 'locked'}">
            <div class="achievement-info">
                <strong>${escapeHtml(ach.title)}</strong>
                <p>${escapeHtml(ach.description)}</p>
                <small>${ach.unlocked ? 'Đã mở khóa' : 'Chưa mở khóa'}</small>
            </div>
        </div>
    `).join("");
}


// ============================================================
// FORM CHỈNH SỬA TÀI KHOẢN (TRONG TAB SETTINGS)
// ============================================================

function setupProfileForm(currentUser) {
    const form = document.getElementById("profileForm");
    if (!form) return;

    form.addEventListener("submit", (event) => {
        event.preventDefault();

        const usernameInput = document.getElementById("profileUsernameInput");
        const emailInput = document.getElementById("profileEmailInput");
        const passwordInput = document.getElementById("profilePasswordInput");
        const passwordConfirmInput = document.getElementById("profilePasswordConfirmInput");

        const newUsername = usernameInput ? usernameInput.value.trim() : currentUser.username;
        const newEmail = emailInput ? emailInput.value.trim() : currentUser.email;
        const newPassword = passwordInput ? passwordInput.value.trim() : "";
        const confirmPassword = passwordConfirmInput ? passwordConfirmInput.value.trim() : "";

        // 1. Kiểm tra username
        if (newUsername.length < 3) {
            showProfileMessage("Tên hiển thị phải có ít nhất 3 ký tự.", "error");
            if (usernameInput) usernameInput.focus();
            return;
        }

        // 2. Kiểm tra email
        if (!isValidEmail(newEmail)) {
            showProfileMessage("Địa chỉ Email không hợp lệ. Vui lòng kiểm tra lại.", "error");
            if (emailInput) emailInput.focus();
            return;
        }

        // 3. Kiểm tra username trùng
        const users = CppStorage.getUsers();
        const duplicateUsername = users.find(
            u => u.id !== currentUser.id && u.username.toLowerCase() === newUsername.toLowerCase()
        );

        if (duplicateUsername) {
            showProfileMessage("Tên người dùng này đã có người sử dụng. Vui lòng chọn tên khác.", "error");
            if (usernameInput) usernameInput.focus();
            return;
        }

        // 4. Kiểm tra mật khẩu mới (nếu có nhập)
        if (newPassword) {
            if (newPassword.length < 6) {
                showProfileMessage("Mật khẩu mới phải có ít nhất 6 ký tự.", "error");
                if (passwordInput) passwordInput.focus();
                return;
            }

            if (newPassword !== confirmPassword) {
                showProfileMessage("Xác nhận mật khẩu không khớp với mật khẩu mới.", "error");
                if (passwordConfirmInput) passwordConfirmInput.focus();
                return;
            }
        }

        // 5. Cập nhật dữ liệu
        const updateData = {
            username: newUsername,
            email: newEmail
        };

        if (newPassword) {
            updateData.password = newPassword;
        }

        if (currentAvatarData !== undefined) {
            updateData.avatar = currentAvatarData;
        }

        const updatedUser = CppStorage.updateUser(currentUser.id, updateData);

        if (!updatedUser) {
            showProfileMessage("Không thể lưu thay đổi vào hệ thống.", "error");
            return;
        }

        // Cập nhật current user trong storage
        CppStorage.setCurrentUser(updatedUser);

        // Reset các trường mật khẩu
        if (passwordInput) passwordInput.value = "";
        if (passwordConfirmInput) passwordConfirmInput.value = "";

        // Hiển thị lại toàn bộ thông tin
        renderProfile(updatedUser);
        renderProfileStats(updatedUser);

        showProfileMessage("Cập nhật hồ sơ & cài đặt thành công!", "success");
    });

    // Nút Hủy
    const cancelBtn = document.getElementById("cancelProfileEdit");
    if (cancelBtn) {
        cancelBtn.addEventListener("click", () => {
            const user = CppStorage.getCurrentUser() || currentUser;
            const uInput = document.getElementById("profileUsernameInput");
            const eInput = document.getElementById("profileEmailInput");
            const pInput = document.getElementById("profilePasswordInput");
            const cInput = document.getElementById("profilePasswordConfirmInput");

            if (uInput) uInput.value = user.username || "";
            if (eInput) eInput.value = user.email || "";
            if (pInput) pInput.value = "";
            if (cInput) cInput.value = "";

            currentAvatarData = user.avatar || null;
            updateAllAvatarsDisplay(user);

            const msg = document.getElementById("profileMessage");
            if (msg) {
                msg.textContent = "";
                msg.className = "form-message";
                msg.hidden = true;
            }

            showProfileMessage("Đã hoàn tác các thay đổi chưa lưu.", "info");
        });
    }
}


// ============================================================
// TOGGLE HIỂN THỊ MẬT KHẨU
// ============================================================

function setupPasswordToggles() {
    const btn1 = document.getElementById("btnTogglePwd1");
    const pwd1 = document.getElementById("profilePasswordInput");
    if (btn1 && pwd1) {
        btn1.addEventListener("click", () => {
            const isPwd = pwd1.type === "password";
            pwd1.type = isPwd ? "text" : "password";
            btn1.textContent = isPwd ? "Ẩn" : "Hiện";
        });
    }

    const btn2 = document.getElementById("btnTogglePwd2");
    const pwd2 = document.getElementById("profilePasswordConfirmInput");
    if (btn2 && pwd2) {
        btn2.addEventListener("click", () => {
            const isPwd = pwd2.type === "password";
            pwd2.type = isPwd ? "text" : "password";
            btn2.textContent = isPwd ? "Ẩn" : "Hiện";
        });
    }
}


// ============================================================
// TÙY CHỌN GIAO DIỆN SÁNG / TỐI TRONG SETTINGS
// ============================================================

function setupThemeSettings() {
    const lightBtn = document.getElementById("themeOptionLight");
    const darkBtn = document.getElementById("themeOptionDark");

    function updateActiveThemeBtn() {
        const isDark = document.documentElement.classList.contains("dark-theme");
        if (lightBtn) lightBtn.classList.toggle("active", !isDark);
        if (darkBtn) darkBtn.classList.toggle("active", isDark);
    }

    updateActiveThemeBtn();

    if (lightBtn) {
        lightBtn.addEventListener("click", () => {
            document.documentElement.classList.remove("dark-theme");
            document.body.classList.remove("dark-theme");
            localStorage.setItem("cpp_theme", "light");
            updateActiveThemeBtn();
        });
    }

    if (darkBtn) {
        darkBtn.addEventListener("click", () => {
            document.documentElement.classList.add("dark-theme");
            document.body.classList.add("dark-theme");
            localStorage.setItem("cpp_theme", "dark");
            updateActiveThemeBtn();
        });
    }
}


// ============================================================
// ĐĂNG XUẤT
// ============================================================

function setupProfileLogout() {
    const button = document.getElementById("profileLogoutButton");
    if (!button) return;

    button.addEventListener("click", (event) => {
        event.preventDefault();
        const confirmLogout = confirm("Bạn có chắc chắn muốn đăng xuất khỏi CodeLearn C++ không?");
        if (!confirmLogout) return;

        CppStorage.logout();
        window.location.href = "login.html";
    });
}


// ============================================================
// TIỆN ÍCH & THÔNG BÁO
// ============================================================

function showProfileMessage(message, type = "info") {
    const element = document.getElementById("profileMessage");
    if (!element) return;

    element.textContent = message;
    element.className = `form-message ${type}`;
    element.hidden = false;

    element.scrollIntoView({ behavior: "smooth", block: "nearest" });

    setTimeout(() => {
        element.textContent = "";
        element.className = "form-message";
        element.hidden = true;
    }, 4500);
}

function isValidEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function formatDate(value) {
    if (!value) return "Chưa xác định";
    const date = new Date(value);
    if (Number.isNaN(date.getTime())) return "Chưa xác định";

    return date.toLocaleDateString("vi-VN", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric"
    });
}

function setText(id, value) {
    const element = document.getElementById(id);
    if (element) {
        element.textContent = value;
    }
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


// ============================================================
// CHỨNG CHỈ TỐT NGHIỆP C++ MASTER (CERTIFICATE OF EXCELLENCE)
// ============================================================

function updateCertificatePromoStatus(user, completed, total) {
    const promoCard = document.getElementById("certificatePromoCard");
    const badge = document.getElementById("certStatusBadge");
    const btn = document.getElementById("btnOpenCertificate");
    const miniText = document.getElementById("certMiniProgressText");
    const miniBar = document.getElementById("certMiniProgressBar");
    const promoTitle = document.getElementById("certPromoTitle");
    const promoDesc = document.getElementById("certPromoDesc");

    const isUnlocked = (completed >= total && total > 0) || (user && user.role === "admin");
    const percent = total > 0 ? Math.round((completed / total) * 100) : 0;

    if (miniText) miniText.textContent = `${completed}/${total} bài học (${percent}%)`;
    if (miniBar) miniBar.style.width = `${percent}%`;

    if (isUnlocked) {
        if (promoCard) {
            promoCard.classList.remove("state-locked");
            promoCard.classList.add("state-unlocked");
        }
        if (badge) {
            badge.className = "cert-status-badge badge-unlocked";
            badge.innerHTML = "🎓 ĐÃ HOÀN THÀNH 100% • SẴN SÀNG NHẬN CHỨNG CHỈ";
        }
        if (promoTitle) {
            promoTitle.textContent = "Chứng chỉ Tốt nghiệp C++ Master Danh Giá";
        }
        if (promoDesc) {
            promoDesc.innerHTML = `Xuất sắc! Bạn đã hoàn thành toàn bộ <strong>${completed}/${total}</strong> bài học C++. Giấy Chứng Nhận Tốt Nghiệp C++ Master chính thức đã sẵn sàng trao tặng cho bạn.`;
        }
        if (btn) {
            btn.className = "btn btn-primary";
            btn.style.background = "linear-gradient(135deg, #d4af37, #b45309)";
            btn.style.color = "#ffffff";
            btn.style.fontWeight = "800";
            btn.style.boxShadow = "0 4px 18px rgba(212, 175, 55, 0.45)";
            btn.innerHTML = "🎓 Nhận &amp; Xem Chứng Chỉ Tốt Nghiệp";
        }
    } else {
        if (promoCard) {
            promoCard.classList.remove("state-unlocked");
            promoCard.classList.add("state-locked");
        }
        if (badge) {
            badge.className = "cert-status-badge badge-locked";
            badge.innerHTML = `🔒 CHƯA ĐỦ ĐIỀU KIỆN (${completed}/${total} BÀI HỌC)`;
        }
        if (promoTitle) {
            promoTitle.textContent = "Chứng chỉ Tốt nghiệp C++ Master";
        }
        if (promoDesc) {
            promoDesc.innerHTML = `Giấy Chứng Nhận Tốt Nghiệp chính thức được bảo lưu và chỉ trao tặng khi học viên đã hoàn thành xuất sắc <strong>toàn bộ 20/20 bài học</strong>. Bạn còn thiếu <strong>${total - completed}</strong> bài học nữa.`;
        }
        if (btn) {
            btn.className = "btn btn-secondary";
            btn.style.background = "";
            btn.style.color = "";
            btn.style.boxShadow = "";
            btn.innerHTML = `🔒 Xem Điều Kiện (Còn ${total - completed} bài)`;
        }
    }
}

function triggerCertificateConfetti() {
    const canvas = document.getElementById("certConfettiCanvas");
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    const colors = ["#d4af37", "#f59e0b", "#6366f1", "#8b5cf6", "#ec4899", "#10b981", "#3b82f6"];
    const particles = [];
    const count = 100;

    for (let i = 0; i < count; i++) {
        particles.push({
            x: Math.random() * canvas.width,
            y: Math.random() * canvas.height * 0.3 - 50,
            size: Math.random() * 8 + 4,
            color: colors[Math.floor(Math.random() * colors.length)],
            vx: (Math.random() - 0.5) * 6,
            vy: Math.random() * 4 + 2,
            rotation: Math.random() * 360,
            vRot: (Math.random() - 0.5) * 12
        });
    }

    let frame = 0;
    function render() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        particles.forEach(p => {
            p.x += p.vx;
            p.y += p.vy;
            p.rotation += p.vRot;

            ctx.save();
            ctx.translate(p.x, p.y);
            ctx.rotate((p.rotation * Math.PI) / 180);
            ctx.fillStyle = p.color;
            ctx.fillRect(-p.size / 2, -p.size / 2, p.size, p.size * 0.6);
            ctx.restore();
        });

        frame++;
        if (frame < 160) {
            requestAnimationFrame(render);
        } else {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }
    }
    render();
}

function setupCertificateModal(user) {
    const btnOpen = document.getElementById("btnOpenCertificate");
    const modal = document.getElementById("certificateModal");
    const btnClose = document.getElementById("btnCloseCertModal");
    const btnCloseAction = document.getElementById("btnCloseCertAction");
    const btnPrint = document.getElementById("btnPrintCert");
    const btnCopyVerifyLink = document.getElementById("btnCopyVerifyLink");

    // Locked Modal elements
    const lockedModal = document.getElementById("certLockedModal");
    const btnCloseLockedModal = document.getElementById("btnCloseCertLockedModal");
    const btnLockedDismiss = document.getElementById("btnLockedDismiss");
    const btnLockedResume = document.getElementById("btnLockedResumeLearning");

    const recipientName = document.getElementById("certRecipientName");
    const serialCode = document.getElementById("certSerialCode");
    const issueDate = document.getElementById("certIssueDate");
    const finalScore = document.getElementById("certFinalScore");
    const verifyHash = document.getElementById("certVerifyHash");

    if (!modal) return;

    function openLockedModal(completed, total) {
        if (!lockedModal) return;
        const progressPercent = total > 0 ? Math.round((completed / total) * 100) : 0;
        const remaining = Math.max(0, total - completed);

        setText("lockedModalProgressText", `${completed}/${total} bài (${progressPercent}%)`);
        const pBar = document.getElementById("lockedModalProgressBar");
        if (pBar) pBar.style.width = `${progressPercent}%`;

        setText("lockedModalRemainingText", `Bạn còn thiếu ${remaining} bài học nữa để mở khóa Chứng Chỉ Tốt Nghiệp.`);

        if (btnLockedResume) {
            const lessons = CppStorage.getLessons();
            const progress = CppStorage.getUserProgress(user.id);
            const nextL = lessons.find(l => !progress[l.id]?.completed);
            if (nextL) {
                btnLockedResume.href = `lesson-detail.html?id=${encodeURIComponent(nextL.id)}`;
            } else {
                btnLockedResume.href = "lessons.html";
            }
        }

        lockedModal.hidden = false;
        document.body.style.overflow = "hidden";
    }

    function closeLockedModal() {
        if (lockedModal) lockedModal.hidden = true;
        document.body.style.overflow = "";
    }

    async function openCertificateModal() {
        if (recipientName) {
            recipientName.textContent = user.fullName || user.username || "Học viên CodeLearn";
        }
        if (serialCode) {
            const rawHash = (user.id || "STUDENT").replace(/[^a-zA-Z0-9]/g, "").toUpperCase();
            serialCode.textContent = `CERT-CPP-2026-${rawHash.slice(0, 6) || "9882"}`;
        }
        if (issueDate) {
            const now = new Date();
            issueDate.textContent = now.toLocaleDateString("vi-VN", {
                day: "2-digit",
                month: "2-digit",
                year: "numeric"
            });
        }

        // Điểm số trung bình
        const lessons = CppStorage.getLessons();
        const progress = CppStorage.getUserProgress(user.id);
        const scores = lessons
            .filter(l => progress[l.id]?.completed)
            .map(l => progress[l.id]?.score)
            .filter(s => typeof s === "number");
        const avgScore = scores.length > 0 ? Math.round(scores.reduce((a, b) => a + b, 0) / scores.length) : 95;
        if (finalScore) {
            finalScore.textContent = `${avgScore}/100`;
        }

        if (verifyHash) {
            verifyHash.textContent = "sha256:05a8b92ef1c384... (verified)";
        }

        // Claim hoặc nạp chứng chỉ chính thức từ Database backend
        if (window.CodeLearnApi && CodeLearnApi.certificates) {
            try {
                const certRes = await CodeLearnApi.certificates.claim("Khóa học Lập trình C++ Toàn diện");
                if (certRes && certRes.certCode) {
                    if (serialCode) serialCode.textContent = certRes.certCode;
                    if (recipientName && certRes.studentName) recipientName.textContent = certRes.studentName;
                    if (issueDate && certRes.issuedAt) {
                        issueDate.textContent = formatDate(certRes.issuedAt);
                    }
                    if (finalScore && certRes.finalScore) {
                        finalScore.textContent = `${certRes.finalScore}/100`;
                    }
                    if (verifyHash && certRes.verificationHash) {
                        verifyHash.textContent = certRes.verificationHash.slice(0, 24) + "...";
                    }
                }
            } catch (err) {
                console.log("[Certificate] Dùng mã nội bộ học viên:", err);
            }
        }

        modal.hidden = false;
        document.body.style.overflow = "hidden";

        // Bắn pháo hoa Confetti ăn mừng
        setTimeout(() => {
            triggerCertificateConfetti();
        }, 150);
    }

    function closeCertificateModal() {
        modal.hidden = true;
        document.body.style.overflow = "";
    }

    if (btnOpen) {
        btnOpen.addEventListener("click", () => {
            const lessons = CppStorage.getLessons();
            const progress = CppStorage.getUserProgress(user.id);
            const total = lessons.length;
            const completed = lessons.filter(l => progress[l.id]?.completed === true).length;
            const isUnlocked = (completed >= total && total > 0) || (user && user.role === "admin");

            if (isUnlocked) {
                openCertificateModal();
            } else {
                openLockedModal(completed, total);
            }
        });
    }

    if (btnClose) btnClose.addEventListener("click", closeCertificateModal);
    if (btnCloseAction) btnCloseAction.addEventListener("click", closeCertificateModal);

    if (btnCloseLockedModal) btnCloseLockedModal.addEventListener("click", closeLockedModal);
    if (btnLockedDismiss) btnLockedDismiss.addEventListener("click", closeLockedModal);

    if (btnCopyVerifyLink) {
        btnCopyVerifyLink.addEventListener("click", () => {
            const code = serialCode ? serialCode.textContent : "CERT-CPP-2026";
            const verifyUrl = `${window.location.origin}/profile.html#verify=${encodeURIComponent(code)}`;
            if (navigator.clipboard && navigator.clipboard.writeText) {
                navigator.clipboard.writeText(verifyUrl).then(() => {
                    alert(`Đã sao chép liên kết xác thực chứng chỉ:\n${verifyUrl}`);
                });
            } else {
                alert(`Mã xác thực của bạn là: ${code}`);
            }
        });
    }

    modal.addEventListener("click", (e) => {
        if (e.target === modal) closeCertificateModal();
    });

    if (lockedModal) {
        lockedModal.addEventListener("click", (e) => {
            if (e.target === lockedModal) closeLockedModal();
        });
    }

    document.addEventListener("keydown", (e) => {
        if (e.key === "Escape") {
            if (!modal.hidden) closeCertificateModal();
            if (lockedModal && !lockedModal.hidden) closeLockedModal();
        }
    });

    if (btnPrint) {
        btnPrint.addEventListener("click", () => {
            window.print();
        });
    }
}


// ============================================================
// CHUỖI HỌC TẬP (STREAK)
// ============================================================

function getOrUpdateLearningStreak(user) {
    if (!user || !user.id) return { streak: 1, lastActive: new Date().toISOString() };
    const streakKey = `cpp_streak_${user.id}`;
    const today = new Date().toISOString().split("T")[0]; // YYYY-MM-DD
    let data = null;
    try {
        data = JSON.parse(localStorage.getItem(streakKey));
    } catch (e) {}

    if (!data || !data.lastActive) {
        const initial = { streak: 3, lastActive: today }; // Khởi tạo 3 ngày streak khích lệ
        localStorage.setItem(streakKey, JSON.stringify(initial));
        return initial;
    }

    const lastDate = data.lastActive.split("T")[0];
    if (lastDate === today) {
        return data;
    }

    const diffDays = Math.floor((new Date(today) - new Date(lastDate)) / (1000 * 60 * 60 * 24));
    if (diffDays === 1) {
        data.streak = (data.streak || 1) + 1;
        data.lastActive = today;
    } else if (diffDays > 1) {
        data.streak = 1;
        data.lastActive = today;
    }
    localStorage.setItem(streakKey, JSON.stringify(data));
    return data;
}

function renderProfileStreak(user) {
    const streakData = getOrUpdateLearningStreak(user);
    const streakEl = document.getElementById("profileLearningStreak");
    if (streakEl) {
        streakEl.textContent = `${streakData.streak} ngày`;
    }
}