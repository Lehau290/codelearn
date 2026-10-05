/* =========================================================
   CODELEARN C++
   AUTH.JS
   Đăng ký - Đăng nhập - Đăng xuất
   ========================================================= */

(function () {
    "use strict";


    /* =====================================================
       1. HELPER
       ===================================================== */

    function getElement(id) {
        return document.getElementById(id);
    }


    function showMessage(
        element,
        message,
        type = "error"
    ) {

        if (!element) {
            return;
        }

        element.textContent = message;

        element.className =
            "form-message " + type;

        element.hidden = false;
    }


    function hideMessage(element) {

        if (!element) {
            return;
        }

        element.hidden = true;

        element.textContent = "";

        element.className =
            "form-message";
    }


    function normalizeEmail(email) {

        return String(email || "")
            .trim()
            .toLowerCase();
    }


    function normalizeUsername(username) {

        return String(username || "")
            .trim();
    }


    function isValidEmail(email) {

        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/
            .test(email);
    }


    function redirectTo(page) {

        window.location.href = page;
    }


    /* =====================================================
       2. LOGIN
       ===================================================== */

    function initializeLogin() {

        const loginForm =
            getElement("loginForm");

        if (!loginForm) {
            return;
        }


        const message =
            getElement("loginMessage");

        const usernameInput =
            getElement("loginUsername");

        const passwordInput =
            getElement("loginPassword");

        const rememberInput =
            getElement("rememberMe") ||
            getElement("loginRemember");

        const currentUser = (window.CppStorage && CppStorage.getCurrentUser());
        if (currentUser && message) {
            showMessage(
                message,
                `Bạn hiện đang đăng nhập với tài khoản "${currentUser.username || "Học viên"}". Bạn có thể tiếp tục vào học hoặc đăng nhập tài khoản khác.`,
                "info"
            );
        }



        loginForm.addEventListener(
            "submit",
            async function (event) {

                event.preventDefault();

                hideMessage(message);


                const loginValue =
                    String(
                        usernameInput?.value || ""
                    ).trim();

                const password =
                    String(
                        passwordInput?.value || ""
                    );


                /* -------------------------
                   Validation
                   ------------------------- */

                if (!loginValue) {

                    showMessage(
                        message,
                        "Vui lòng nhập tên tài khoản hoặc email.",
                        "error"
                    );

                    usernameInput?.focus();

                    return;
                }


                if (!password) {

                    showMessage(
                        message,
                        "Vui lòng nhập mật khẩu.",
                        "error"
                    );

                    passwordInput?.focus();

                    return;
                }

                /* -------------------------
                   Try Backend API Login First
                   ------------------------- */
                if (window.CodeLearnApi && typeof CodeLearnApi.auth?.login === "function") {
                    try {
                        const apiRes = await CodeLearnApi.auth.login(loginValue, password);
                        if (apiRes && apiRes.user) {
                            CppStorage.setCurrentUser(apiRes.user);
                            const localUsers = CppStorage.getUsers();
                            if (!localUsers.some(u => u.username.toLowerCase() === apiRes.user.username.toLowerCase())) {
                                CppStorage.createUser(apiRes.user);
                            }
                            if (rememberInput) {
                                localStorage.setItem(
                                    "cpp_rememberLogin",
                                    rememberInput.checked ? "true" : "false"
                                );
                            }
                            showMessage(
                                message,
                                "Đăng nhập thành công! Đang chuyển đến Trang chủ...",
                                "success"
                            );
                            setTimeout(function () {
                                redirectTo("home.html");
                            }, 250);
                            return;
                        }
                    } catch (apiErr) {
                        const errMsg = apiErr.message || "";
                        if (errMsg.includes("chính xác") || errMsg.includes("không tìm thấy") || errMsg.includes("Mật khẩu")) {
                            showMessage(message, errMsg, "error");
                            return;
                        }
                        // Fall through to offline storage fallback
                    }
                }

                /* -------------------------
                   Find user (Offline Fallback)
                   ------------------------- */

                const users =
                    CppStorage.getUsers();


                const normalizedLogin =
                    loginValue.toLowerCase();


                let user =
                    users.find(
                        item => {

                            const username =
                                String(
                                    item.username || ""
                                ).toLowerCase();

                            const email =
                                String(
                                    item.email || ""
                                ).toLowerCase();

                            return (
                                username === normalizedLogin ||
                                email === normalizedLogin
                            );
                        }
                    );

                // Fallback hỗ trợ nếu danh sách tài khoản chưa kịp đồng bộ
                if (!user) {
                    if (normalizedLogin === "letrunghau" || normalizedLogin === "hocvien") {
                        if (password.trim() === "123456") {
                            user = {
                                id: "user-student",
                                username: "letrunghau",
                                fullName: "Lê Trung Hậu",
                                email: "letrunghau@codelearn.vn",
                                password: "123456",
                                role: "student",
                                createdAt: new Date().toISOString()
                            };
                            CppStorage.createUser(user);
                        }
                    } else if (normalizedLogin === "admin") {
                        if (password.trim() === "123456" || password.trim() === "admin123") {
                            user = {
                                id: "user-admin",
                                username: "admin",
                                fullName: "Quản Trị Viên",
                                email: "admin@codelearn.vn",
                                password: "123456",
                                role: "admin",
                                createdAt: new Date().toISOString()
                            };
                            CppStorage.createUser(user);
                        }
                    }
                }

                if (!user) {
                    showMessage(
                        message,
                        "Tài khoản hoặc mật khẩu không chính xác.",
                        "error"
                    );
                    return;
                }

                /* -------------------------
                   Check password
                   ------------------------- */

                const isPasswordValid =
                    String(user.password || "").trim() === password.trim() ||
                    (user.role === "admin" && password.trim() === "admin123");

                if (!isPasswordValid) {
                    showMessage(
                        message,
                        "Tài khoản hoặc mật khẩu không chính xác.",
                        "error"
                    );
                    return;
                }

                /* -------------------------
                   Login success
                   ------------------------- */

                CppStorage.setCurrentUser(user);

                if (rememberInput) {
                    localStorage.setItem(
                        "cpp_rememberLogin",
                        rememberInput.checked ? "true" : "false"
                    );
                }

                showMessage(
                    message,
                    "Đăng nhập thành công! Đang chuyển đến Trang chủ...",
                    "success"
                );

                setTimeout(
                    function () {
                        redirectTo("home.html");
                    },
                    250
                );

            }
        );
    }


    /* =====================================================
       3. REGISTER
       ===================================================== */

    function initializeRegister() {

        const registerForm =
            getElement("registerForm");

        if (!registerForm) {
            return;
        }


        const message =
            getElement("registerMessage");

        const usernameInput =
            getElement("registerUsername");

        const emailInput =
            getElement("registerEmail");

        const passwordInput =
            getElement("registerPassword");

        const confirmPasswordInput =
            getElement("registerConfirmPassword");

        const termsInput =
            getElement("registerTerms") ||
            getElement("agreeTerms");

        const termsLink = getElement("termsLink");
        if (termsLink) {
            termsLink.addEventListener("click", function (e) {
                e.preventDefault();
                window.alert(
                    "Điều khoản sử dụng CodeLearn C++:\n\n" +
                    "1. Học viên cam kết tự làm bài tập để nâng cao kiến thức.\n" +
                    "2. Nội dung bài giảng thuộc bản quyền CodeLearn C++.\n" +
                    "3. Chúc bạn có trải nghiệm học tập hiệu quả và thú vị!"
                );
            });
        }


        registerForm.addEventListener(
            "submit",
            async function (event) {

                event.preventDefault();

                hideMessage(message);


                const username =
                    normalizeUsername(
                        usernameInput?.value
                    );

                const email =
                    normalizeEmail(
                        emailInput?.value
                    );

                const password =
                    String(
                        passwordInput?.value || ""
                    );

                const confirmPassword =
                    String(
                        confirmPasswordInput?.value || ""
                    );


                /* -------------------------
                   Username validation
                   ------------------------- */

                if (!username) {

                    showMessage(
                        message,
                        "Vui lòng nhập tên tài khoản.",
                        "error"
                    );

                    usernameInput?.focus();

                    return;
                }


                if (username.length < 3) {

                    showMessage(
                        message,
                        "Tên tài khoản phải có ít nhất 3 ký tự.",
                        "error"
                    );

                    usernameInput?.focus();

                    return;
                }


                if (username.length > 30) {

                    showMessage(
                        message,
                        "Tên tài khoản không được vượt quá 30 ký tự.",
                        "error"
                    );

                    usernameInput?.focus();

                    return;
                }


                /*
                 * Chỉ cho phép chữ, số,
                 * dấu gạch dưới và dấu chấm.
                 */

                if (
                    !/^[a-zA-Z0-9_.]+$/.test(
                        username
                    )
                ) {

                    showMessage(
                        message,
                        "Tên tài khoản chỉ được chứa chữ, số, dấu gạch dưới và dấu chấm.",
                        "error"
                    );

                    usernameInput?.focus();

                    return;
                }


                /* -------------------------
                   Email validation
                   ------------------------- */

                if (!email) {

                    showMessage(
                        message,
                        "Vui lòng nhập email.",
                        "error"
                    );

                    emailInput?.focus();

                    return;
                }


                if (!isValidEmail(email)) {

                    showMessage(
                        message,
                        "Email không đúng định dạng.",
                        "error"
                    );

                    emailInput?.focus();

                    return;
                }


                /* -------------------------
                   Password validation
                   ------------------------- */

                if (!password) {

                    showMessage(
                        message,
                        "Vui lòng nhập mật khẩu.",
                        "error"
                    );

                    passwordInput?.focus();

                    return;
                }


                if (password.length < 6) {

                    showMessage(
                        message,
                        "Mật khẩu phải có ít nhất 6 ký tự.",
                        "error"
                    );

                    passwordInput?.focus();

                    return;
                }


                /* -------------------------
                   Confirm password
                   ------------------------- */

                if (
                    password !==
                    confirmPassword
                ) {

                    showMessage(
                        message,
                        "Mật khẩu xác nhận không khớp.",
                        "error"
                    );

                    confirmPasswordInput?.focus();

                    return;
                }


                /* -------------------------
                   Terms
                   ------------------------- */

                if (
                    termsInput &&
                    !termsInput.checked
                ) {

                    showMessage(
                        message,
                        "Bạn cần đồng ý với điều khoản sử dụng.",
                        "error"
                    );

                    termsInput.focus();

                    return;
                }


                /* -------------------------
                   Try Backend API Register First
                   ------------------------- */
                if (window.CodeLearnApi && typeof CodeLearnApi.auth?.register === "function") {
                    try {
                        const apiRes = await CodeLearnApi.auth.register(username, email, password, username);
                        if (apiRes && apiRes.user) {
                            CppStorage.createUser(apiRes.user);
                            CppStorage.setCurrentUser(apiRes.user);
                            showMessage(
                                message,
                                "Đăng ký thành công! Đang chuyển đến Trang chủ...",
                                "success"
                            );
                            registerForm.reset();
                            setTimeout(function () {
                                redirectTo("home.html");
                            }, 400);
                            return;
                        }
                    } catch (apiErr) {
                        const errMsg = apiErr.message || "";
                        if (errMsg.includes("tồn tại") || errMsg.includes("sử dụng") || errMsg.includes("Mật khẩu")) {
                            showMessage(message, errMsg, "error");
                            return;
                        }
                        // Fallback to offline storage
                    }
                }

                /* -------------------------
                   Check duplicate (Offline Fallback)
                   ------------------------- */

                const existingUsername =
                    CppStorage.getUserByUsername(
                        username
                    );


                if (existingUsername) {

                    showMessage(
                        message,
                        "Tên tài khoản này đã tồn tại.",
                        "error"
                    );

                    usernameInput?.focus();

                    return;
                }


                const existingEmail =
                    CppStorage.getUserByEmail(
                        email
                    );


                if (existingEmail) {

                    showMessage(
                        message,
                        "Email này đã được sử dụng.",
                        "error"
                    );

                    emailInput?.focus();

                    return;
                }


                /* -------------------------
                   Create account
                   ------------------------- */

                const user =
                    CppStorage.createUser({

                        username,

                        email,

                        password,

                        role: "student"

                    });


                if (!user) {

                    showMessage(
                        message,
                        "Không thể tạo tài khoản. Vui lòng thử lại.",
                        "error"
                    );

                    return;
                }


                /* -------------------------
                   Success
                   ------------------------- */

                // Tự động lưu đăng nhập cho tài khoản vừa tạo
                CppStorage.setCurrentUser(user);

                showMessage(
                    message,
                    "Đăng ký thành công! Đang chuyển đến Trang chủ...",
                    "success"
                );

                registerForm.reset();

                setTimeout(
                    function () {
                        redirectTo("home.html");
                    },
                    400
                );

            }
        );
    }


    /* =====================================================
       4. LOGOUT
       ===================================================== */

    function logout() {

        if (window.CodeLearnApi && typeof CodeLearnApi.auth?.logout === "function") {
            CodeLearnApi.auth.logout().catch(() => {});
        }

        CppStorage.clearCurrentUser();

        /*
         * Không xóa progress của người dùng.
         * Khi đăng nhập lại, tiến độ vẫn còn.
         */

        redirectTo(
            "login.html"
        );
    }


    /* =====================================================
       5. LOGOUT BUTTONS
       ===================================================== */

    function initializeLogoutButtons() {

        const logoutButton =
            getElement("logoutButton");

        const profileLogoutButton =
            getElement(
                "profileLogoutButton"
            );


        if (logoutButton) {

            logoutButton.addEventListener(
                "click",
                function () {

                    const confirmed =
                        window.confirm(
                            "Bạn có chắc muốn đăng xuất?"
                        );

                    if (confirmed) {
                        logout();
                    }

                }
            );
        }


        if (profileLogoutButton) {

            profileLogoutButton.addEventListener(
                "click",
                function () {

                    const confirmed =
                        window.confirm(
                            "Bạn có chắc muốn đăng xuất?"
                        );

                    if (confirmed) {
                        logout();
                    }

                }
            );
        }
    }


    /* =====================================================
       6. FORGOT PASSWORD
       ===================================================== */

    function initializeForgotPassword() {

        const button =
            getElement("forgotPasswordButton") ||
            getElement("forgotPassword");

        if (!button) {
            return;
        }


        button.addEventListener(
            "click",
            function (event) {

                event.preventDefault();


                const email =
                    window.prompt(
                        "Nhập email tài khoản của bạn:"
                    );


                if (!email) {
                    return;
                }


                const normalizedEmail =
                    normalizeEmail(email);


                const user =
                    CppStorage.getUserByEmail(
                        normalizedEmail
                    );


                if (!user) {

                    window.alert(
                        "Không tìm thấy tài khoản với email này."
                    );

                    return;
                }


                /*
                 * Frontend demo:
                 * Không gửi email thật.
                 */

                window.alert(
                    "Demo: yêu cầu đặt lại mật khẩu đã được ghi nhận.\n\n" +
                    "Trong phiên bản thực tế, hệ thống sẽ gửi OTP hoặc liên kết đặt lại mật khẩu qua email."
                );
            }
        );
    }


    /* =====================================================
       7. PROTECT PAGES
       ===================================================== */

    function getCleanCurrentPage() {
        const raw = window.location.pathname || "";
        return raw.replace(/\\/g, "/").split("/").pop().toLowerCase();
    }

    function requireLogin() {

        const currentPage = getCleanCurrentPage();

        const publicPages = [
            "",
            "index.html",
            "login.html",
            "register.html"
        ];


        if (
            publicPages.includes(
                currentPage
            )
        ) {
            return true;
        }


        const user =
            CppStorage.getCurrentUser();


        if (!user) {

            redirectTo(
                "login.html"
            );

            return false;
        }


        return true;
    }


    /* =====================================================
       8. PROTECT ADMIN PAGE
       ===================================================== */

    function requireAdmin() {

        const currentPage = getCleanCurrentPage();


        if (
            currentPage !==
            "admin.html"
        ) {
            return true;
        }


        const user =
            CppStorage.getCurrentUser();


        if (!user) {

            redirectTo(
                "login.html"
            );

            return false;
        }


        if (
            user.role !== "admin"
        ) {

            window.alert(
                "Bạn không có quyền truy cập trang quản trị."
            );

            redirectTo(
                "home.html"
            );

            return false;
        }


        return true;
    }


    /* =====================================================
       9. REDIRECT LOGGED-IN USER
       ===================================================== */

    function redirectLoggedInUser() {

        const currentPage = getCleanCurrentPage();


        const authPages = [
            "",
            "index.html",
            "login.html",
            "register.html"
        ];


        if (
            !authPages.includes(
                currentPage
            )
        ) {
            return;
        }


        const user =
            CppStorage.getCurrentUser();


        /*
         * Trang index có thể tự chuyển.
         * Login/register nếu đã đăng nhập
         * thì đưa về home.
         */

        if (
            user &&
            (
                currentPage ===
                "login.html" ||
                currentPage ===
                "register.html"
            )
        ) {

            redirectTo(
                "home.html"
            );
        }
    }


    /* =====================================================
       10. PASSWORD SHOW/HIDE
       ===================================================== */

    function initializePasswordToggle() {

        const toggleButtons =
            document.querySelectorAll(
                "[data-password-toggle]"
            );


        toggleButtons.forEach(
            function (button) {

                button.addEventListener(
                    "click",
                    function () {

                        const targetId =
                            button.getAttribute(
                                "data-password-toggle"
                            );

                        const input =
                            getElement(
                                targetId
                            );

                        if (!input) {
                            return;
                        }


                        const isPassword =
                            input.type ===
                            "password";


                        input.type =
                            isPassword
                                ? "text"
                                : "password";


                        button.textContent =
                            isPassword
                                ? "Ẩn"
                                : "Hiện";

                    }
                );

            }
        );
    }


    /* =====================================================
       11. AUTO LOGIN CHECK
       ===================================================== */

    function checkAuthentication() {

        const loginRequired =
            requireLogin();


        if (!loginRequired) {
            return false;
        }


        const adminAllowed =
            requireAdmin();


        if (!adminAllowed) {
            return false;
        }


        redirectLoggedInUser();


        return true;
    }


    /* =====================================================
       12. EXPORT
       ===================================================== */

    window.CppAuth = {

        logout,

        requireLogin,

        requireAdmin,

        checkAuthentication

    };


    /* =====================================================
       13. INITIALIZE
       ===================================================== */

    document.addEventListener(
        "DOMContentLoaded",
        function () {

            initializeLogin();

            initializeRegister();

            initializeLogoutButtons();

            initializeForgotPassword();

            initializePasswordToggle();

            checkAuthentication();

        }
    );

})();