// ============================================================
// CODELEARN C++ - LAYOUT
// File: js/layout.js
// ============================================================

// Khởi tạo theme sáng/tối sớm để chống nhấp nháy FOUC
initThemeEarly();

document.addEventListener("DOMContentLoaded", () => {
    // --------------------------------------------------------
    // 0. Cài đặt nút chuyển giao diện Sáng / Tối (Theme Toggle)
    // --------------------------------------------------------
    setupThemeToggle();

    // --------------------------------------------------------
    // 1. Kiểm tra đăng nhập
    // --------------------------------------------------------
    const currentUser = CppStorage.getCurrentUser();

    const rawPath = window.location.pathname || "";
    const currentPage = rawPath
        .replace(/\\/g, "/")
        .split("/")
        .pop()
        .toLowerCase();

    const publicPages = [
        "",
        "index.html",
        "login.html",
        "register.html",
        "home.html",
        "lessons.html"
    ];

    if (!currentUser && !publicPages.includes(currentPage)) {
        window.location.href = "login.html";
        return;
    }

    // 4. Menu mobile
    setupMobileMenu();

    // 5. Active navigation
    setActiveNavigation();

    if (!currentUser) {
        updateGuestHeader();
        return;
    }

    // 2. Hiển thị thông tin người dùng trên Header
    updateHeaderUser(currentUser);

    // 3. Hiển thị / ẩn menu Admin
    updateAdminNavigation(currentUser);

    // 6. Xử lý nút đăng xuất
    setupLogoutButtons();

    // 7. Nếu truy cập Admin mà không có quyền
    if (
        currentPage === "admin.html" &&
        currentUser.role !== "admin"
    ) {
        window.location.href = "home.html";
    }
});


// ============================================================
// CẬP NHẬT USER TRÊN HEADER
// ============================================================

function updateHeaderUser(user) {
    const usernameElements = document.querySelectorAll(
        "#headerUsername, .header-username"
    );

    usernameElements.forEach(element => {
        element.textContent = user.username || "Người học";
    });


    // Avatar
    const avatarElements = document.querySelectorAll(
        "#headerAvatar, .header-avatar"
    );

    const firstLetter = (
        user.username ||
        user.email ||
        "U"
    ).charAt(0).toUpperCase();

    avatarElements.forEach(element => {
        if (element.tagName === "IMG") {
            element.alt = `Ảnh đại diện ${user.username || "người học"}`;
            if (user.avatar) {
                element.src = user.avatar;
            }
        } else {
            if (user.avatar) {
                element.innerHTML = `<img src="${user.avatar}" alt="Avatar ${user.username || 'người học'}" style="width: 100%; height: 100%; object-fit: cover; border-radius: inherit; display: block;">`;
                element.classList.add("has-avatar-img");
            } else {
                element.textContent = firstLetter;
                element.classList.remove("has-avatar-img");
            }
        }
    });


    // Role
    const roleElements = document.querySelectorAll(
        ".header-role"
    );

    roleElements.forEach(element => {
        if (user.role === "admin") {
            element.textContent = "Quản trị viên";
        } else {
            element.textContent = "Học viên";
        }
    });
}


// ============================================================
// GIAO DIỆN KHÁCH CHƯA ĐĂNG NHẬP
// ============================================================

function updateGuestHeader() {
    const userContainer = document.querySelector(".header-user");
    if (userContainer) {
        userContainer.innerHTML = `
            <a href="login.html" class="btn btn-primary" style="padding: 7px 18px; font-size: 13px; font-weight: 700; text-decoration: none; border-radius: 8px; white-space: nowrap;">
                Đăng nhập
            </a>
        `;
    }
}


// ============================================================
// ADMIN NAVIGATION
// ============================================================

function updateAdminNavigation(user) {
    const adminLinks = document.querySelectorAll(
        "#adminNavLink, .admin-nav-link"
    );

    adminLinks.forEach(link => {
        if (user.role === "admin") {
            link.style.display = "";
        } else {
            link.style.display = "none";
        }
    });
}


// ============================================================
// MOBILE MENU
// ============================================================

function setupMobileMenu() {
    const menuButton = document.getElementById(
        "mobileMenuButton"
    );

    const mainNav = document.getElementById(
        "mainNav"
    );

    if (!menuButton || !mainNav) {
        return;
    }

    menuButton.setAttribute(
        "aria-expanded",
        "false"
    );

    menuButton.addEventListener("click", event => {
        event.stopPropagation();

        const isOpen = mainNav.classList.toggle("open");

        menuButton.setAttribute(
            "aria-expanded",
            String(isOpen)
        );

        menuButton.setAttribute(
            "aria-label",
            isOpen
                ? "Đóng menu"
                : "Mở menu"
        );
    });


    // Đóng menu khi click vào link
    const navLinks = mainNav.querySelectorAll("a");

    navLinks.forEach(link => {
        link.addEventListener("click", () => {
            mainNav.classList.remove("open");

            menuButton.setAttribute(
                "aria-expanded",
                "false"
            );

            menuButton.setAttribute(
                "aria-label",
                "Mở menu"
            );
        });
    });


    // Click bên ngoài menu
    document.addEventListener("click", event => {
        if (
            !mainNav.contains(event.target) &&
            !menuButton.contains(event.target)
        ) {
            mainNav.classList.remove("open");

            menuButton.setAttribute(
                "aria-expanded",
                "false"
            );

            menuButton.setAttribute(
                "aria-label",
                "Mở menu"
            );
        }
    });
}


// ============================================================
// ACTIVE NAVIGATION
// ============================================================

function setActiveNavigation() {
    const rawPath = window.location.pathname || "";
    const currentPage = rawPath
        .replace(/\\/g, "/")
        .split("/")
        .pop()
        .toLowerCase();

    const navLinks = document.querySelectorAll(
        "#mainNav a"
    );

    navLinks.forEach(link => {
        const href = link
            .getAttribute("href");

        if (!href) {
            return;
        }

        const linkPage = href
            .replace(/\\/g, "/")
            .split("/")
            .pop()
            .split("#")[0]
            .toLowerCase();

        link.classList.remove("active");

        if (
            linkPage === currentPage ||
            (
                (currentPage === "" || currentPage === "index.html") &&
                linkPage === "home.html"
            )
        ) {
            link.classList.add("active");
        }
    });
}


// ============================================================
// LOGOUT
// ============================================================

function setupLogoutButtons() {
    const logoutButtons = document.querySelectorAll(
        "#logoutButton, #profileLogoutButton, .logout-button"
    );

    logoutButtons.forEach(button => {
        button.addEventListener("click", event => {
            event.preventDefault();

            const confirmLogout = confirm(
                "Bạn có chắc chắn muốn đăng xuất không?"
            );

            if (!confirmLogout) {
                return;
            }

            if (window.CppAuth && typeof CppAuth.logout === "function") {
                CppAuth.logout();
            } else if (window.CppStorage && typeof CppStorage.logout === "function") {
                CppStorage.logout();
                window.location.href = "login.html";
            } else {
                localStorage.removeItem("cpp_currentUser");
                window.location.href = "login.html";
            }
        });
    });
}


// ============================================================
// QUẢN LÝ GIAO DIỆN SÁNG / TỐI (THEME MANAGER)
// ============================================================

function initThemeEarly() {
    try {
        const savedTheme = localStorage.getItem("cpp_theme");
        if (savedTheme === "dark") {
            document.documentElement.classList.add("dark-theme");
            if (document.body) document.body.classList.add("dark-theme");
        } else if (savedTheme === "light") {
            document.documentElement.classList.remove("dark-theme");
            if (document.body) document.body.classList.remove("dark-theme");
        } else if (window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches) {
            document.documentElement.classList.add("dark-theme");
            if (document.body) document.body.classList.add("dark-theme");
        }
    } catch (e) {
        // Tránh lỗi nếu localStorage bị chặn
    }
}

function getCurrentTheme() {
    return document.documentElement.classList.contains("dark-theme") ||
           (document.body && document.body.classList.contains("dark-theme"))
        ? "dark"
        : "light";
}

function applyTheme(theme) {
    if (theme === "dark") {
        document.documentElement.classList.add("dark-theme");
        if (document.body) document.body.classList.add("dark-theme");
    } else {
        document.documentElement.classList.remove("dark-theme");
        if (document.body) document.body.classList.remove("dark-theme");
    }

    try {
        localStorage.setItem("cpp_theme", theme);
    } catch (e) {}

    // Cập nhật tooltip và accessibility label
    const toggleButtons = document.querySelectorAll(".theme-toggle-btn, #themeToggleBtn");
    toggleButtons.forEach(btn => {
        btn.setAttribute(
            "title",
            theme === "dark" ? "Chuyển sang giao diện Sáng" : "Chuyển sang giao diện Tối"
        );
        btn.setAttribute(
            "aria-label",
            theme === "dark" ? "Chuyển sang giao diện Sáng" : "Chuyển sang giao diện Tối"
        );
        const hasSpans = btn.querySelector(".theme-text-light, .theme-text-dark");
        if (!hasSpans) {
            btn.innerHTML = `<span class="theme-text-light">Chế độ tối</span><span class="theme-text-dark">Chế độ sáng</span>`;
        }
    });
}

function toggleTheme() {
    const newTheme = getCurrentTheme() === "dark" ? "light" : "dark";
    applyTheme(newTheme);
}

function setupThemeToggle() {
    // Đồng bộ theme hiện tại
    const current = getCurrentTheme();
    applyTheme(current);

    // Gán sự kiện chuyển theme cho các nút nếu có trong DOM
    const toggleButtons = document.querySelectorAll(".theme-toggle-btn, #themeToggleBtn");

    toggleButtons.forEach(btn => {
        btn.removeEventListener("click", toggleTheme);
        btn.addEventListener("click", event => {
            event.preventDefault();
            toggleTheme();
        });
    });
}

window.CppTheme = {
    get: getCurrentTheme,
    set: applyTheme,
    toggle: toggleTheme
};

// ============================================================
// HỆ THỐNG THÔNG BÁO TOAST TOÀN CỤC (GLOBAL TOAST NOTIFICATIONS)
// ============================================================

function showToast(message, type = "info", duration = 3200) {
    let container = document.getElementById("toastContainer");
    if (!container) {
        container = document.createElement("div");
        container.id = "toastContainer";
        document.body.appendChild(container);
    }

    const toast = document.createElement("div");
    toast.className = `toast-item toast-${type}`;

    const icons = {
        success: "✓",
        error: "✕",
        warning: "⚠️",
        info: "ℹ️"
    };

    const iconStr = icons[type] || "ℹ️";

    toast.innerHTML = `
        <span class="toast-icon">${iconStr}</span>
        <span class="toast-message">${message}</span>
        <button type="button" class="toast-close" aria-label="Đóng">&times;</button>
    `;

    const closeBtn = toast.querySelector(".toast-close");
    let isRemoved = false;

    function removeToast() {
        if (isRemoved) return;
        isRemoved = true;
        toast.classList.add("toast-hiding");
        setTimeout(() => {
            if (toast.parentNode) {
                toast.parentNode.removeChild(toast);
            }
        }, 320);
    }

    closeBtn.addEventListener("click", removeToast);
    container.appendChild(toast);

    if (duration > 0) {
        setTimeout(removeToast, duration);
    }
}

window.showToast = showToast;

// ============================================================
// HIỆU ỨNG PHÁO HOA ĂN MỪNG TOÀN CỤC (GLOBAL CONFETTI CELEBRATION)
// ============================================================

function triggerConfetti() {
    let canvas = document.getElementById("globalConfettiCanvas");
    if (!canvas) {
        canvas = document.createElement("canvas");
        canvas.id = "globalConfettiCanvas";
        document.body.appendChild(canvas);
    }

    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    const colors = ["#d4af37", "#f59e0b", "#6366f1", "#8b5cf6", "#ec4899", "#10b981", "#3b82f6"];
    const particles = [];
    const count = 120;

    for (let i = 0; i < count; i++) {
        particles.push({
            x: Math.random() * canvas.width,
            y: Math.random() * (canvas.height * 0.4) - 40,
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

window.triggerConfetti = triggerConfetti;

// ============================================================
// TỰ ĐỘNG GẮN NÚT SAO CHÉP MÃ NGUỒN (AUTO COPY CODE BUTTONS)
// ============================================================

function setupCodeCopyButtons() {
    const preBlocks = document.querySelectorAll("pre:not(.no-copy)");
    preBlocks.forEach(pre => {
        if (pre.querySelector(".copy-code-btn")) return;

        // Bọc pre trong wrapper nếu chưa có
        if (!pre.classList.contains("code-block-wrapper")) {
            pre.classList.add("code-block-wrapper");
        }

        const btn = document.createElement("button");
        btn.type = "button";
        btn.className = "copy-code-btn";
        btn.innerHTML = "Sao chép";
        btn.setAttribute("title", "Sao chép mã nguồn");

        btn.addEventListener("click", () => {
            const code = pre.querySelector("code") ? pre.querySelector("code").innerText : pre.innerText;
            if (navigator.clipboard && navigator.clipboard.writeText) {
                navigator.clipboard.writeText(code).then(() => {
                    btn.innerHTML = "Đã chép ✓";
                    btn.classList.add("copied");
                    showToast("Đã sao chép mã nguồn vào clipboard!", "success", 2000);
                    setTimeout(() => {
                        btn.innerHTML = "Sao chép";
                        btn.classList.remove("copied");
                    }, 2000);
                }).catch(() => {
                    showToast("Không thể sao chép tự động", "warning");
                });
            }
        });

        pre.appendChild(btn);
    });
}

// Khởi chạy khi DOM sẵn sàng
document.addEventListener("DOMContentLoaded", () => {
    setupCodeCopyButtons();
});