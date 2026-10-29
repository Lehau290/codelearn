/**
 * CodeLearn C++ - Client API SDK
 * File: js/api.js
 * Giao tiếp với Python Backend & G++ Compiler Sandbox
 */

(function () {
    "use strict";

    // Tự động nhận diện API URL & Môi trường chạy:
    const isHttps = typeof window !== "undefined" && window.location.protocol === "https:";
    const isLocalhost = typeof window !== "undefined" && (window.location.hostname === "localhost" || window.location.hostname === "127.0.0.1");
    const isDirectBackend = typeof window !== "undefined" && ["5000", "5001", "5002"].includes(window.location.port);
    const isStaticHosted = isHttps && !isLocalhost; // Ví dụ: GitHub Pages (lehau290.github.io)

    let API_BASE_URL = isDirectBackend ? "/api" : "http://localhost:5000/api";

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
        if (isStaticHosted) {
            // Trên GitHub Pages (HTTPS), trình duyệt chặn HTTP request tới localhost (Mixed Content).
            // Tự động chuyển sang chế độ Offline-First mượt mà không ném lỗi ra console.
            _backendAvailable = false;
            return false;
        }

        // Cache health check for 10 seconds
        const now = Date.now();
        if (_backendAvailable !== null && now - _lastHealthCheck < 10000) {
            return _backendAvailable;
        }

        const candidateUrls = [API_BASE_URL];
        if (!isDirectBackend && API_BASE_URL.includes(":5000")) {
            candidateUrls.push("http://localhost:5001/api");
        }

        for (const base of candidateUrls) {
            try {
                const controller = new AbortController();
                const timeoutId = setTimeout(() => controller.abort(), 1800);
                const res = await fetch(`${base}/health`, { signal: controller.signal });
                clearTimeout(timeoutId);
                if (res.ok) {
                    API_BASE_URL = base;
                    _backendAvailable = true;
                    _lastHealthCheck = now;
                    return true;
                }
            } catch (e) {
                // Thử ứng viên tiếp theo
            }
        }

        _backendAvailable = false;
        _lastHealthCheck = now;
        return false;
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
        get API_BASE_URL() { return API_BASE_URL; },
        isStaticHosted,
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
            async ask(message, code = "", lessonId = "", history = [], persona = "tutor") {
                return request("/ai/ask", {
                    method: "POST",
                    body: JSON.stringify({ message, code, lessonId, history, persona })
                });
            },
            async getHistory(lessonId = "") {
                const qs = lessonId ? `?lessonId=${encodeURIComponent(lessonId)}` : "";
                return request(`/ai/history${qs}`);
            },
            async clearHistory(lessonId = "") {
                const qs = lessonId ? `?lessonId=${encodeURIComponent(lessonId)}` : "";
                return request(`/ai/history${qs}`, {
                    method: "DELETE"
                });
            },
            async getConfig() {
                return request("/ai/config");
            },
            async setConfig(configData) {
                return request("/ai/config", {
                    method: "POST",
                    body: JSON.stringify(configData)
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
        // Leaderboard
        // -----------------------------------------------------
        leaderboard: {
            async get() {
                return request("/leaderboard");
            }
        },

        // -----------------------------------------------------
        // Admin
        // -----------------------------------------------------
        admin: {
            async getStats() {
                return request("/admin/stats");
            },

            async getAnalytics() {
                return request("/admin/analytics");
            },

            async getUsers() {
                return request("/admin/users");
            },

            async changeUserRole(userId, role) {
                return request(`/admin/users/${encodeURIComponent(userId)}/role`, {
                    method: "PUT",
                    body: JSON.stringify({ role })
                });
            },

            async changeUserStatus(userId, status) {
                return request(`/admin/users/${encodeURIComponent(userId)}/status`, {
                    method: "PUT",
                    body: JSON.stringify({ status })
                });
            },

            async resetUserPassword(userId, newPassword = "") {
                return request(`/admin/users/${encodeURIComponent(userId)}/reset-password`, {
                    method: "POST",
                    body: JSON.stringify({ newPassword })
                });
            },

            async batchImportUsers(students) {
                return request("/admin/users/batch-import", {
                    method: "POST",
                    body: JSON.stringify({ students })
                });
            },

            async deleteUser(userId) {
                return request(`/admin/users/${encodeURIComponent(userId)}`, {
                    method: "DELETE"
                });
            },

            async getExercises(lessonId = "") {
                const q = lessonId ? `?lessonId=${encodeURIComponent(lessonId)}` : "";
                return request(`/admin/exercises${q}`);
            },

            async createExercise(data) {
                return request("/admin/exercises", {
                    method: "POST",
                    body: JSON.stringify(data)
                });
            },

            async updateExercise(id, data) {
                return request(`/admin/exercises/${encodeURIComponent(id)}`, {
                    method: "PUT",
                    body: JSON.stringify(data)
                });
            },

            async deleteExercise(id, lessonId = "") {
                const q = lessonId ? `?lessonId=${encodeURIComponent(lessonId)}` : "";
                return request(`/admin/exercises/${encodeURIComponent(id)}${q}`, {
                    method: "DELETE"
                });
            },

            async getExerciseTestCases(exerciseId, lessonId = "") {
                const q = lessonId ? `?lessonId=${encodeURIComponent(lessonId)}` : "";
                return request(`/admin/exercises/${encodeURIComponent(exerciseId)}/testcases${q}`);
            },

            async createTestCase(exerciseId, data) {
                return request(`/admin/exercises/${encodeURIComponent(exerciseId)}/testcases`, {
                    method: "POST",
                    body: JSON.stringify(data)
                });
            },

            async updateTestCase(testCaseId, data) {
                return request(`/admin/testcases/${encodeURIComponent(testCaseId)}`, {
                    method: "PUT",
                    body: JSON.stringify(data)
                });
            },

            async deleteTestCase(testCaseId) {
                return request(`/admin/testcases/${encodeURIComponent(testCaseId)}`, {
                    method: "DELETE"
                });
            },

            async getSubmissions(limit = 50) {
                return request(`/admin/submissions?limit=${limit}`);
            },

            async gradeSubmission(submissionId, data) {
                return request(`/admin/submissions/${encodeURIComponent(submissionId)}/grade`, {
                    method: "PUT",
                    body: JSON.stringify(data)
                });
            },

            async getAiChats(limit = 50) {
                return request(`/admin/ai-chats?limit=${limit}`);
            },

            async getAiKnowledge() {
                return request("/admin/ai-knowledge");
            },

            async syncAiKnowledge() {
                return request("/admin/ai-knowledge/sync", { method: "POST" });
            },

            async getComments() {
                return request("/admin/comments");
            },

            async updateCommentStatus(commentId, data) {
                return request(`/admin/comments/${encodeURIComponent(commentId)}/status`, {
                    method: "PUT",
                    body: JSON.stringify(data)
                });
            },

            async deleteComment(commentId) {
                return request(`/admin/comments/${encodeURIComponent(commentId)}`, {
                    method: "DELETE"
                });
            },

            async getAnnouncements() {
                return request("/admin/announcements");
            },

            async createAnnouncement(data) {
                return request("/admin/announcements", {
                    method: "POST",
                    body: JSON.stringify(data)
                });
            },

            async updateAnnouncement(announcementId, data) {
                return request(`/admin/announcements/${encodeURIComponent(announcementId)}`, {
                    method: "PUT",
                    body: JSON.stringify(data)
                });
            },

            async deleteAnnouncement(announcementId) {
                return request(`/admin/announcements/${encodeURIComponent(announcementId)}`, {
                    method: "DELETE"
                });
            },

            async createLesson(data) {
                return request("/lessons", {
                    method: "POST",
                    body: JSON.stringify(data)
                });
            },

            async updateLesson(id, data) {
                return request(`/lessons/${encodeURIComponent(id)}`, {
                    method: "PUT",
                    body: JSON.stringify(data)
                });
            },

            async deleteLesson(id) {
                return request(`/lessons/${encodeURIComponent(id)}`, {
                    method: "DELETE"
                });
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
        },

        // -----------------------------------------------------
        // Certificates
        // -----------------------------------------------------
        certificates: {
            async claim(courseName = "C++ Master Foundation") {
                return request("/certificates/claim", {
                    method: "POST",
                    body: JSON.stringify({ courseName })
                });
            },

            async getMe() {
                return request("/certificates/me");
            },

            async verify(code) {
                return request(`/certificates/verify?code=${encodeURIComponent(code)}`);
            }
        },

        // -----------------------------------------------------
        // Achievements
        // -----------------------------------------------------
        achievements: {
            async get() {
                return request("/achievements");
            }
        },

        // -----------------------------------------------------
        // Announcements
        // -----------------------------------------------------
        announcements: {
            async getAll() {
                return request("/announcements");
            }
        },

        // -----------------------------------------------------
        // Comments & Discussions
        // -----------------------------------------------------
        comments: {
            async getByLesson(lessonId) {
                return request(`/lessons/${encodeURIComponent(lessonId)}/comments`);
            },

            async post(lessonId, content, parentId = null) {
                return request(`/lessons/${encodeURIComponent(lessonId)}/comments`, {
                    method: "POST",
                    body: JSON.stringify({ content, parentId })
                });
            }
        }
    };

    // Auto check health on load
    checkHealth().then(isOnline => {
        if (isOnline) {
            console.log("[CodeLearn C++] Đã kết nối thành công với Python Backend & Trình biên dịch G++ 13.2.0!");
        } else {
            console.log("[CodeLearn C++] Đang chạy chế độ Offline-First (localStorage). Chạy `python run_server.py` để kích hoạt Backend!");
        }
    });

})();
