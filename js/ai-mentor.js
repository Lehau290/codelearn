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
                        <button type="button" id="btnAiSettings" class="ai-reset-btn" title="Cài đặt AI & API Key" aria-label="Cài đặt AI">⚙️</button>
                        <button type="button" id="btnResetAiMentor" class="ai-reset-btn" title="Làm mới hội thoại" aria-label="Làm mới hội thoại">🔄</button>
                        <button type="button" id="btnCloseAiMentor" class="ai-close-btn" aria-label="Đóng Trợ lý AI">✕</button>
                    </div>
                </div>

                <!-- Persona / Role Selector -->
                <div class="ai-persona-bar">
                    <span style="color: var(--text-muted); font-size: 0.73rem;">🎭 Vai trò AI:</span>
                    <select id="aiPersonaSelect" class="ai-persona-select" title="Chọn phong cách phản hồi của AI">
                        <option value="tutor" selected>🧑‍🏫 Gia sư kiên nhẫn</option>
                        <option value="interviewer">💼 Phỏng vấn FAANG</option>
                        <option value="professor">🎓 Giáo sư Đại học</option>
                    </select>
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
                    <div class="ai-input-tools">
                        <button type="button" id="btnAiVoice" class="ai-tool-btn" title="Nhập liệu bằng giọng nói" aria-label="Nói vào micro">🎙️</button>
                    </div>
                    <input type="text" id="aiMentorInput" placeholder="Hỏi AI về bất kỳ điều gì trong C++..." autocomplete="off">
                    <button type="submit" id="btnSendAiMentor" class="btn btn-primary" title="Gửi câu hỏi">Gửi</button>
                </form>
            </aside>

            <!-- AI API Settings Modal -->
            <div id="aiSettingsModal" class="ai-settings-modal" hidden>
                <div class="ai-settings-dialog">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                        <h3 style="margin: 0; font-size: 1.15rem; font-weight: 700;">⚙️ Cấu hình Bộ não AI</h3>
                        <button type="button" id="btnCloseAiSettings" style="background: none; border: none; font-size: 1.2rem; cursor: pointer; color: var(--text-muted);">✕</button>
                    </div>
                    <p style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 14px; line-height: 1.5;">
                        Mặc định hệ thống dùng <strong>CodeLearn Neural Tutor</strong> (miễn phí, không cần cấu hình). Bạn có thể tích hợp API Key riêng của Gemini hoặc OpenAI để đạt độ thông minh cao nhất.
                    </p>
                    <div style="display: flex; flex-direction: column; gap: 12px; margin-bottom: 18px;">
                        <div>
                            <label style="display: block; font-size: 0.8rem; font-weight: 600; margin-bottom: 4px;">Google Gemini API Key (Khuyên dùng):</label>
                            <input type="password" id="inputGeminiKey" placeholder="AIzaSy..." style="width: 100%; padding: 8px 12px; border-radius: 8px; border: 1px solid var(--border, #cbd5e1); font-family: monospace; font-size: 0.82rem; background: transparent; color: inherit;">
                            <span style="font-size: 0.72rem; color: var(--text-muted);">Lấy key miễn phí tại <a href="https://aistudio.google.com/app/apikey" target="_blank" style="color: var(--primary);">aistudio.google.com</a></span>
                        </div>
                        <div>
                            <label style="display: block; font-size: 0.8rem; font-weight: 600; margin-bottom: 4px;">OpenAI API Key (Tùy chọn):</label>
                            <input type="password" id="inputOpenAiKey" placeholder="sk-..." style="width: 100%; padding: 8px 12px; border-radius: 8px; border: 1px solid var(--border, #cbd5e1); font-family: monospace; font-size: 0.82rem; background: transparent; color: inherit;">
                        </div>
                    </div>
                    <div style="display: flex; justify-content: flex-end; gap: 8px;">
                        <button type="button" id="btnCancelAiSettings" class="btn btn-outline" style="padding: 7px 14px; font-size: 0.85rem;">Hủy</button>
                        <button type="button" id="btnSaveAiSettings" class="btn btn-primary" style="padding: 7px 16px; font-size: 0.85rem;">Lưu Cấu hình</button>
                    </div>
                </div>
            </div>
        `;
        document.body.appendChild(widget);

        // Bind events
        const toggleBtn = widget.querySelector("#btnToggleAiMentor");
        const closeBtn = widget.querySelector("#btnCloseAiMentor");
        const resetBtn = widget.querySelector("#btnResetAiMentor");
        const settingsBtn = widget.querySelector("#btnAiSettings");
        const panel = widget.querySelector("#aiMentorPanel");
        const form = widget.querySelector("#aiMentorForm");
        const input = widget.querySelector("#aiMentorInput");
        const msgContainer = widget.querySelector("#aiMentorMessages");
        const chips = widget.querySelectorAll(".ai-chip");
        const personaSelect = widget.querySelector("#aiPersonaSelect");
        const voiceBtn = widget.querySelector("#btnAiVoice");

        // Settings modal
        const settingsModal = widget.querySelector("#aiSettingsModal");
        const closeSettingsBtn = widget.querySelector("#btnCloseAiSettings");
        const cancelSettingsBtn = widget.querySelector("#btnCancelAiSettings");
        const saveSettingsBtn = widget.querySelector("#btnSaveAiSettings");
        const inputGeminiKey = widget.querySelector("#inputGeminiKey");
        const inputOpenAiKey = widget.querySelector("#inputOpenAiKey");

        let chatHistory = [];
        let lastUserQuery = "";
        let recognition = null;
        let isListening = false;

        // Load preferred persona
        const savedPersona = localStorage.getItem("ai_preferred_persona");
        if (savedPersona && personaSelect) personaSelect.value = savedPersona;
        if (personaSelect) {
            personaSelect.addEventListener("change", () => {
                localStorage.setItem("ai_preferred_persona", personaSelect.value);
            });
        }

        // Load chat history from DB
        async function loadChatHistory() {
            if (!window.CodeLearnApi || typeof CodeLearnApi.ai?.getHistory !== "function") return;
            try {
                const res = await CodeLearnApi.ai.getHistory();
                if (res && Array.isArray(res.messages) && res.messages.length > 0) {
                    if (msgContainer) msgContainer.innerHTML = "";
                    chatHistory = [];
                    res.messages.forEach(item => {
                        const isUser = item.role === "user";
                        chatHistory.push({ role: item.role, content: item.content });
                        appendMessage(item.content, isUser, false);
                    });
                }
            } catch (e) {
                console.warn("Could not load AI chat history:", e);
            }
        }
        loadChatHistory();

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
            resetBtn.addEventListener("click", async () => {
                if (confirm("Bạn có chắc muốn xóa lịch sử trò chuyện với AI?")) {
                    chatHistory = [];
                    if (window.CodeLearnApi && typeof CodeLearnApi.ai?.clearHistory === "function") {
                        try { await CodeLearnApi.ai.clearHistory(); } catch (_) {}
                    }
                    if (msgContainer) {
                        msgContainer.innerHTML = `
                            <div class="ai-msg ai-msg-bot">
                                👋 Cuộc trò chuyện đã được làm mới! Hãy hỏi mình bất kỳ câu hỏi nào về C++ hoặc thuật toán nhé!
                            </div>
                        `;
                    }
                }
            });
        }

        // Voice recognition
        const SpeechRec = window.SpeechRecognition || window.webkitSpeechRecognition;
        if (SpeechRec && voiceBtn) {
            recognition = new SpeechRec();
            recognition.lang = "vi-VN";
            recognition.continuous = false;
            recognition.interimResults = false;

            recognition.onstart = () => {
                isListening = true;
                voiceBtn.classList.add("listening");
                voiceBtn.title = "Đang lắng nghe... Hãy nói!";
            };

            recognition.onresult = (event) => {
                const transcript = event.results[0][0].transcript;
                if (input && transcript) {
                    input.value = (input.value ? input.value + " " : "") + transcript;
                    input.focus();
                }
            };

            recognition.onerror = () => {
                isListening = false;
                voiceBtn.classList.remove("listening");
                voiceBtn.title = "Nhập liệu bằng giọng nói";
            };

            recognition.onend = () => {
                isListening = false;
                voiceBtn.classList.remove("listening");
                voiceBtn.title = "Nhập liệu bằng giọng nói";
            };

            voiceBtn.addEventListener("click", () => {
                if (!recognition) return;
                if (isListening) {
                    recognition.stop();
                } else {
                    try { recognition.start(); } catch (_) {}
                }
            });
        } else if (voiceBtn) {
            voiceBtn.title = "Trình duyệt không hỗ trợ Web Speech API";
            voiceBtn.style.opacity = "0.5";
        }

        // Settings modal
        if (settingsBtn && settingsModal) {
            settingsBtn.addEventListener("click", () => {
                settingsModal.hidden = false;
            });
            const closeSettings = () => { settingsModal.hidden = true; };
            if (closeSettingsBtn) closeSettingsBtn.addEventListener("click", closeSettings);
            if (cancelSettingsBtn) cancelSettingsBtn.addEventListener("click", closeSettings);

            if (saveSettingsBtn) {
                saveSettingsBtn.addEventListener("click", async () => {
                    const geminiKey = inputGeminiKey ? inputGeminiKey.value.trim() : "";
                    const openaiKey = inputOpenAiKey ? inputOpenAiKey.value.trim() : "";
                    try {
                        saveSettingsBtn.disabled = true;
                        saveSettingsBtn.textContent = "Đang lưu...";
                        if (window.CodeLearnApi && typeof CodeLearnApi.ai?.setConfig === "function") {
                            await CodeLearnApi.ai.setConfig({ geminiKey, openaiKey });
                        }
                        if (typeof window.showToast === "function") {
                            window.showToast("Đã lưu cấu hình AI thành công!", "success");
                        } else {
                            alert("✓ Đã lưu cấu hình AI thành công!");
                        }
                        closeSettings();
                    } catch (err) {
                        if (typeof window.showToast === "function") {
                            window.showToast("Lỗi khi lưu cấu hình: " + (err.message || "Lỗi mạng"), "error");
                        } else {
                            alert("Lỗi khi lưu cấu hình: " + (err.message || "Lỗi mạng"));
                        }
                    } finally {
                        saveSettingsBtn.disabled = false;
                        saveSettingsBtn.textContent = "Lưu Cấu hình";
                    }
                });
            }
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

        function appendMessage(text, isUser = false, addActions = true) {
            if (!msgContainer) return;
            const bubble = document.createElement("div");
            bubble.className = `ai-msg ${isUser ? "ai-msg-user" : "ai-msg-bot"}`;
            
            if (!isUser) {
                bubble.innerHTML = formatMarkdown(text);
                // Bind copy button inside code blocks
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

                if (addActions) {
                    const actionsRow = document.createElement("div");
                    actionsRow.className = "ai-msg-actions";
                    actionsRow.innerHTML = `
                        <button type="button" class="ai-msg-action-btn btn-copy-reply">📋 Sao chép</button>
                        <button type="button" class="ai-msg-action-btn btn-regenerate-reply">🔄 Tạo lại</button>
                    `;
                    actionsRow.querySelector(".btn-copy-reply").addEventListener("click", () => {
                        if (navigator.clipboard) {
                            navigator.clipboard.writeText(text).then(() => {
                                actionsRow.querySelector(".btn-copy-reply").textContent = "✓ Đã chép!";
                                setTimeout(() => { actionsRow.querySelector(".btn-copy-reply").textContent = "📋 Sao chép"; }, 2000);
                            });
                        }
                    });
                    actionsRow.querySelector(".btn-regenerate-reply").addEventListener("click", () => {
                        if (lastUserQuery) {
                            sendPrompt(lastUserQuery, true);
                        }
                    });
                    bubble.appendChild(actionsRow);
                }
            } else {
                bubble.textContent = text;
            }

            msgContainer.appendChild(bubble);
            msgContainer.scrollTop = msgContainer.scrollHeight;
            return bubble;
        }

        async function sendPrompt(userMsg, isRegenerate = false) {
            if (!userMsg || !userMsg.trim()) return;

            lastUserQuery = userMsg;

            if (!isRegenerate) {
                appendMessage(userMsg, true);
                if (input) input.value = "";
                chatHistory.push({ role: "user", content: userMsg });
            }

            const typingElem = appendMessage("🤖 *AI đang suy nghĩ và tổng hợp kiến thức...*", false, false);
            const persona = personaSelect ? personaSelect.value : "tutor";

            try {
                if (window.CodeLearnApi && typeof CodeLearnApi.ai?.ask === "function") {
                    const res = await CodeLearnApi.ai.ask(userMsg, "", "", chatHistory, persona);
                    if (typingElem) typingElem.remove();
                    const replyText = res.reply || "AI chưa có phản hồi phù hợp, bạn hãy thử diễn đạt lại nhé.";
                    appendMessage(replyText, false, true);
                    chatHistory.push({ role: "assistant", content: replyText });
                } else {
                    if (typingElem) typingElem.remove();
                    appendMessage("💡 Hãy đặt câu hỏi về các chuyên đề C++ hoặc cấu trúc dữ liệu nhé!", false, true);
                }
            } catch (err) {
                if (typingElem) typingElem.remove();
                appendMessage(`⚠️ Không thể kết nối với AI Trợ lý: ${err.message || "Lỗi mạng"}`, false, false);
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
