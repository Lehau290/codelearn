"""
SEED COMPLETE TEST CASES FOR CODELEARN C++ ACADEMY
Cập nhật toàn diện 120 bộ test (công khai & ẩn) cho toàn bộ 60 bài tập từ bài 1 đến 20.
Bao gồm dữ liệu đầu vào stdin (cin) và kết quả mong đợi tương ứng chính xác.
"""
import sqlite3
import json

ALL_TEST_CASES = {
    # -------------------------------------------------------------
    # BÀI 1: GIỚI THIỆU C++ & CẤU TRÚC CHƯƠNG TRÌNH
    # -------------------------------------------------------------
    ("lesson-01", "ex-1"): [
        {"input": "", "output": "Hello C++ Academy!", "hidden": 0, "points": 50},
        {"input": "", "output": "Hello C++ Academy!", "hidden": 1, "points": 50}
    ],
    ("lesson-01", "ex-2"): [
        {"input": "", "output": "Ho va ten: Hoc vien CodeLearn\nKhoa hoc: Lap trinh C++ co ban\nMuc tieu: Lam chu C++ trong 30 ngay", "hidden": 0, "points": 50},
        {"input": "", "output": "Ho va ten: Hoc vien CodeLearn\nKhoa hoc: Lap trinh C++ co ban\nMuc tieu: Lam chu C++ trong 30 ngay", "hidden": 1, "points": 50}
    ],
    ("lesson-01", "ex-3"): [
        {"input": "", "output": "*****\n*****\n*****", "hidden": 0, "points": 50},
        {"input": "", "output": "*****\n*****\n*****", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 2: BIẾN, KIỂU DỮ LIỆU & HẰNG SỐ
    # -------------------------------------------------------------
    ("lesson-02", "ex-1"): [
        {"input": "", "output": "Chu vi: 31.4", "hidden": 0, "points": 50},
        {"input": "", "output": "Chu vi: 31.4", "hidden": 1, "points": 50}
    ],
    ("lesson-02", "ex-2"): [
        {"input": "", "output": "Chu vi: 38\nDien tich: 84", "hidden": 0, "points": 50},
        {"input": "", "output": "Chu vi: 38\nDien tich: 84", "hidden": 1, "points": 50}
    ],
    ("lesson-02", "ex-3"): [
        {"input": "", "output": "1 gio 1 phut 15 giay", "hidden": 0, "points": 50},
        {"input": "", "output": "1 gio 1 phut 15 giay", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 3: NHẬP XUẤT DỮ LIỆU (CIN & COUT)
    # -------------------------------------------------------------
    ("lesson-03", "ex-1"): [
        {"input": "5 10", "output": "Tong = 15", "hidden": 0, "points": 50},
        {"input": "20 30", "output": "Tong = 50", "hidden": 1, "points": 50}
    ],
    ("lesson-03", "ex-2"): [
        {"input": "10 10", "output": "Thanh toan: 110", "hidden": 0, "points": 50},
        {"input": "5 20", "output": "Thanh toan: 110", "hidden": 1, "points": 50}
    ],
    ("lesson-03", "ex-3"): [
        {"input": "8.0 9.0 8.5", "output": "Diem trung binh: 8.5", "hidden": 0, "points": 50},
        {"input": "9.0 9.0 9.0", "output": "Diem trung binh: 9", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 4: TOÁN TỬ & BIỂU THỨC LOGIC
    # -------------------------------------------------------------
    ("lesson-04", "ex-1"): [
        {"input": "4", "output": "Chan", "hidden": 0, "points": 50},
        {"input": "7", "output": "Le", "hidden": 1, "points": 50}
    ],
    ("lesson-04", "ex-2"): [
        {"input": "25", "output": "Hop le", "hidden": 0, "points": 50},
        {"input": "7", "output": "Khong hop le", "hidden": 1, "points": 50}
    ],
    ("lesson-04", "ex-3"): [
        {"input": "10 20", "output": "a = 20, b = 10", "hidden": 0, "points": 50},
        {"input": "35 45", "output": "a = 45, b = 35", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 5: CẤU TRÚC RẼ NHÁNH IF - ELSE
    # -------------------------------------------------------------
    ("lesson-05", "ex-1"): [
        {"input": "10 25", "output": "So lon nhat: 25", "hidden": 0, "points": 50},
        {"input": "80 40", "output": "So lon nhat: 80", "hidden": 1, "points": 50}
    ],
    ("lesson-05", "ex-2"): [
        {"input": "8.5", "output": "Gioi", "hidden": 0, "points": 50},
        {"input": "5.5", "output": "Trung binh", "hidden": 1, "points": 50}
    ],
    ("lesson-05", "ex-3"): [
        {"input": "3 4 5", "output": "Tam giac vuong", "hidden": 0, "points": 50},
        {"input": "5 5 5", "output": "Tam giac deu", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 6: CẤU TRÚC RẼ NHÁNH SWITCH - CASE
    # -------------------------------------------------------------
    ("lesson-06", "ex-1"): [
        {"input": "2", "output": "Thu hai", "hidden": 0, "points": 50},
        {"input": "8", "output": "Chu nhat", "hidden": 1, "points": 50}
    ],
    ("lesson-06", "ex-2"): [
        {"input": "10 5 +", "output": "Ket qua = 15", "hidden": 0, "points": 50},
        {"input": "20 4 /", "output": "Ket qua = 5", "hidden": 1, "points": 50}
    ],
    ("lesson-06", "ex-3"): [
        {"input": "1 2024", "output": "31 ngay", "hidden": 0, "points": 50},
        {"input": "2 2024", "output": "29 ngay", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 7: VÒNG LẶP FOR
    # -------------------------------------------------------------
    ("lesson-07", "ex-1"): [
        {"input": "10", "output": "Tong = 55", "hidden": 0, "points": 50},
        {"input": "5", "output": "Tong = 15", "hidden": 1, "points": 50}
    ],
    ("lesson-07", "ex-2"): [
        {"input": "5", "output": "5 x 1 = 5\n5 x 2 = 10\n5 x 3 = 15", "hidden": 0, "points": 50},
        {"input": "3", "output": "3 x 1 = 3\n3 x 2 = 6\n3 x 3 = 9", "hidden": 1, "points": 50}
    ],
    ("lesson-07", "ex-3"): [
        {"input": "5", "output": "Giai thua: 120", "hidden": 0, "points": 50},
        {"input": "4", "output": "Giai thua: 24", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 8: VÒNG LẶP WHILE & DO-WHILE
    # -------------------------------------------------------------
    ("lesson-08", "ex-1"): [
        {"input": "123", "output": "321", "hidden": 0, "points": 50},
        {"input": "987", "output": "789", "hidden": 1, "points": 50}
    ],
    ("lesson-08", "ex-2"): [
        {"input": "1234", "output": "So chu so: 4\nTong chu so: 10", "hidden": 0, "points": 50},
        {"input": "505", "output": "So chu so: 3\nTong chu so: 10", "hidden": 1, "points": 50}
    ],
    ("lesson-08", "ex-3"): [
        {"input": "12 18", "output": "UCLN = 6", "hidden": 0, "points": 50},
        {"input": "24 36", "output": "UCLN = 12", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 9: ĐIỀU KHIỂN VÒNG LẶP BREAK & CONTINUE
    # -------------------------------------------------------------
    ("lesson-09", "ex-1"): [
        {"input": "", "output": "2 4 6 8 10 12 14 16 18 20", "hidden": 0, "points": 50},
        {"input": "", "output": "2 4 6 8 10 12 14 16 18 20", "hidden": 1, "points": 50}
    ],
    ("lesson-09", "ex-2"): [
        {"input": "10", "output": "14", "hidden": 0, "points": 50},
        {"input": "21", "output": "28", "hidden": 1, "points": 50}
    ],
    ("lesson-09", "ex-3"): [
        {"input": "17", "output": "Nguyen to", "hidden": 0, "points": 50},
        {"input": "15", "output": "Hop so", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 10: HÀM & TRUYỀN THAM CHIẾU
    # -------------------------------------------------------------
    ("lesson-10", "ex-1"): [
        {"input": "2 5", "output": "32", "hidden": 0, "points": 50},
        {"input": "3 3", "output": "27", "hidden": 1, "points": 50}
    ],
    ("lesson-10", "ex-2"): [
        {"input": "16", "output": "Chinh phuong", "hidden": 0, "points": 50},
        {"input": "15", "output": "Khong chinh phuong", "hidden": 1, "points": 50}
    ],
    ("lesson-10", "ex-3"): [
        {"input": "10 20", "output": "20 10", "hidden": 0, "points": 50},
        {"input": "5 9", "output": "9 5", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 11: NẠP CHỒNG HÀM & ĐỆ QUY
    # -------------------------------------------------------------
    ("lesson-11", "ex-1"): [
        {"input": "6", "output": "8", "hidden": 0, "points": 50},
        {"input": "5", "output": "5", "hidden": 1, "points": 50}
    ],
    ("lesson-11", "ex-2"): [
        {"input": "5", "output": "120", "hidden": 0, "points": 50},
        {"input": "4", "output": "24", "hidden": 1, "points": 50}
    ],
    ("lesson-11", "ex-3"): [
        {"input": "1234", "output": "10", "hidden": 0, "points": 50},
        {"input": "55", "output": "10", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 12: MẢNG MỘT CHIỀU (1D ARRAY)
    # -------------------------------------------------------------
    ("lesson-12", "ex-1"): [
        {"input": "5\n1 2 3 4 5", "output": "15", "hidden": 0, "points": 50},
        {"input": "4\n10 20 30 40", "output": "100", "hidden": 1, "points": 50}
    ],
    ("lesson-12", "ex-2"): [
        {"input": "5\n1 2 3 4 5", "output": "2", "hidden": 0, "points": 50},
        {"input": "4\n2 4 6 8", "output": "4", "hidden": 1, "points": 50}
    ],
    ("lesson-12", "ex-3"): [
        {"input": "5\n3 7 2 9 5", "output": "9", "hidden": 0, "points": 50},
        {"input": "4\n12 45 8 20", "output": "45", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 13: CÁC THUẬT TOÁN MẢNG CƠ BẢN
    # -------------------------------------------------------------
    ("lesson-13", "ex-1"): [
        {"input": "5\n3 7 2 9 5", "output": "2", "hidden": 0, "points": 50},
        {"input": "4\n15 8 22 4", "output": "4", "hidden": 1, "points": 50}
    ],
    ("lesson-13", "ex-2"): [
        {"input": "5\n5 2 4 1 3", "output": "1 2 3 4 5", "hidden": 0, "points": 50},
        {"input": "4\n9 3 7 1", "output": "1 3 7 9", "hidden": 1, "points": 50}
    ],
    ("lesson-13", "ex-3"): [
        {"input": "4\n1 2 3 4", "output": "4 3 2 1", "hidden": 0, "points": 50},
        {"input": "3\n5 10 15", "output": "15 10 5", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 14: CHUỖI KÝ TỰ STD::STRING
    # -------------------------------------------------------------
    ("lesson-14", "ex-1"): [
        {"input": "CodeLearn", "output": "2", "hidden": 0, "points": 50},
        {"input": "HELLO", "output": "5", "hidden": 1, "points": 50}
    ],
    ("lesson-14", "ex-2"): [
        {"input": "hello", "output": "olleh", "hidden": 0, "points": 50},
        {"input": "cpp", "output": "ppc", "hidden": 1, "points": 50}
    ],
    ("lesson-14", "ex-3"): [
        {"input": "lap trinh c++", "output": "3", "hidden": 0, "points": 50},
        {"input": "xin chao", "output": "2", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 15: MẢNG HAI CHIỀU (MA TRẬN 2D)
    # -------------------------------------------------------------
    ("lesson-15", "ex-1"): [
        {"input": "2\n1 2\n3 4", "output": "10", "hidden": 0, "points": 50},
        {"input": "2\n5 5\n5 5", "output": "20", "hidden": 1, "points": 50}
    ],
    ("lesson-15", "ex-2"): [
        {"input": "2\n3 1\n4 5", "output": "8", "hidden": 0, "points": 50},
        {"input": "3\n1 0 0\n0 2 0\n0 0 3", "output": "6", "hidden": 1, "points": 50}
    ],
    ("lesson-15", "ex-3"): [
        {"input": "2\n1 9\n3 4", "output": "9", "hidden": 0, "points": 50},
        {"input": "2\n15 8\n23 11", "output": "23", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 16: CON TRỎ (POINTERS) TRONG C++
    # -------------------------------------------------------------
    ("lesson-16", "ex-1"): [
        {"input": "10", "output": "20", "hidden": 0, "points": 50},
        {"input": "7", "output": "14", "hidden": 1, "points": 50}
    ],
    ("lesson-16", "ex-2"): [
        {"input": "5 15", "output": "15 5", "hidden": 0, "points": 50},
        {"input": "100 200", "output": "200 100", "hidden": 1, "points": 50}
    ],
    ("lesson-16", "ex-3"): [
        {"input": "3\n10 20 30", "output": "60", "hidden": 0, "points": 50},
        {"input": "4\n1 2 3 4", "output": "10", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 17: CẤP PHÁT BỘ NHỚ ĐỘNG (NEW & DELETE)
    # -------------------------------------------------------------
    ("lesson-17", "ex-1"): [
        {"input": "3\n5 10 15", "output": "30", "hidden": 0, "points": 50},
        {"input": "4\n2 4 6 8", "output": "20", "hidden": 1, "points": 50}
    ],
    ("lesson-17", "ex-2"): [
        {"input": "3\n10 50 20", "output": "50", "hidden": 0, "points": 50},
        {"input": "4\n5 1 9 3", "output": "9", "hidden": 1, "points": 50}
    ],
    ("lesson-17", "ex-3"): [
        {"input": "42", "output": "42", "hidden": 0, "points": 50},
        {"input": "99", "output": "99", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 18: KIỂU DỮ LIỆU CẤU TRÚC (STRUCT)
    # -------------------------------------------------------------
    ("lesson-18", "ex-1"): [
        {"input": "3 4", "output": "3/4", "hidden": 0, "points": 50},
        {"input": "1 2", "output": "1/2", "hidden": 1, "points": 50}
    ],
    ("lesson-18", "ex-2"): [
        {"input": "3 4", "output": "25", "hidden": 0, "points": 50},
        {"input": "1 1", "output": "2", "hidden": 1, "points": 50}
    ],
    ("lesson-18", "ex-3"): [
        {"input": "An 9", "output": "Ten: An, Diem: 9", "hidden": 0, "points": 50},
        {"input": "Binh 8", "output": "Ten: Binh, Diem: 8", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 19: LỚP (CLASS) & ĐỐI TƯỢNG (OBJECT)
    # -------------------------------------------------------------
    ("lesson-19", "ex-1"): [
        {"input": "", "output": "25.12", "hidden": 0, "points": 50},
        {"input": "", "output": "25.12", "hidden": 1, "points": 50}
    ],
    ("lesson-19", "ex-2"): [
        {"input": "", "output": "15", "hidden": 0, "points": 50},
        {"input": "", "output": "15", "hidden": 1, "points": 50}
    ],
    ("lesson-19", "ex-3"): [
        {"input": "", "output": "Xin chao CodeLearn", "hidden": 0, "points": 50},
        {"input": "", "output": "Xin chao CodeLearn", "hidden": 1, "points": 50}
    ],

    # -------------------------------------------------------------
    # BÀI 20: CONSTRUCTOR, DESTRUCTOR & KẾ THỪA (OOP)
    # -------------------------------------------------------------
    ("lesson-20", "ex-1"): [
        {"input": "", "output": "Meo meo", "hidden": 0, "points": 50},
        {"input": "", "output": "Meo meo", "hidden": 1, "points": 50}
    ],
    ("lesson-20", "ex-2"): [
        {"input": "", "output": "Gau gau", "hidden": 0, "points": 50},
        {"input": "", "output": "Gau gau", "hidden": 1, "points": 50}
    ],
    ("lesson-20", "ex-3"): [
        {"input": "", "output": "Khoi tao\nHuy bo", "hidden": 0, "points": 50},
        {"input": "", "output": "Khoi tao\nHuy bo", "hidden": 1, "points": 50}
    ]
}

def seed_database():
    conn = sqlite3.connect('backend/database.db')
    cursor = conn.cursor()

    # Xóa toàn bộ test_cases cũ và cập nhật bộ test_cases mới chuẩn 100%
    cursor.execute("DELETE FROM test_cases")

    records = []
    for (lid, eid), tcs in ALL_TEST_CASES.items():
        for order_idx, tc in enumerate(tcs):
            t_id = f"tc-{lid}-{eid}-{order_idx + 1}"
            records.append((
                t_id,
                lid,
                eid,
                tc["input"],
                tc["output"],
                tc["hidden"],
                tc["points"],
                order_idx + 1
            ))
            # Cập nhật expected_output trong exercises cho khớp test case 1 (công khai)
            if order_idx == 0:
                cursor.execute("""
                    UPDATE exercises 
                    SET expected_output = ? 
                    WHERE lesson_id = ? AND id = ?
                """, (tc["output"], lid, eid))

    cursor.executemany("""
        INSERT INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """, records)

    conn.commit()
    print(f"✓ Đã nạp thành công {len(records)} test cases vào database.db.")

    cursor.execute("SELECT COUNT(*) FROM test_cases WHERE input_data != ''")
    cnt_input = cursor.fetchone()[0]
    print(f"✓ Số test cases có dữ liệu input (stdin/cin): {cnt_input}/{len(records)}")

    conn.close()

if __name__ == "__main__":
    seed_database()
