# ========================================================
# CodeLearn C++ Academy - Dockerfile
# Môi trường chạy Web Động Full-stack (Python + G++ C++17)
# ========================================================

FROM python:3.11-slim

# Cài đặt GNU C++ Compiler (g++) và build-essential
RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép toàn bộ dự án
COPY . /app

# Thiết lập biến môi trường
ENV PORT=5000 \
    PYTHONUNBUFFERED=1

# Expose cổng kết nối
EXPOSE 5000

# Khởi chạy máy chủ Backend Web Động
CMD ["python", "run_server.py"]
