// ============================================================
// CODELEARN C++ - HOME PAGE
// File: js/home.js
// ============================================================

document.addEventListener("DOMContentLoaded", () => {
    // Lấy người dùng hiện tại (nếu có)
    const currentUser = CppStorage.getCurrentUser();

    // 1. Hiển thị lời chào
    updateGreeting(currentUser);

    // 2. Hiển thị thống kê học tập
    updateLearningStats(currentUser);

    // 3. Hiển thị danh sách bài học
    renderFeaturedLessons(currentUser);

    // 4. Nút tiếp tục học
    setupContinueLearning(currentUser);

    // 5. Cập nhật bảng xếp hạng thi đua
    updateLeaderboardUser(currentUser);
    initLeaderboardInteractions();

    // 6. Hiệu ứng Vầng sáng công nghệ lướt theo chuột (Mouse Spotlight Glow)
    initHeroSpotlight();

    // 7. Hiệu ứng Terminal giả lập gõ code C++ tự động (Live Code Typing Showcase)
    initHeroLiveCodeTyping();
});


// ============================================================
// LỜI CHÀO
// ============================================================

function updateGreeting(user) {
    const greetingElement = document.getElementById(
        "homeGreeting"
    );

    const nameElement =
        document.getElementById("welcomeUsername") ||
        document.getElementById("homeUsername");

    if (greetingElement) {
        const hour = new Date().getHours();

        let greeting = "Xin chào";

        if (hour >= 5 && hour < 12) {
            greeting = "Chào buổi sáng";
        } else if (hour >= 12 && hour < 18) {
            greeting = "Chào buổi chiều";
        } else {
            greeting = "Chào buổi tối";
        }

        greetingElement.textContent = greeting;
    }

    if (nameElement) {
        nameElement.textContent =
            user && user.username ? `, ${user.username}` : " bạn đến với CodeLearn C++";
    }
}


// ============================================================
// THỐNG KÊ HỌC TẬP
// ============================================================

function updateLearningStats(user) {
    const lessons = CppStorage.getLessons();
    const progress = user ? CppStorage.getUserProgress(user.id) : {};

    const totalLessons = lessons.length;

    const completedLessons = lessons.filter(
        lesson => progress[lesson.id]?.completed
    ).length;

    const progressPercent =
        totalLessons > 0
            ? Math.round(
                (completedLessons / totalLessons) * 100
            )
            : 0;

    const scores = lessons
        .map(lesson => progress[lesson.id]?.score)
        .filter(score => typeof score === "number");

    const averageScore =
        scores.length > 0
            ? Math.round(
                scores.reduce((sum, score) => sum + score, 0) / scores.length
            )
            : 0;


    // Tổng bài học
    setText("totalLessons", totalLessons);

    // Bài đã hoàn thành
    setText("completedLessons", completedLessons);

    // Phần trăm tiến độ
    setText("progressPercent", `${progressPercent}%`);
    setText("progressCircleText", `${progressPercent}%`);

    // Stats section
    setText("statLessons", totalLessons);
    setText("statCompleted", completedLessons);
    setText("statExercises", totalLessons);
    setText("statScore", `${averageScore}/100`);


    // Progress bar
    const progressBar = document.getElementById("progressBar");
    if (progressBar) {
        progressBar.style.width = `${progressPercent}%`;
    }

    document.querySelectorAll(".progress-bar-fill, .progress-fill").forEach(bar => {
        bar.style.width = `${progressPercent}%`;
    });
}


// ============================================================
// HIỂN THỊ BÀI HỌC NỔI BẬT
// ============================================================

function renderFeaturedLessons(user) {
    const container = document.getElementById(
        "homeLessons"
    );

    if (!container) {
        return;
    }

    const lessons = CppStorage.getLessons();
    const progress = user ? CppStorage.getUserProgress(user.id) : {};

    if (!lessons.length) {
        container.innerHTML = `
            <div class="empty-state">
                <h3>Chưa có bài học</h3>
                <p>
                    Hiện tại chưa có bài học nào
                    trong hệ thống.
                </p>
            </div>
        `;

        return;
    }


    // Chỉ hiển thị tối đa 6 bài học trên trang chủ
    const featuredLessons = lessons.slice(0, 6);

    container.innerHTML = featuredLessons
        .map((lesson, index) => {

            const lessonProgress =
                progress[lesson.id];

            const completed =
                lessonProgress?.completed === true;

            const statusClass =
                completed
                    ? "completed"
                    : "";

            const statusText =
                completed
                    ? "Đã hoàn thành"
                    : "Chưa học";


            return `
                <article class="lesson-card ${statusClass}">
                    
                    <div class="lesson-card-top">
                        <span class="lesson-number">
                            Bài ${String(index + 1).padStart(2, "0")}
                        </span>

                        <span class="lesson-status ${completed ? "completed" : ""}">
                            ${completed ? "✓ Đã hoàn thành" : "○ Chưa học"}
                        </span>
                    </div>

                    <div class="lesson-card-header">
                        <div class="lesson-card-icon">
                            ${getLessonIcon(index)}
                        </div>

                        <span class="lesson-chapter">
                            ${escapeHtml(
                                lesson.chapter ||
                                "C++ Cơ bản"
                            )}
                        </span>
                    </div>

                    <div class="lesson-card-content">
                        <h3>
                            ${escapeHtml(
                                lesson.title
                            )}
                        </h3>

                        <p>
                            ${escapeHtml(
                                lesson.description ||
                                "Bài học C++ cơ bản."
                            )}
                        </p>
                    </div>

                    <div class="lesson-card-footer">
                        <span class="lesson-duration">
                            ⏱ ${escapeHtml(
                                lesson.duration ||
                                "15 phút"
                            )}
                        </span>

                        <span class="lesson-action-pill ${completed ? "completed" : ""}">
                            ${completed ? "Ôn lại bài →" : "Vào học ngay →"}
                        </span>
                    </div>

                    <a
                        href="lesson-detail.html?id=${encodeURIComponent(
                            lesson.id
                        )}"
                        class="lesson-card-link"
                        aria-label="Học bài ${escapeHtml(
                            lesson.title
                        )}"
                    >
                        <span class="sr-only">Học bài ${escapeHtml(lesson.title)}</span>
                    </a>

                </article>
            `;
        })
        .join("");
}


// ============================================================
// NÚT TIẾP TỤC HỌC
// ============================================================

function setupContinueLearning(user) {
    const button = document.getElementById(
        "continueLearningButton"
    );

    if (!button) {
        return;
    }

    const lessons = CppStorage.getLessons();

    if (!user) {
        button.href = "lessons.html";
        button.textContent = "Bắt đầu học ngay →";
        return;
    }

    const progress = CppStorage.getUserProgress(
        user.id
    );


    // Tìm bài đầu tiên chưa hoàn thành
    const nextLesson = lessons.find(
        lesson => !progress[lesson.id]?.completed
    );


    // Nếu còn bài chưa học
    if (nextLesson) {
        button.href =
            `lesson-detail.html?id=${encodeURIComponent(
                nextLesson.id
            )}`;

        button.textContent =
            "Tiếp tục học →";

        return;
    }


    // Nếu đã hoàn thành tất cả
    if (lessons.length > 0) {
        button.href = "lessons.html";
        button.textContent =
            "Xem lại khóa học →";
    }
}


// ============================================================
// ICON CHO BÀI HỌC
// ============================================================

function getLessonIcon(index) {
    const icons = [
        "🚀",
        "📦",
        "⌨️",
        "➗",
        "🔀",
        "🔁",
        "🧩",
        "📝"
    ];

    return icons[index % icons.length];
}


// ============================================================
// SET TEXT AN TOÀN
// ============================================================

function setText(id, value) {
    const element = document.getElementById(id);

    if (element) {
        element.textContent = value;
    }
}


// ============================================================
// ESCAPE HTML
// ============================================================

function escapeHtml(value) {
    if (value === null || value === undefined) {
        return "";
    }

    return String(value)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}


// ============================================================
// BẢNG VÀNG THI ĐUA (LEADERBOARD)
// ============================================================

function updateLeaderboardUser(user) {
    if (!user) return;
    const nameEl = document.getElementById("currentUserRankName");
    const avatarEl = document.getElementById("currentUserRankAvatar");
    const pointsEl = document.getElementById("currentUserRankPoints");
    const streakEl = document.getElementById("currentUserRankStreak");
    const descEl = document.getElementById("currentUserRankDesc");

    if (nameEl) nameEl.textContent = `${user.fullName || user.username} (Bạn)`;
    if (avatarEl) {
        if (user.avatar) {
            avatarEl.innerHTML = `<img src="${user.avatar}" alt="Avatar" style="width: 100%; height: 100%; border-radius: inherit; object-fit: cover;">`;
        } else {
            avatarEl.textContent = (user.username || "U").charAt(0).toUpperCase();
        }
    }

    // Kết nối dữ liệu xếp hạng thực tế từ backend nếu có
    if (window.CodeLearnApi && typeof CodeLearnApi.leaderboard?.get === "function") {
        CodeLearnApi.leaderboard.get().then(res => {
            if (res && res.leaderboard) {
                const myEntry = res.leaderboard.find(u => u.isCurrentUser || u.id === user.id);
                if (myEntry) {
                    if (pointsEl) pointsEl.textContent = Number(myEntry.points || 0).toLocaleString();
                    if (streakEl) streakEl.textContent = `${myEntry.streak || 1} ngày liên tục`;
                    if (descEl) descEl.textContent = `${myEntry.rankTitle || 'Học viên'} (Hoàn thành ${myEntry.completedLessons || 0} bài)`;
                    return;
                }
            }
        }).catch(() => {
            // Tự động dùng fallback bộ nhớ cục bộ nếu offline
        });
    }

    const progress = CppStorage.getUserProgress(user.id);
    const lessons = CppStorage.getLessons();
    const completedCount = lessons.filter(l => progress[l.id]?.completed).length;
    const scores = lessons.map(l => progress[l.id]?.score).filter(s => typeof s === "number");
    const avgScore = scores.length ? Math.round(scores.reduce((a, b) => a + b, 0) / scores.length) : 80;
    const totalPts = (completedCount * 100) + Math.round(avgScore * 4.5);

    if (pointsEl) pointsEl.textContent = (totalPts > 0 ? totalPts : 850).toLocaleString();

    let streakVal = 3;
    try {
        const streakKey = `cpp_streak_${user.id}`;
        const raw = localStorage.getItem(streakKey);
        if (raw) {
            const parsed = JSON.parse(raw);
            if (parsed.streak) streakVal = parsed.streak;
        }
    } catch(e) {}
    if (streakEl) streakEl.textContent = `🔥 ${streakVal} ngày liên tục`;
    if (descEl) descEl.textContent = `Đã hoàn thành ${completedCount}/${lessons.length} bài học`;
}

function initLeaderboardInteractions() {
    // 1. Click tương tác trên Podium (Cổ vũ & Bắn pháo hoa Confetti)
    const cheerTargets = document.querySelectorAll(".podium-card, .btn-podium-cheer");
    cheerTargets.forEach(item => {
        item.addEventListener("click", (e) => {
            // Tránh trigger 2 lần nếu click trúng button nằm trong card
            if (e.currentTarget.classList.contains("podium-card") && e.target.closest(".btn-podium-cheer")) {
                return;
            }

            const targetCard = e.currentTarget.classList.contains("podium-card") 
                ? e.currentTarget 
                : e.currentTarget.closest(".podium-card");

            const name = targetCard?.getAttribute("data-podium-name") || "Học viên";
            const rank = targetCard?.getAttribute("data-podium-rank") || "1";

            // Bắn pháo hoa Confetti toàn màn hình
            if (typeof window.triggerConfetti === "function") {
                window.triggerConfetti();
            }

            // Hiệu ứng particle nổi bay lên từ vị trí chuột
            spawnFloatingSparkle(e.clientX || (window.innerWidth / 2), e.clientY || (window.innerHeight / 2), rank === "1" ? "👑" : "⭐");

            // Hiển thị Toast thông báo chúc mừng
            if (typeof window.showToast === "function") {
                if (rank === "1") {
                    window.showToast(`🎉 Chúc mừng Quán Quân Tuần: ${name}! Bạn đã tặng 1 sao vinh danh ⭐`, "success", 2600);
                } else {
                    window.showToast(`👏 Bạn đã gửi tràng pháo tay cổ vũ tới ${name}! ✨`, "info", 2200);
                }
            }
        });
    });

    // 2. Chuyển đổi bộ lọc chu kỳ thi đua (Tuần này / Tháng này / Mọi thời đại)
    const filterTabs = document.querySelectorAll("#leaderboardPeriodTabs .filter-pill");
    filterTabs.forEach(tab => {
        tab.addEventListener("click", () => {
            if (tab.classList.contains("active")) return;
            filterTabs.forEach(t => t.classList.remove("active"));
            tab.classList.add("active");

            const period = tab.getAttribute("data-period");
            let multiplier = 1;
            let periodName = "Tuần này";

            if (period === "month") {
                multiplier = 3.4;
                periodName = "Tháng này";
            } else if (period === "all") {
                multiplier = 8.6;
                periodName = "Mọi thời đại";
            }

            // Cập nhật các điểm số hiển thị với hiệu ứng đếm số mượt mà
            document.querySelectorAll(".pts-val").forEach(el => {
                const base = Number(el.getAttribute("data-base") || 1000);
                const target = Math.round(base * multiplier);
                animateNumber(el, target);
            });

            // Cập nhật điểm của user hiện tại
            const userPtsEl = document.getElementById("currentUserRankPoints");
            if (userPtsEl) {
                const currentPts = Number(userPtsEl.textContent.replace(/,/g, "")) || 850;
                let baseUserPts = userPtsEl.getAttribute("data-base-user");
                if (!baseUserPts) {
                    baseUserPts = currentPts;
                    userPtsEl.setAttribute("data-base-user", baseUserPts);
                } else {
                    baseUserPts = Number(baseUserPts);
                }
                const targetUser = Math.round(baseUserPts * multiplier);
                animateNumber(userPtsEl, targetUser);
            }

            if (typeof window.showToast === "function") {
                window.showToast(`Đã chuyển sang bảng xếp hạng: ${periodName}`, "info", 1800);
            }
        });
    });

    function spawnFloatingSparkle(x, y, icon) {
        const span = document.createElement("span");
        span.className = "floating-sparkle";
        span.textContent = icon;
        span.style.left = `${x}px`;
        span.style.top = `${y}px`;
        document.body.appendChild(span);
        setTimeout(() => span.remove(), 1200);
    }

    function animateNumber(element, targetVal) {
        const startVal = Number(element.textContent.replace(/,/g, "")) || 0;
        const duration = 650;
        const startTime = performance.now();

        function update(currentTime) {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            const ease = 1 - Math.pow(1 - progress, 3);
            const current = Math.round(startVal + (targetVal - startVal) * ease);
            element.textContent = current.toLocaleString();

            if (progress < 1) {
                requestAnimationFrame(update);
            }
        }
        requestAnimationFrame(update);
    }
}


// ============================================================
// HIỆU ỨNG 1: TERMINAL GIẢ LẬP GÕ CODE C++ TỰ ĐỘNG
// (LIVE CODE TYPING SHOWCASE)
// ============================================================

function initHeroLiveCodeTyping() {
    const codeElem = document.getElementById("heroLiveCode");
    const linesElem = document.getElementById("heroEditorLines");
    const cursorElem = document.getElementById("heroTypingCursor");
    const statusElem = document.getElementById("heroOutputStatus");
    const successElem = document.getElementById("heroOutputSuccess");
    const badgeElem = document.getElementById("heroRunBadge");
    const dotElem = document.getElementById("heroOutputDot");
    const rerunBtn = document.getElementById("btnRerunHeroCode");

    if (!codeElem || !statusElem) return;

    // Tokens định nghĩa cấu trúc cú pháp C++ chuẩn xác, tránh lỗi regex đè thuộc tính HTML
    const TOKENS = [
        { text: "#include ", cls: "c-keyword" },
        { text: "<iostream>\n\n", cls: "c-string" },
        { text: "int ", cls: "c-keyword" },
        { text: "main", cls: "c-func" },
        { text: "() {\n", cls: "" },
        { text: "    ", cls: "" },
        { text: "std", cls: "c-type" },
        { text: "::", cls: "" },
        { text: "cout", cls: "c-type" },
        { text: " << ", cls: "" },
        { text: '"Xin chào C++ Developer!"', cls: "c-string" },
        { text: " << ", cls: "" },
        { text: "std", cls: "c-type" },
        { text: "::", cls: "" },
        { text: "endl", cls: "c-type" },
        { text: ";\n", cls: "" },
        { text: "    ", cls: "" },
        { text: "return ", cls: "c-keyword" },
        { text: "0", cls: "c-num" },
        { text: ";\n}", cls: "" }
    ];

    const fullCode = TOKENS.map(t => t.text).join("");

    let typingTimer = null;
    let loopTimer = null;
    let isTyping = false;

    // Hàm render an toàn: lấy chính xác số lượng ký tự từ mảng tokens, escape HTML và gán class highlight
    function renderTokens(tokens, charCount) {
        let remaining = charCount;
        let html = "";
        for (let i = 0; i < tokens.length; i++) {
            if (remaining <= 0) break;
            const token = tokens[i];
            const take = token.text.substring(0, remaining);
            remaining -= take.length;

            const escaped = take
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;");

            if (token.cls) {
                html += `<span class="${token.cls}">${escaped}</span>`;
            } else {
                html += escaped;
            }
        }
        return html;
    }

    function runTypingAnimation() {
        if (typingTimer) clearTimeout(typingTimer);
        if (loopTimer) clearTimeout(loopTimer);

        isTyping = true;
        let charIndex = 0;

        codeElem.innerHTML = "";
        if (cursorElem) cursorElem.style.display = "inline-block";
        if (successElem) successElem.textContent = "";

        if (badgeElem) {
            badgeElem.textContent = "Đang gõ mã...";
            badgeElem.style.background = "rgba(164, 158, 242, 0.2)";
            badgeElem.style.color = "#c7d2fe";
            badgeElem.style.borderColor = "rgba(164, 158, 242, 0.35)";
        }

        if (dotElem) {
            dotElem.style.background = "#f59e0b";
            dotElem.style.boxShadow = "0 0 8px #f59e0b";
        }

        statusElem.textContent = "[Compilation]: Đang nhập mã nguồn...";

        function typeNext() {
            if (charIndex <= fullCode.length) {
                const currentText = fullCode.substring(0, charIndex);
                codeElem.innerHTML = renderTokens(TOKENS, charIndex);

                // Cập nhật số dòng động
                if (linesElem) {
                    const lineCount = Math.max(1, currentText.split("\n").length);
                    linesElem.innerHTML = Array.from({ length: lineCount }, (_, i) => i + 1).join("<br>");
                }

                charIndex++;
                const delay = fullCode[charIndex - 1] === "\n" ? 120 : (Math.random() * 25 + 25);
                typingTimer = setTimeout(typeNext, delay);
            } else {
                finishTyping();
            }
        }

        function finishTyping() {
            isTyping = false;
            if (badgeElem) {
                badgeElem.textContent = "Đang biên dịch...";
                badgeElem.style.background = "rgba(245, 158, 11, 0.18)";
                badgeElem.style.color = "#fbbf24";
                badgeElem.style.borderColor = "rgba(245, 158, 11, 0.35)";
            }

            statusElem.textContent = "[Compilation]: gcc/g++ 13.2 -O2 main.cpp -o main.exe...";

            setTimeout(() => {
                if (badgeElem) {
                    badgeElem.textContent = "Đã biên dịch ✓";
                    badgeElem.style.background = "rgba(16, 185, 129, 0.2)";
                    badgeElem.style.color = "#34d399";
                    badgeElem.style.borderColor = "rgba(16, 185, 129, 0.35)";
                }

                if (dotElem) {
                    dotElem.style.background = "#10b981";
                    dotElem.style.boxShadow = "0 0 8px #10b981";
                }

                statusElem.innerHTML = '<span style="color:#34d399">[Compilation]: Success • g++ 13.2 (0.012s)</span>';
                if (successElem) {
                    successElem.textContent = "[Output]: Xin chào C++ Developer! ✨";
                }

                // Tự động lặp lại mô phỏng sau 12 giây nếu người dùng không tương tác
                loopTimer = setTimeout(runTypingAnimation, 12000);
            }, 650);
        }

        typeNext();
    }

    if (rerunBtn) {
        rerunBtn.addEventListener("click", () => {
            runTypingAnimation();
            if (typeof window.showToast === "function") {
                window.showToast("Đang chạy lại mô phỏng gõ mã C++!", "info", 1800);
            }
        });
    }

    // Khởi chạy lần đầu sau 400ms
    setTimeout(runTypingAnimation, 400);
}


// ============================================================
// HIỆU ỨNG 2: VẦNG SÁNG CÔNG NGHỆ LƯỚT THEO CHUỘT
// (MOUSE SPOTLIGHT GLOW)
// ============================================================

function initHeroSpotlight() {
    const hero = document.querySelector(".home-hero");
    if (!hero) return;

    let rafId = null;

    hero.addEventListener("mousemove", (e) => {
        if (rafId) cancelAnimationFrame(rafId);
        rafId = requestAnimationFrame(() => {
            const rect = hero.getBoundingClientRect();
            const x = Math.round(e.clientX - rect.left);
            const y = Math.round(e.clientY - rect.top);
            hero.style.setProperty("--spotlight-x", `${x}px`);
            hero.style.setProperty("--spotlight-y", `${y}px`);
        });
    });

    hero.addEventListener("mouseleave", () => {
        hero.style.setProperty("--spotlight-x", "50%");
        hero.style.setProperty("--spotlight-y", "35%");
    });
}