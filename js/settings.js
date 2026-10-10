// ============================================================
// CODELEARN C++ - DEDICATED SETTINGS CONTROLLER
// File: js/settings.js
// ============================================================

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

let draftAvatarData = null;

document.addEventListener("DOMContentLoaded", () => {
    const currentUser = CppStorage.getCurrentUser();

    if (!currentUser) {
        window.location.href = "login.html";
        return;
    }

    draftAvatarData = currentUser.avatar || null;

    // 1. Khởi tạo dữ liệu form
    initSettingsForm(currentUser);

    // 2. Quản lý Avatar (Upload & Presets)
    initAvatarControls(currentUser);

    // 3. Toggle ẩn/hiện mật khẩu
    initPasswordToggles();

    // 4. Quản lý tùy chọn giao diện (Light/Dark)
    initThemeSelection();

    // 5. Menu tài khoản Dropdown
    initAccountDropdown(currentUser);
});

function initSettingsForm(user) {
    const usernameInput = document.getElementById("settingsUsernameInput");
    const emailInput = document.getElementById("settingsEmailInput");
    const form = document.getElementById("settingsForm");

    if (usernameInput) usernameInput.value = user.username || "";
    if (emailInput) emailInput.value = user.email || "";

    if (form) {
        form.addEventListener("submit", (e) => {
            e.preventDefault();
            handleSaveSettings(user);
        });
    }
}

function initAvatarControls(user) {
    const previewEl = document.getElementById("settingsAvatarPreview");
    const fileInput = document.getElementById("avatarFileInput");
    const btnTrigger = document.getElementById("btnTriggerUpload");
    const btnRemove = document.getElementById("btnRemoveAvatar");
    const gridEl = document.getElementById("presetAvatarsGrid");

    function renderPreview(avatarSrc, fallbackChar) {
        if (!previewEl) return;
        if (avatarSrc) {
            previewEl.innerHTML = `<img src="${avatarSrc}" alt="Avatar Preview" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover; display: block;">`;
        } else {
            previewEl.textContent = (fallbackChar || "U").charAt(0).toUpperCase();
        }
    }

    renderPreview(draftAvatarData, user.username);

    // Trigger file input
    if (btnTrigger && fileInput) {
        btnTrigger.addEventListener("click", () => fileInput.click());
        fileInput.addEventListener("change", (e) => {
            const file = e.target.files?.[0];
            if (!file) return;

            if (!file.type.startsWith("image/")) {
                showSettingsToast("Vui lòng chọn tệp hình ảnh hợp lệ (PNG, JPG, WebP)!", "warning");
                return;
            }

            if (file.size > 5 * 1024 * 1024) {
                showSettingsToast("Kích thước ảnh tối đa là 5MB!", "warning");
                return;
            }

            const reader = new FileReader();
            reader.onload = (event) => {
                const img = new Image();
                img.onload = () => {
                    // Resize to standard 256x256 canvas
                    const canvas = document.createElement("canvas");
                    const size = 256;
                    canvas.width = size;
                    canvas.height = size;
                    const ctx = canvas.getContext("2d");
                    const minDim = Math.min(img.width, img.height);
                    const sx = (img.width - minDim) / 2;
                    const sy = (img.height - minDim) / 2;
                    ctx.drawImage(img, sx, sy, minDim, minDim, 0, 0, size, size);

                    draftAvatarData = canvas.toDataURL("image/webp", 0.9);
                    renderPreview(draftAvatarData, user.username);
                    showSettingsToast("Đã chọn ảnh đại diện mới! Hãy bấm 'Lưu toàn bộ thay đổi'.", "info");
                };
                img.src = event.target.result;
            };
            reader.readAsDataURL(file);
        });
    }

    // Remove avatar
    if (btnRemove) {
        btnRemove.addEventListener("click", () => {
            draftAvatarData = null;
            renderPreview(null, user.username);
            showSettingsToast("Đã gỡ ảnh đại diện. Bấm 'Lưu toàn bộ thay đổi' để hoàn tất.", "info");
        });
    }

    // Render preset avatars
    if (gridEl) {
        gridEl.innerHTML = "";
        PRESET_AVATARS.forEach(preset => {
            const btn = document.createElement("button");
            btn.type = "button";
            btn.className = "preset-avatar-btn";
            btn.title = `Chọn mẫu: ${preset.name}`;
            btn.innerHTML = `<img src="${preset.svg}" alt="${preset.name}" style="width: 100%; height: 100%; border-radius: 50%;">`;
            btn.addEventListener("click", () => {
                draftAvatarData = preset.svg;
                renderPreview(draftAvatarData, user.username);
                showSettingsToast(`Đã chọn avatar ${preset.name}! Hãy bấm Lưu.`, "info");
            });
            gridEl.appendChild(btn);
        });
    }
}

function initPasswordToggles() {
    const btn1 = document.getElementById("btnTogglePwd1");
    const btn2 = document.getElementById("btnTogglePwd2");
    const pwd1 = document.getElementById("settingsPasswordInput");
    const pwd2 = document.getElementById("settingsPasswordConfirmInput");

    if (btn1 && pwd1) {
        btn1.addEventListener("click", () => {
            const isText = pwd1.type === "text";
            pwd1.type = isText ? "password" : "text";
            btn1.textContent = isText ? "Hiện" : "Ẩn";
        });
    }

    if (btn2 && pwd2) {
        btn2.addEventListener("click", () => {
            const isText = pwd2.type === "text";
            pwd2.type = isText ? "password" : "text";
            btn2.textContent = isText ? "Hiện" : "Ẩn";
        });
    }
}

function initThemeSelection() {
    const btnLight = document.getElementById("themeOptionLight");
    const btnDark = document.getElementById("themeOptionDark");

    function updateActiveState() {
        const isDark = document.documentElement.classList.contains("dark-theme");
        if (btnLight) btnLight.classList.toggle("active", !isDark);
        if (btnDark) btnDark.classList.toggle("active", isDark);
    }

    updateActiveState();

    if (btnLight) {
        btnLight.addEventListener("click", () => {
            document.documentElement.classList.remove("dark-theme");
            localStorage.setItem("cpp_theme", "light");
            updateActiveState();
            showSettingsToast("Đã chuyển sang giao diện Sáng!", "info");
        });
    }

    if (btnDark) {
        btnDark.addEventListener("click", () => {
            document.documentElement.classList.add("dark-theme");
            localStorage.setItem("cpp_theme", "dark");
            updateActiveState();
            showSettingsToast("Đã chuyển sang giao diện Tối!", "info");
        });
    }
}

function handleSaveSettings(user) {
    const usernameInput = document.getElementById("settingsUsernameInput");
    const emailInput = document.getElementById("settingsEmailInput");
    const pwdInput = document.getElementById("settingsPasswordInput");
    const pwdConfirmInput = document.getElementById("settingsPasswordConfirmInput");
    const btnSave = document.getElementById("btnSaveSettings");

    const newUsername = usernameInput?.value?.trim() || "";
    const newEmail = emailInput?.value?.trim() || "";
    const newPassword = pwdInput?.value || "";
    const confirmPassword = pwdConfirmInput?.value || "";

    if (!newUsername || newUsername.length < 3) {
        showSettingsToast("Tên tài khoản tối thiểu phải có 3 ký tự!", "warning");
        return;
    }

    if (!newEmail || !/^\S+@\S+\.\S+$/.test(newEmail)) {
        showSettingsToast("Vui lòng nhập địa chỉ email hợp lệ!", "warning");
        return;
    }

    if (newPassword) {
        if (newPassword.length < 6) {
            showSettingsToast("Mật khẩu mới tối thiểu 6 ký tự!", "warning");
            return;
        }
        if (newPassword !== confirmPassword) {
            showSettingsToast("Xác nhận mật khẩu không khớp!", "warning");
            return;
        }
    }

    if (btnSave) {
        btnSave.disabled = true;
        btnSave.textContent = "Đang lưu thay đổi...";
    }

    // Cập nhật CppStorage
    const updatedUser = {
        ...user,
        username: newUsername,
        email: newEmail,
        avatar: draftAvatarData
    };

    if (newPassword) {
        updatedUser.password = newPassword;
    }

    CppStorage.updateUser(updatedUser);

    // Cập nhật lên backend nếu có API
    if (window.CodeLearnApi && typeof CodeLearnApi.user?.updateProfile === "function") {
        CodeLearnApi.user.updateProfile(updatedUser).catch(() => {});
    }

    setTimeout(() => {
        if (btnSave) {
            btnSave.disabled = false;
            btnSave.textContent = "Lưu toàn bộ thay đổi";
        }
        showSettingsToast("✅ Đã lưu toàn bộ cài đặt thành công!", "success", 2600);
        if (typeof window.triggerConfetti === "function") {
            window.triggerConfetti();
        }
    }, 450);
}

function initAccountDropdown(user) {
    const popover = document.getElementById("accountMenuPopover");
    const backdrop = document.getElementById("accountMenuBackdrop");
    const triggerBtn = document.getElementById("headerUserBtn");
    const nameEl = document.getElementById("accountMenuName");
    const avatarEl = document.getElementById("accountMenuAvatar");
    const themeCheckbox = document.getElementById("accountMenuThemeCheckbox");
    const themeStatus = document.getElementById("accountThemeStatus");
    const logoutBtn = document.getElementById("btnAccountLogout");

    if (nameEl) nameEl.textContent = user.username || "Học viên";
    if (avatarEl) {
        if (user.avatar) {
            avatarEl.innerHTML = `<img src="${user.avatar}" alt="Avatar" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;">`;
        } else {
            avatarEl.textContent = (user.username || "U").charAt(0).toUpperCase();
        }
    }

    function toggleMenu(show) {
        if (!popover || !backdrop) return;
        const isOpen = show !== undefined ? show : !popover.classList.contains("active");
        popover.classList.toggle("active", isOpen);
        backdrop.classList.toggle("active", isOpen);
    }

    if (triggerBtn) {
        triggerBtn.addEventListener("click", (e) => {
            e.stopPropagation();
            toggleMenu();
        });
    }

    if (backdrop) {
        backdrop.addEventListener("click", () => toggleMenu(false));
    }

    // Theme Switch in Dropdown
    const isDark = document.documentElement.classList.contains("dark-theme");
    if (themeCheckbox) {
        themeCheckbox.checked = isDark;
        if (themeStatus) themeStatus.textContent = isDark ? "Chế độ tối đang bật" : "Chế độ sáng đang bật";

        themeCheckbox.addEventListener("change", () => {
            const dark = themeCheckbox.checked;
            document.documentElement.classList.toggle("dark-theme", dark);
            localStorage.setItem("cpp_theme", dark ? "dark" : "light");
            if (themeStatus) themeStatus.textContent = dark ? "Chế độ tối đang bật" : "Chế độ sáng đang bật";
            showSettingsToast(`Đã chuyển sang ${dark ? "Chế độ tối" : "Chế độ sáng"}!`, "info");
        });
    }

    // Logout
    if (logoutBtn) {
        logoutBtn.addEventListener("click", () => {
            CppStorage.logout();
            window.location.href = "login.html";
        });
    }

    // Help & Support Modal
    const btnHelp = document.getElementById("btnAccountHelp");
    const modalHelp = document.getElementById("modalHelpSupport");
    const btnCloseHelp = document.getElementById("btnCloseHelpModal");
    const btnDismissHelp = document.getElementById("btnDismissHelpModal");

    function openHelpModal() {
        toggleMenu(false);
        if (modalHelp) modalHelp.classList.add("active");
    }
    function closeHelpModal() {
        if (modalHelp) modalHelp.classList.remove("active");
    }

    if (btnHelp) btnHelp.addEventListener("click", openHelpModal);
    if (btnCloseHelp) btnCloseHelp.addEventListener("click", closeHelpModal);
    if (btnDismissHelp) btnDismissHelp.addEventListener("click", closeHelpModal);
    if (modalHelp) {
        modalHelp.addEventListener("click", (e) => {
            if (e.target === modalHelp) closeHelpModal();
        });
    }

    // Bug Report Modal (with Ctrl + B hotkey)
    const btnReport = document.getElementById("btnAccountReport");
    const modalBug = document.getElementById("modalBugReport");
    const btnCloseBug = document.getElementById("btnCloseBugModal");
    const btnCancelBug = document.getElementById("btnCancelBugModal");
    const bugForm = document.getElementById("bugReportForm");
    const bugContent = document.getElementById("bugReportContent");

    function openBugModal() {
        toggleMenu(false);
        if (modalBug) {
            modalBug.classList.add("active");
            if (bugContent) setTimeout(() => bugContent.focus(), 100);
        }
    }
    function closeBugModal() {
        if (modalBug) modalBug.classList.remove("active");
    }

    if (btnReport) btnReport.addEventListener("click", openBugModal);
    if (btnCloseBug) btnCloseBug.addEventListener("click", closeBugModal);
    if (btnCancelBug) btnCancelBug.addEventListener("click", closeBugModal);
    if (modalBug) {
        modalBug.addEventListener("click", (e) => {
            if (e.target === modalBug) closeBugModal();
        });
    }

    if (bugForm) {
        bugForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const text = bugContent ? bugContent.value.trim() : "";
            if (!text) return;
            closeBugModal();
            if (bugContent) bugContent.value = "";
            showSettingsToast("Đã gửi phản hồi sự cố! Đội ngũ kỹ thuật sẽ hỗ trợ bạn sớm nhất.", "success", 3000);
        });
    }

    // Shortcut Ctrl + B for Bug Report
    window.addEventListener("keydown", (e) => {
        if ((e.ctrlKey || e.metaKey) && (e.key === "b" || e.key === "B")) {
            e.preventDefault();
            openBugModal();
        }
    });
}

function showSettingsToast(msg, type = "info", duration = 2400) {
    if (typeof window.showToast === "function") {
        window.showToast(msg, type, duration);
    } else {
        alert(msg);
    }
}
