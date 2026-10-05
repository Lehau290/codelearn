/**
 * CodeLearn C++ - Client API SDK
 * File: js/api.js
 * Giao tiếp với Python Backend & G++ Compiler Sandbox
 */

(function () {
    "use strict";

    // Tự động nhận diện API URL:
    // Nếu trang đang mở qua server Python (port 5000) -> dùng '/api'
    // Nếu mở qua Live Server (port 5500) hoặc file:// -> dùng 'http://localhost:5000/api'
    const isRunningOnBackendPort = window.location.port === "5000";
    const API_BASE_URL = isRunningOnBackendPort
        ? "/api"
        : "http://localhost:5000/api";

    const TOKEN_KEY = "cpp_backend_token";

    let _backendAvailable = null;
    let _lastHealthCheck = 0;

    function getToken() {
        return localStorage.getItem(TOKEN_KEY) || "";
    }

    function setToken(token) {
        if (token) {
            localStorage.setItem(TOKEN_KEY, token);
        } else {
            localStorage.removeItem(TOKEN_KEY);
        }
    }

    async function checkHealth() {
        // Cache health check for 10 seconds
        const now = Date.now();
        if (_backendAvailable !== null && now - _lastHealthCheck < 10000) {
            return _backendAvailable;
        }

        try {
            const controller = new AbortController();
            const timeoutId = setTimeout(() => controller.abort(), 2000);
            const res = await fetch(`${API_BASE_URL}/health`, {
                signal: controller.signal
            });
            clearTimeout(timeoutId);
            _backendAvailable = res.ok;
            _lastHealthCheck = now;
            return _backendAvailable;
        } catch (e) {
            _backendAvailable = false;
            _lastHealthCheck = now;
            return false;
        }
    }

    async function request(endpoint, options = {}) {
        const url = `${API_BASE_URL}${endpoint}`;
        const headers = {
            "Content-Type": "application/json",
            ...(options.headers || {})
        };

        const token = getToken();
        if (token) {
            headers["Authorization"] = `Bearer ${token}`;
        }

        try {
            const res = await fetch(url, {
                ...options,
                headers
            });

            const data = await res.json().catch(() => ({}));
            if (!res.ok) {
                const errorMsg = data.error || `Lỗi máy chủ (${res.status})`;
                throw new Error(errorMsg);
            }
            return data;
        } catch (err) {
            console.warn(`[CodeLearnApi] Request ${endpoint} failed:`, err.message);
            throw err;
        }
    }

    // Export window.CodeLearnApi
    window.CodeLearnApi = {
        API_BASE_URL,
        getToken,
        setToken,
        checkHealth,

        // -----------------------------------------------------
        // Authentication
        // -----------------------------------------------------
        auth: {
            async login(identity, password) {
                const data = await request("/auth/login", {
                    method: "POST",
                    body: JSON.stringify({ username: identity, password })
                });
                if (data.token) {
                    setToken(data.token);
                }
                return data;
            },

            async register(username, email, password, fullName = "") {
                const data = await request("/auth/register", {
                    method: "POST",
                    body: JSON.stringify({ username, email, password, fullName })
                });
                if (data.token) {
                    setToken(data.token);
                }
                return data;
            },

            async getMe() {
                return request("/auth/me");
            },

            async logout() {
                try {
                    await request("/auth/logout", { method: "POST" });
                } catch (e) {
                    // Ignore error on logout
                }
                setToken("");
            }
        },

        // -----------------------------------------------------
        // Lessons
        // -----------------------------------------------------
        lessons: {
            async getAll() {
                return request("/lessons");
            },

            async getById(id) {
                return request(`/lessons/${id}`);
            },

            async create(lessonData) {
                return request("/lessons", {
                    method: "POST",
                    body: JSON.stringify(lessonData)
                });
            },

            async update(id, lessonData) {
                return request(`/lessons/${id}`, {
                    method: "PUT",
                    body: JSON.stringify(lessonData)
                });
            },

            async delete(id) {
                return request(`/lessons/${id}`, {
                    method: "DELETE"
                });
            }
        },

        // -----------------------------------------------------
        // Real C++ Compiler & AI Evaluator
        // -----------------------------------------------------
        compiler: {
            async compile(code, input = "", timeout = 5) {
                return request("/compile", {
                    method: "POST",
                    body: JSON.stringify({ code, input, timeout })
                });
            },

            async submitExercise(lessonId, exerciseId, code, input = "") {
                return request("/submit-exercise", {
                    method: "POST",
                    body: JSON.stringify({ lessonId, exerciseId, code, input })
                });
            }
        },

        // -----------------------------------------------------
        // AI Mentor
        // -----------------------------------------------------
        ai: {
            async ask(message, code = "", lessonId = "") {
                return request("/ai/ask", {
                    method: "POST",
                    body: JSON.stringify({ message, code, lessonId })
                });
            }
        },

        // -----------------------------------------------------
        // Progress & Learning
        // -----------------------------------------------------
        progress: {
            async get() {
                return request("/progress");
            },

            async save(lessonId, code, status = "in_progress", score = 0) {
                return request("/progress", {
                    method: "POST",
                    body: JSON.stringify({ lessonId, code, status, score })
                });
            },

            async reset() {
                return request("/progress/reset", {
                    method: "POST"
                });
            }
        },

        // -----------------------------------------------------
        // User Profile
        // -----------------------------------------------------
        user: {
            async getProfile() {
                return request("/user/profile");
            },

            async updateProfile(profileData) {
                return request("/user/profile", {
                    method: "PUT",
                    body: JSON.stringify(profileData)
                });
            },

            async changePassword(oldPassword, newPassword) {
                return request("/user/password", {
                    method: "PUT",
                    body: JSON.stringify({ oldPassword, newPassword })
                });
            }
        },

        // -----------------------------------------------------
        // Admin
        // -----------------------------------------------------
        admin: {
            async getStats() {
                return request("/admin/stats");
            },

            async getUsers() {
                return request("/admin/users");
            },

            database: {
                async getStats() {
                    return request("/admin/database/stats");
                },

                async backup() {
                    return request("/admin/database/backup", { method: "POST" });
                },

                async export() {
                    return request("/admin/database/export", { method: "POST" });
                }
            }
        }
    };

    // Auto check health on load
    checkHealth().then(isOnline => {
        if (isOnline) {
            console.log("⚡ [CodeLearn C++] Đã kết nối thành công với Python Backend & Trình biên dịch G++ 13.2.0!");
        } else {
            console.log("ℹ️ [CodeLearn C++] Đang chạy chế độ Offline-First (localStorage). Chạy `python run_server.py` để kích hoạt Backend!");
        }
    });

})();
