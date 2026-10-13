"""
CodeLearn C++ Launcher
Run this script to start the backend server and open the web app.
Usage: python run_server.py
"""
import os
import sys
import webbrowser
import threading
import time
import urllib.request

from backend.server import run_server, PORT

def check_existing_server():
    """Kiểm tra xem máy chủ CodeLearn C++ có đang chạy ngầm sẵn trên PORT không."""
    try:
        url = f"http://localhost:{PORT}/api/health"
        req = urllib.request.Request(url, headers={"User-Agent": "CodeLearnLauncher"})
        with urllib.request.urlopen(req, timeout=1.2) as resp:
            return resp.status == 200
    except Exception:
        return False

def open_browser():
    time.sleep(1.0)
    url = f"http://localhost:{PORT}/home.html"
    print(f"🌐 Đang tự động mở trình duyệt: {url}")
    try:
        webbrowser.open(url)
    except Exception as e:
        print(f"⚠️ Không thể tự mở trình duyệt ({e}), vui lòng truy cập thủ công: {url}")

if __name__ == "__main__":
    target_url = f"http://localhost:{PORT}/home.html"
    
    # Nếu máy chủ đã đang chạy ngầm từ trước
    if check_existing_server():
        print("=" * 65, flush=True)
        print(">> CODELEARN C++ BACKEND SERVER ĐÃ ĐANG CHẠY SẴN!", flush=True)
        print("=" * 65, flush=True)
        print(f"[*] Địa chỉ website:  {target_url}", flush=True)
        print(f"[*] API & Compiler:   http://localhost:{PORT}/api/health", flush=True)
        print("=" * 65, flush=True)
        print(f"🌐 Đang mở trình duyệt tại: {target_url}...", flush=True)
        webbrowser.open(target_url)
        print("\n>> Bạn có thể truy cập website ngay trên trình duyệt.", flush=True)
        print(">> Nhấn phím Enter hoặc đóng cửa sổ này khi học xong.", flush=True)
        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            print("\n>> Đã thoát launcher.")
            sys.exit(0)

    # Nếu máy chủ chưa chạy, bật trình duyệt và khởi động máy chủ
    threading.Thread(target=open_browser, daemon=True).start()
    run_server()
