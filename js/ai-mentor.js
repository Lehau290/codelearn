/**
 * CodeLearn C++ - Omnipresent AI ChatGPT Assistant Widget
 * File: js/ai-mentor.js
 * Enables the AI Tutor on any page (Home, Lessons, Profile, etc.)
 */
(function() {
    'use strict';

    // Đợi DOM sẵn sàng
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initGlobalAiAssistant);
    } else {
        initGlobalAiAssistant();
    }

    function initGlobalAiAssistant() {
        // Nếu trang đã có sẵn widget (như lesson-detail.html), không tiêm thêm để tránh trùng lặp
        if (document.getElementById('aiMentorWidget')) {
            return;
        }

        // Tạo widget container
        const widget = document.createElement('div');
        widget.id = 'aiMentorWidget';
        widget.className = 'ai-mentor-widget';
        widget.innerHTML = `
            <!-- Floating toggle button -->
            <button type="button" id="btnToggleAiMentor" class="ai-mentor-toggle-btn" title="Hỏi Trợ lý AI C++ (ChatGPT)" aria-label="Mở Trợ lý AI">
                <span class="ai-icon-bubble">🤖</span>
                <span class="ai-toggle-text">AI Trợ lý</span>
                <span class="ai-pulse-dot"></span>
            </button>

            <!-- Chat Drawer Panel -->
            <aside id="aiMentorPanel" class="ai-mentor-panel" hidden>
                <div class="ai-mentor-header">
                    <div class="ai-mentor-brand">
                        <div class="ai-avatar-circle">🤖</div>
                        <div>
                            <div style="display: flex; align-items: center; gap: 6px;">
                                <strong>CodeLearn AI</strong>
                                <span style="font-size: 0.68rem; background: rgba(16, 185, 129, 0.15); color: #059669; padding: 1px 6px; border-radius: 999px; font-weight: 700;">ChatGPT Mode</span>
                            </div>
                            <span style="font-size: 0.75rem; color: var(--text-muted, #64748b);">Trợ giảng C++ thông minh 24/7</span>
                        </div>
                    </div>
                    <div style="display: flex; align-items: center; gap: 4px;">
                        <button type="button" id="btnResetAiMentor" class="ai-reset-btn" title="Làm mới hội thoại" aria-label="Làm mới hội thoại">🔄</button>
                        <button type="button" id="btnCloseAiMentor" class="ai-close-btn" aria-label="Đóng Trợ lý AI">✕</button>
                    </div>
                </div>

                <div class="ai-mentor-body" id="aiMentorMessages">
                    <div class="ai-msg ai-msg-bot">
                        👋 Chào bạn! Mình là <strong>CodeLearn AI (ChatGPT C++ Tutor)</strong>.<br>
                        Mình có thể trả lời mọi câu hỏi về C++, cấu trúc dữ liệu, thuật toán, phân tích code và gợi ý cách học hiệu quả như ChatGPT. Hãy hỏi mình bất kỳ điều gì nhé!
                    </div>
                </div>

                <!-- Quick prompt chips -->
                <div class="ai-quick-chips">
                    <button type="button" class="ai-chip" data-prompt="Giải thích lập trình hướng đối tượng OOP trong C++ là gì?">🏛️ Giải thích OOP</button>
                    <button type="button" class="ai-chip" data-prompt="Con trỏ thông minh unique_ptr và shared_ptr khác nhau thế nào?">🧠 Con trỏ thông minh</button>
                    <button type="button" class="ai-chip" data-prompt="Sự khác nhau giữa struct và class trong C++?">⚖️ Struct vs Class</button>
                    <button type="button" class="ai-chip" data-prompt="Giải thích thuật toán sắp xếp nhanh QuickSort">⚡ Thuật toán QuickSort</button>
                    <button type="button" class="ai-chip" data-prompt="Viết code C++ kiểm tra số nguyên tố tối ưu">📝 Code số nguyên tố</button>
                    <button type="button" class="ai-chip" data-prompt="Lỗi Segmentation fault là gì và cách phòng ngừa?">💥 Sửa lỗi Segfault</button>
                </div>

                <form id="aiMentorForm" class="ai-mentor-input-row">
                    <input type="text" id="aiMentorInput" placeholder="Hỏi AI về bất kỳ điều gì trong C++..." autocomplete="off">
                    <button type="submit" id="btnSendAiMentor" class="btn btn-primary" title="Gửi câu hỏi">Gửi</button>
                </form>
            </aside>
        `;
        document.body.appendChild(widget);

        // Bind events
        const toggleBtn = widget.querySelector("#btnToggleAiMentor");
        const closeBtn = widget.querySelector("#btnCloseAiMentor");
        const resetBtn = widget.querySelector("#btnResetAiMentor");
        const panel = widget.querySelector("#aiMentorPanel");
        const form = widget.querySelector("#aiMentorForm");
        const input = widget.querySelector("#aiMentorInput");
        const msgContainer = widget.querySelector("#aiMentorMessages");
        const chips = widget.querySelectorAll(".ai-chip");

        let chatHistory = [];

        function openPanel() {
            panel.hidden = false;
            if (input) input.focus();
        }

        function closePanel() {
            panel.hidden = true;
        }

        if (toggleBtn) {
            toggleBtn.addEventListener("click", () => {
                if (panel.hidden) openPanel();
                else closePanel();
            });
        }

        if (closeBtn) closeBtn.addEventListener("click", closePanel);

        if (resetBtn) {
            resetBtn.addEventListener("click", () => {
                chatHistory = [];
                if (msgContainer) {
                    msgContainer.innerHTML = `
                        <div class="ai-msg ai-msg-bot">
                            👋 Cuộc trò chuyện đã được làm mới! Hãy hỏi mình bất kỳ câu hỏi nào về C++ hoặc thuật toán nhé!
                        </div>
                    `;
                }
            });
        }

        function escapeHtml(text) {
            if (!text) return "";
            return String(text)
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;")
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#039;");
        }

        function formatMarkdown(str) {
            if (!str) return "";
            let formatted = escapeHtml(str);

            // Code blocks
            formatted = formatted.replace(/```(?:([a-zA-Z0-9_\-+]+))?\n([\s\S]*?)```/g, (match, lang, code) => {
                const langName = (lang || "cpp").toUpperCase();
                const rawClean = code.trim();
                return `
                    <div class="ai-code-wrapper">
                        <div class="ai-code-header">
                            <span>${langName}</span>
                            <div class="ai-code-actions">
                                <button type="button" class="ai-code-btn btn-copy-code" data-code="${encodeURIComponent(rawClean)}">
                                    📋 Sao chép
                                </button>
                            </div>
                        </div>
                        <pre><code>${rawClean}</code></pre>
                    </div>
                `;
            });

            // Headers
            formatted = formatted.replace(/^#### (.*$)/gim, '<h5 style="margin: 8px 0 4px 0; font-size: 0.95rem; font-weight: 700;">$1</h5>');
            formatted = formatted.replace(/^### (.*$)/gim, '<h4 style="margin: 10px 0 6px 0; font-size: 1.05rem; font-weight: 800; color: var(--primary, #847de8);">$1</h4>');

            // Markdown Tables
            formatted = formatted.replace(/((?:\|[^\n]+\|\r?\n?)+)/g, (match) => {
                const lines = match.trim().split("\n").filter(l => l.trim().length > 0);
                if (lines.length < 2) return match;
                let html = '<div style="overflow-x: auto; margin: 8px 0;"><table class="ai-chat-table">';
                lines.forEach((line, idx) => {
                    if (line.includes("---")) return;
                    const cells = line.split("|").slice(1, -1).map(c => c.trim());
                    if (idx === 0) {
                        html += '<thead><tr>' + cells.map(c => `<th>${c}</th>`).join('') + '</tr></thead><tbody>';
                    } else {
                        html += '<tr>' + cells.map(c => `<td>${c}</td>`).join('') + '</tr>';
                    }
                });
                html += '</tbody></table></div>';
                return html;
            });

            // Inline code
            formatted = formatted.replace(/`([^`]+)`/g, '<code style="background: rgba(0,0,0,0.06); padding: 2px 6px; border-radius: 4px; font-family: monospace;">$1</code>');
            // Bold
            formatted = formatted.replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>');
            // Lists
            formatted = formatted.replace(/\n- /g, '<br>• ');
            formatted = formatted.replace(/\n\d+\. /g, (m) => `<br><strong>${m.trim()}</strong> `);
            // Newlines
            formatted = formatted.replace(/\n/g, '<br>');

            return formatted;
        }

        function appendMessage(text, isUser = false) {
            if (!msgContainer) return;
            const bubble = document.createElement("div");
            bubble.className = `ai-msg ${isUser ? "ai-msg-user" : "ai-msg-bot"}`;
            
            if (!isUser) {
                bubble.innerHTML = formatMarkdown(text);
                // Bind copy button
                bubble.querySelectorAll(".btn-copy-code").forEach(btn => {
                    btn.addEventListener("click", () => {
                        const raw = decodeURIComponent(btn.getAttribute("data-code") || "");
                        if (navigator.clipboard) {
                            navigator.clipboard.writeText(raw).then(() => {
                                const oldText = btn.innerHTML;
                                btn.innerHTML = "✓ Đã chép!";
                                btn.style.color = "#10b981";
                                setTimeout(() => {
                                    btn.innerHTML = oldText;
                                    btn.style.color = "";
                                }, 2000);
                            });
                        }
                    });
                });
            } else {
                bubble.textContent = text;
            }

            msgContainer.appendChild(bubble);
            msgContainer.scrollTop = msgContainer.scrollHeight;
            return bubble;
        }

        async function sendPrompt(userMsg) {
            if (!userMsg || !userMsg.trim()) return;

            appendMessage(userMsg, true);
            if (input) input.value = "";

            chatHistory.push({ role: "user", content: userMsg });

            const typingElem = appendMessage("🤖 *AI đang suy nghĩ và tổng hợp kiến thức...*", false);

            try {
                if (window.CodeLearnApi && typeof CodeLearnApi.ai?.ask === "function") {
                    const res = await CodeLearnApi.ai.ask(userMsg, "", "", chatHistory);
                    if (typingElem) typingElem.remove();
                    const replyText = res.reply || "AI chưa có phản hồi phù hợp, bạn hãy thử diễn đạt lại nhé.";
                    appendMessage(replyText);
                    chatHistory.push({ role: "assistant", content: replyText });
                } else {
                    if (typingElem) typingElem.remove();
                    appendMessage("💡 Hãy đặt câu hỏi về các chuyên đề C++ hoặc cấu trúc dữ liệu nhé!");
                }
            } catch (err) {
                if (typingElem) typingElem.remove();
                appendMessage(`⚠️ Không thể kết nối với AI Trợ lý: ${err.message || "Lỗi mạng"}`);
            }
        }

        if (form) {
            form.addEventListener("submit", (e) => {
                e.preventDefault();
                const val = input ? input.value : "";
                sendPrompt(val);
            });
        }

        chips.forEach(chip => {
            chip.addEventListener("click", () => {
                const prompt = chip.getAttribute("data-prompt") || chip.textContent;
                openPanel();
                sendPrompt(prompt);
            });
        });
    }
})();
