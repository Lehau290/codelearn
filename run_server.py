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

from backend.server import run_server, PORT

def open_browser():
    time.sleep(1.2)
    url = f"http://localhost:{PORT}/home.html"
    print(f"🌐 Đang mở trình duyệt: {url}")
    webbrowser.open(url)

if __name__ == "__main__":
    # Launch browser in a background thread
    threading.Thread(target=open_browser, daemon=True).start()
    run_server()
