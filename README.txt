C++ BASIC ACADEMY
=================

Website học lập trình C++ cơ bản.

CẤU TRÚC DỰ ÁN
==============

cpp-basic-academy/
│
├── index.html
├── login.html
├── register.html
├── home.html
├── lessons.html
├── lesson-detail.html
├── profile.html
├── admin.html
│
├── css/
│   └── style.css
│
└── js/
    ├── storage.js
    ├── auth.js
    ├── layout.js
    ├── home.js
    ├── lessons.js
    ├── lesson-detail.js
    ├── profile.js
    └── admin.js


CÁCH CHẠY WEBSITE
==================

Cách 1: Sử dụng VS Code + Live Server
-------------------------------------

Bước 1:
Mở thư mục:

cpp-basic-academy

bằng Visual Studio Code.

Bước 2:
Cài extension "Live Server" trong VS Code.

Bước 3:
Mở file:

index.html

Bước 4:
Nhấn chuột phải vào file index.html.

Chọn:

Open with Live Server

Website sẽ được mở trên trình duyệt.


Cách 2: Mở trực tiếp bằng trình duyệt
-------------------------------------

Có thể nhấn đúp vào:

index.html

Tuy nhiên nên sử dụng Live Server để website hoạt động ổn định hơn.


CÁC TRANG TRONG WEBSITE
=======================

1. index.html
-------------
Trang khởi động.

Website sẽ kiểm tra người dùng đã đăng nhập hay chưa.

Nếu đã đăng nhập:
→ chuyển đến home.html

Nếu chưa đăng nhập:
→ chuyển đến login.html


2. login.html
-------------
Trang đăng nhập.

Có thể đăng nhập bằng:

- Username
- Email
- Password

Nếu tài khoản chưa tồn tại:
→ Chọn "Đăng ký ngay"


3. register.html
----------------
Trang đăng ký tài khoản.

Thông tin đăng ký:

- Username
- Email
- Password
- Xác nhận Password

Sau khi đăng ký:
→ tài khoản được lưu vào localStorage.


4. home.html
------------
Trang chủ.

Bao gồm:

- Lời chào người dùng
- Tiến độ học tập
- Số bài đã hoàn thành
- Số bài đang học
- Danh sách bài học
- Bài học đề xuất


5. lessons.html
---------------
Trang danh sách bài học C++.

Có:

- Tìm kiếm bài học
- Lọc theo chương
- Lọc theo trạng thái
- Tiến độ học tập
- Danh sách bài học


6. lesson-detail.html
---------------------
Trang học bài.

Mỗi bài học gồm:

- Nội dung lý thuyết
- Ví dụ C++
- Bài tập
- Code mẫu
- Khu vực nhập code
- Input
- Output
- Chạy thử
- Nộp bài
- Nhận xét
- Điểm đánh giá
- Gợi ý cải thiện

Có thể chuyển:

- Bài trước
- Bài tiếp theo


7. profile.html
---------------
Trang cá nhân.

Hiển thị:

- Avatar
- Username
- Email
- Vai trò
- Ngày tham gia
- Tiến độ học tập
- Số bài hoàn thành
- Thành tích

Có thể chỉnh sửa:

- Username
- Email


8. admin.html
-------------
Trang quản trị.

Admin có thể:

- Xem thống kê
- Xem danh sách bài học
- Tìm kiếm bài học
- Thêm bài học
- Chỉnh sửa bài học
- Xóa bài học


DỮ LIỆU WEBSITE
================

Website sử dụng localStorage của trình duyệt.

Các dữ liệu chính:

cpp_users
----------
Lưu danh sách tài khoản.


cpp_currentUser
---------------
Lưu tài khoản đang đăng nhập.


cpp_lessons
-----------
Lưu danh sách bài học.


cpp_progress
------------
Lưu tiến độ học tập.


cpp_settings
------------
Lưu các thiết lập của website.


CÁC BÀI HỌC MẶC ĐỊNH
====================

Website có sẵn 6 bài:

1. Giới thiệu về C++

2. Biến và kiểu dữ liệu

3. Nhập và xuất dữ liệu

4. Toán tử và biểu thức

5. Câu lệnh if else

6. Vòng lặp for


TÀI KHOẢN ADMIN
===============

Có thể tạo tài khoản Admin bằng cách thay đổi:

role

của tài khoản trong localStorage thành:

admin

Ví dụ dữ liệu:

{
    "username": "admin",
    "email": "admin@example.com",
    "password": "123456",
    "role": "admin"
}


LƯU Ý
=====

Đây là phiên bản FRONTEND DEMO phục vụ học tập.

Website hiện tại sử dụng localStorage để lưu dữ liệu.

Không sử dụng cách lưu mật khẩu này cho website thực tế.


CHẠY CODE C++
=============

Chức năng "Chạy code" trong phiên bản hiện tại chỉ mô phỏng kết quả.

JavaScript trên trình duyệt không trực tiếp biên dịch C++.

Nếu muốn xây dựng hệ thống thực tế cần:

Frontend
    ↓
Backend
    ↓
C++ Compiler / Sandbox
    ↓
Kết quả
    ↓
Frontend


ĐÁNH GIÁ AI
===========

Chức năng đánh giá bài làm hiện tại là mô phỏng.

Hệ thống kiểm tra một số đặc điểm trong code để tạo nhận xét.

Nếu muốn sử dụng AI thật cần kết nối:

Frontend
    ↓
Backend API
    ↓
AI API
    ↓
Kết quả đánh giá
    ↓
Frontend


BẢO MẬT
=======

Phiên bản demo KHÔNG phù hợp để triển khai production.

Không nên:

- Lưu password dạng plaintext
- Lưu thông tin người dùng quan trọng trong localStorage
- Cho phép frontend tự xác định quyền Admin
- Chạy compiler C++ trực tiếp không có sandbox


ĐỂ PHÁT TRIỂN THÀNH WEBSITE THẬT
=================================

Có thể nâng cấp:

1. Backend Node.js / PHP / Python

2. Database MySQL / PostgreSQL

3. Hệ thống đăng nhập JWT / Session

4. Mã hóa mật khẩu bằng bcrypt

5. C++ compiler sandbox

6. AI API để chấm bài

7. Hệ thống quản lý bài học

8. Hệ thống điểm

9. Hệ thống chứng chỉ

10. Bảng xếp hạng người học


TÁC GIẢ
=======

C++ Basic Academy

Website học lập trình C++ cơ bản.

Phiên bản: 1.0