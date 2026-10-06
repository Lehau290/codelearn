@echo off
chcp 65001 > nul
cd /d "%~dp0"
echo Đang chạy bộ kiểm thử hệ thống CodeLearn C++...
python -u test_runner_report.py
pause
