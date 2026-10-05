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

    // Tìm hoặc tự động tạo nút chuyển theme nếu chưa có trong DOM
    let toggleButtons = document.querySelectorAll(".theme-toggle-btn, #themeToggleBtn");

    if (toggleButtons.length === 0) {
        const headerInner = document.querySelector(".header-inner");
        if (headerInner) {
            const btn = document.createElement("button");
            btn.type = "button";
            btn.className = "theme-toggle-btn";
            btn.id = "themeToggleBtn";
            btn.setAttribute(
                "aria-label",
                current === "dark" ? "Chuyển sang giao diện Sáng" : "Chuyển sang giao diện Tối"
            );
            btn.setAttribute(
                "title",
                current === "dark" ? "Chuyển sang giao diện Sáng" : "Chuyển sang giao diện Tối"
            );
            btn.innerHTML = `<span class="theme-text-light">Chế độ tối</span><span class="theme-text-dark">Chế độ sáng</span>`;

            const headerUser = headerInner.querySelector(".header-user");
            if (headerUser) {
                headerInner.insertBefore(btn, headerUser);
            } else {
                headerInner.appendChild(btn);
            }
            toggleButtons = [btn];
        } else {
            const authPage = document.querySelector(".auth-page");
            if (authPage) {
                const wrapper = document.createElement("div");
                wrapper.className = "auth-theme-toggle";
                wrapper.innerHTML = `
                    <button type="button" class="theme-toggle-btn" id="themeToggleBtn" aria-label="Chuyển chế độ sáng/tối" title="Chuyển chế độ sáng/tối">
                        <span class="theme-text-light">Chế độ tối</span>
                        <span class="theme-text-dark">Chế độ sáng</span>
                    </button>
                `;
                document.body.appendChild(wrapper);
                toggleButtons = wrapper.querySelectorAll(".theme-toggle-btn");
            }
        }
    }

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