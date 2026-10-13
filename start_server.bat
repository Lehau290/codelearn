@echo off
chcp 65001 > nul
title CodeLearn C++ Backend Server
cd /d "%~dp0"
echo ========================================================
echo        CHẠY HỆ THỐNG CODELEARN C++ (BACKEND & WEB)
echo ========================================================
echo.

where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    python run_server.py
    goto end
)

where py >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    py run_server.py
    goto end
)

echo [LỖI] Không tìm thấy Python trên máy tính của bạn!
echo Vui lòng cài đặt Python (https://www.python.org/) và tích chọn "Add Python to PATH".
echo.

:end
pause
