// ============================================================
// CODELEARN C++ - EXERCISES DATA (3 BÀI TẬP MỖI BÀI HỌC)
// File: js/exercises-data.js
// ============================================================

window.CppExercisesData = {
    // --------------------------------------------------------
    // Bài 1: Giới thiệu về C++ & Cấu trúc chương trình
    // --------------------------------------------------------
    "lesson-01": [
        {
            id: "ex-1",
            title: "In lời chào ra màn hình",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Viết chương trình C++ sử dụng đối tượng <code>cout</code> để in ra màn hình dòng chữ:<br><code>Hello C++ Academy!</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    // Viết code in ra màn hình tại đây

    return 0;
}`,
            expectedOutput: "Hello C++ Academy!",
            hint: "Sử dụng lệnh cout << \"Hello C++ Academy!\" << endl; bên trong hàm main().",
            testKeywords: ["cout", "hello c++ academy", "return 0", "#include"]
        },
        {
            id: "ex-2",
            title: "In danh thiếp cá nhân",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Viết chương trình C++ in ra 3 dòng thông tin giới thiệu bản thân:<br>Dòng 1: <code>Ho va ten: Hoc vien CodeLearn</code><br>Dòng 2: <code>Khoa hoc: Lap trinh C++ co ban</code><br>Dòng 3: <code>Muc tieu: Lam chu C++ trong 30 ngay</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    // In 3 dòng thông tin cá nhân bằng cout kết hợp endl

    return 0;
}`,
            expectedOutput: "Ho va ten: Hoc vien CodeLearn\nKhoa hoc: Lap trinh C++ co ban\nMuc tieu: Lam chu C++ trong 30 ngay",
            hint: "Sử dụng nhiều lệnh cout với endl hoặc \\n để ngắt dòng đúng yêu cầu.",
            testKeywords: ["cout", "ho va ten", "khoa hoc", "muc tieu", "endl"]
        },
        {
            id: "ex-3",
            title: "Vẽ hình chữ nhật bằng dấu sao",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Viết chương trình C++ in ra một hình chữ nhật có kích thước 3 dòng, mỗi dòng chứa đúng 5 dấu sao:<br><code>*****</code><br><code>*****</code><br><code>*****</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    // In hình chữ nhật 3x5 bằng ký tự *

    return 0;
}`,
            expectedOutput: "*****\n*****\n*****",
            hint: "In ra 3 dòng, mỗi dòng là chuỗi \"*****\" kèm endl.",
            testKeywords: ["cout", "*****", "endl"]
        }
    ],

    // --------------------------------------------------------
    // Bài 2: Biến, Kiểu dữ liệu & Hằng số
    // --------------------------------------------------------
    "lesson-02": [
        {
            id: "ex-1",
            title: "Tính chu vi hình tròn",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Khai báo hằng số <code>const double PI = 3.14;</code> và biến bán kính <code>double r = 5.0;</code>. Tính chu vi hình tròn (C = 2 * PI * r) và in ra màn hình theo định dạng: <code>Chu vi: [gia tri]</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    const double PI = 3.14;
    double r = 5.0;

    // Tính chu vi và in kết quả

    return 0;
}`,
            expectedOutput: "Chu vi: 31.4",
            hint: "Dùng công thức chuVi = 2 * PI * r; và in ra cout << \"Chu vi: \" << chuVi;",
            testKeywords: ["const", "pi", "double", "chu vi", "cout"]
        },
        {
            id: "ex-2",
            title: "Tính diện tích hình chữ nhật",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Khai báo chiều dài <code>int dai = 12;</code> và chiều rộng <code>int rong = 7;</code>. Tính chu vi P và diện tích S của hình chữ nhật, sau đó in ra màn hình:<br>Dòng 1: <code>Chu vi: [P]</code><br>Dòng 2: <code>Dien tich: [S]</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int dai = 12;
    int rong = 7;

    // Tính chu vi và diện tích rồi in ra

    return 0;
}`,
            expectedOutput: "Chu vi: 38\nDien tich: 84",
            hint: "Chu vi = (dai + rong) * 2; Diện tích = dai * rong;",
            testKeywords: ["dai", "rong", "chu vi", "dien tich", "cout"]
        },
        {
            id: "ex-3",
            title: "Quy đổi giây sang giờ, phút, giây",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Khai báo biến tổng số giây <code>int totalSeconds = 3675;</code>. Sử dụng các phép toán số học chia lấy nguyên và chia lấy dư để quy đổi ra số giờ, phút, giây và in ra dạng:<br><code>1 gio 1 phut 15 giay</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int totalSeconds = 3675;

    // Tính gio, phut, giay và in ra màn hình

    return 0;
}`,
            expectedOutput: "1 gio 1 phut 15 giay",
            hint: "gio = totalSeconds / 3600; phut = (totalSeconds % 3600) / 60; giay = totalSeconds % 60;",
            testKeywords: ["totalseconds", "gio", "phut", "giay", "%"]
        }
    ],

    // --------------------------------------------------------
    // Bài 3: Nhập & Xuất dữ liệu với cin, cout
    // --------------------------------------------------------
    "lesson-03": [
        {
            id: "ex-1",
            title: "Tính tổng 2 số từ bàn phím",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Nhập vào 2 số nguyên <code>a</code> và <code>b</code> từ bàn phím bằng <code>cin</code>. In ra tổng của chúng theo định dạng:<br><code>Tong = [gia tri]</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và in Tong = a + b

    return 0;
}`,
            expectedOutput: "Tong = 15",
            hint: "Sử dụng cin >> a >> b; sau đó cout << \"Tong = \" << (a + b) << endl;",
            testKeywords: ["cin", "cout", "tong", "a", "b"]
        },
        {
            id: "ex-2",
            title: "Tính tiền mua hàng có thuế VAT",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Nhập vào số lượng mua <code>int sl;</code> và đơn giá <code>double donGia;</code>. Tính tổng tiền trước thuế (tienGoc = sl * donGia) và tổng thanh toán khi cộng thêm thuế VAT 10% (tongTien = tienGoc * 1.1). In ra:<br><code>Thanh toan: [tongTien]</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int sl;
    double donGia;
    // Nhập sl và donGia, tính tiền kèm VAT 10%

    return 0;
}`,
            expectedOutput: "Thanh toan: 110",
            hint: "Nhập cin >> sl >> donGia; tính tongTien = sl * donGia * 1.1; và in ra.",
            testKeywords: ["cin", "cout", "thanh toan", "dongia", "sl"]
        },
        {
            id: "ex-3",
            title: "Tính điểm trung bình 3 môn",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Nhập vào 3 số thực điểm Toán, Văn, Anh từ bàn phím. Tính điểm trung bình cộng của 3 môn và in ra theo định dạng:<br><code>Diem trung binh: [gia tri]</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    double toan, van, anh;
    // Nhập điểm 3 môn và tính trung bình cộng

    return 0;
}`,
            expectedOutput: "Diem trung binh: 8.5",
            hint: "Dùng kiểu double cho toan, van, anh và tính dtb = (toan + van + anh) / 3.0;",
            testKeywords: ["cin", "cout", "diem trung binh", "toan", "van", "anh"]
        }
    ],

    // --------------------------------------------------------
    // Bài 4: Các toán tử trong C++
    // --------------------------------------------------------
    "lesson-04": [
        {
            id: "ex-1",
            title: "Kiểm tra số chẵn lẻ bằng toán tử dư",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Nhập vào số nguyên <code>n</code>. Sử dụng toán tử chia lấy phần dư <code>%</code> để kiểm tra. Nếu n chẵn in ra <code>Chan</code>, nếu lẻ in ra <code>Le</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và kiểm tra chẵn/lẻ bằng toán tử %

    return 0;
}`,
            expectedOutput: "Chan",
            hint: "Dùng điều kiện n % 2 == 0 để kiểm tra chẵn lẻ.",
            testKeywords: ["%", "cin", "cout", "chan", "le"]
        },
        {
            id: "ex-2",
            title: "Kiểm tra khoảng giá trị và chia hết",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Nhập vào số nguyên <code>x</code>. Dùng toán tử logic <code>&&</code> để kiểm tra xem x có nằm trong đoạn [10, 100] VÀ đồng thời chia hết cho 5 hay không. Nếu thỏa mãn in <code>Hop le</code>, ngược lại in <code>Khong hop le</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int x;
    // Nhập x và kiểm tra bằng toán tử && và %

    return 0;
}`,
            expectedOutput: "Hop le",
            hint: "Biểu thức: (x >= 10 && x <= 100 && x % 5 == 0)",
            testKeywords: ["&&", "%", "cin", "hop le", "khong hop le"]
        },
        {
            id: "ex-3",
            title: "Hoán vị 2 số không dùng biến trung gian",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Nhập vào 2 số nguyên <code>a</code> và <code>b</code>. Chỉ sử dụng các phép toán số học cộng (+) và trừ (-) để đổi chỗ giá trị của a và b (không khai báo thêm biến thứ 3), sau đó in ra dạng:<br><code>a = [gia tri], b = [gia tri]</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và hoán vị bằng toán tử + -

    return 0;
}`,
            expectedOutput: "a = 20, b = 10",
            hint: "Cách làm: a = a + b; b = a - b; a = a - b;",
            testKeywords: ["cin", "cout", "a =", "b ="]
        }
    ],

    // --------------------------------------------------------
    // Bài 5: Cấu trúc điều kiện if, else if, else
    // --------------------------------------------------------
    "lesson-05": [
        {
            id: "ex-1",
            title: "Tìm số lớn nhất trong 2 số",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Nhập vào 2 số nguyên <code>a</code> và <code>b</code>. Dùng cấu trúc <code>if - else</code> để tìm và in ra số lớn hơn.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và dùng if-else tìm số lớn hơn

    return 0;
}`,
            expectedOutput: "So lon nhat: 25",
            hint: "if (a > b) cout << \"So lon nhat: \" << a; else cout << \"So lon nhat: \" << b;",
            testKeywords: ["if", "else", "cin", "cout"]
        },
        {
            id: "ex-2",
            title: "Xếp loại học lực học sinh",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Nhập điểm trung bình <code>dtb</code> (thang 10). Sử dụng <code>if - else if - else</code> để xếp loại:<br>• dtb >= 8.0: in <code>Gioi</code><br>• dtb >= 6.5: in <code>Kha</code><br>• dtb >= 5.0: in <code>Trung binh</code><br>• còn lại: in <code>Yeu</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    double dtb;
    // Nhập dtb và xếp loại học lực

    return 0;
}`,
            expectedOutput: "Gioi",
            hint: "Sắp xếp thứ tự kiểm tra từ cao xuống thấp: >= 8.0 -> >= 6.5 -> >= 5.0 -> else.",
            testKeywords: ["if", "else if", "gioi", "kha", "trung binh", "yeu"]
        },
        {
            id: "ex-3",
            title: "Kiểm tra và phân loại tam giác",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Nhập 3 cạnh <code>a, b, c</code> của tam giác (số nguyên dương). Kiểm tra xem có tạo thành tam giác hợp lệ không (tổng 2 cạnh bất kỳ lớn hơn cạnh còn lại). Nếu hợp lệ: in <code>Tam giac deu</code> nếu 3 cạnh bằng nhau, <code>Tam giac vuong</code> nếu thỏa định lý Pytago, hoặc <code>Tam giac thuong</code>. Nếu không hợp lệ in <code>Khong phai tam giac</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int a, b, c;
    // Nhập a, b, c và phân loại tam giác

    return 0;
}`,
            expectedOutput: "Tam giac vuong",
            hint: "Điều kiện tam giác: a+b>c && a+c>b && b+c>a. Vuông: a*a + b*b == c*c (hoặc các hoán vị).",
            testKeywords: ["if", "else", "tam giac", "cin", "cout"]
        }
    ],

    // --------------------------------------------------------
    // Bài 6: Cấu trúc rẽ nhánh switch - case
    // --------------------------------------------------------
    "lesson-06": [
        {
            id: "ex-1",
            title: "Đọc thứ trong tuần",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Nhập vào số nguyên từ 2 đến 8. Sử dụng <code>switch - case</code> để in ra: 2: <code>Thu hai</code>, 3: <code>Thu ba</code>, ..., 8: <code>Chu nhat</code>. Nếu ngoài phạm vi in <code>Khong hop le</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int day;
    // Nhập day và dùng switch-case để in thứ

    return 0;
}`,
            expectedOutput: "Thu hai",
            hint: "Dùng switch(day) với các case 2, 3, 4, 5, 6, 7, 8 và default.",
            testKeywords: ["switch", "case", "break", "thu hai", "chu nhat"]
        },
        {
            id: "ex-2",
            title: "Máy tính đơn giản 4 phép toán",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Nhập vào 2 số thực <code>a, b</code> và 1 ký tự phép toán <code>char op;</code> (+, -, *, /). Dùng <code>switch(op)</code> để tính và in kết quả theo dạng <code>Ket qua = [gia tri]</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    double a, b;
    char op;
    // Nhập a, op, b và dùng switch tính kết quả

    return 0;
}`,
            expectedOutput: "Ket qua = 15",
            hint: "Nhập cin >> a >> op >> b; dùng switch(op) cho '+', '-', '*', '/'.",
            testKeywords: ["switch", "case", "op", "ket qua", "break"]
        },
        {
            id: "ex-3",
            title: "Đếm số ngày trong tháng",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Nhập vào tháng <code>m</code> (1-12) và năm <code>y</code>. Dùng <code>switch(m)</code> để in ra số ngày trong tháng. Tháng 1, 3, 5, 7, 8, 10, 12 có 31 ngày; tháng 4, 6, 9, 11 có 30 ngày; tháng 2 có 29 ngày nếu năm nhuận hoặc 28 ngày nếu năm không nhuận.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int m, y;
    // Nhập m, y và in ra số ngày của tháng

    return 0;
}`,
            expectedOutput: "31 ngay",
            hint: "Gộp các case có cùng số ngày lại với nhau. Tháng 2 kiểm tra (y % 400 == 0 || (y % 4 == 0 && y % 100 != 0)).",
            testKeywords: ["switch", "case", "break", "ngay", "cin"]
        }
    ],

    // --------------------------------------------------------
    // Bài 7: Vòng lặp for cơ bản & nâng cao
    // --------------------------------------------------------
    "lesson-07": [
        {
            id: "ex-1",
            title: "Tính tổng dãy số 1 đến N",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Nhập vào số nguyên dương <code>n</code>. Dùng vòng lặp <code>for</code> để tính tổng <code>S = 1 + 2 + ... + n</code> và in ra dạng <code>Tong = [S]</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng vòng lặp for tính tổng S

    return 0;
}`,
            expectedOutput: "Tong = 55",
            hint: "Khởi tạo int sum = 0; chạy for (int i = 1; i <= n; i++) sum += i;",
            testKeywords: ["for", "cin", "cout", "tong ="]
        },
        {
            id: "ex-2",
            title: "In bảng cửu chương của số K",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Nhập vào số nguyên <code>k</code> (1 <= k <= 9). Dùng vòng lặp <code>for</code> in ra bảng cửu chương của k từ 1 đến 10 theo định dạng mỗi dòng:<br><code>k x i = [k * i]</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int k;
    // Nhập k và in bảng nhân từ 1 đến 10

    return 0;
}`,
            expectedOutput: "5 x 1 = 5\n5 x 2 = 10\n5 x 3 = 15",
            hint: "Chạy vòng lặp for (int i = 1; i <= 10; i++) và in cout << k << \" x \" << i << \" = \" << k * i << endl;",
            testKeywords: ["for", "cin", "cout", "x", "="]
        },
        {
            id: "ex-3",
            title: "Tính giai thừa N!",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Nhập vào số nguyên dương <code>n</code> (1 <= n <= 15). Dùng kiểu <code>long long</code> và vòng lặp <code>for</code> để tính <code>n! = 1 * 2 * ... * n</code> và in ra: <code>Giai thua: [kq]</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và tính n! bằng vòng lặp for

    return 0;
}`,
            expectedOutput: "Giai thua: 120",
            hint: "Khởi tạo long long fact = 1; for (int i = 1; i <= n; i++) fact *= i;",
            testKeywords: ["for", "long long", "giai thua", "cin", "cout"]
        }
    ],

    // --------------------------------------------------------
    // Bài 8: Vòng lặp while và do-while
    // --------------------------------------------------------
    "lesson-08": [
        {
            id: "ex-1",
            title: "Đảo ngược số nguyên dương",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Nhập vào số nguyên dương <code>n</code>. Sử dụng vòng lặp <code>while</code> để in ra các chữ số của n theo thứ tự đảo ngược (ví dụ n = 123 in ra <code>321</code>).",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng while in đảo ngược

    return 0;
}`,
            expectedOutput: "321",
            hint: "while (n > 0) { cout << n % 10; n /= 10; }",
            testKeywords: ["while", "%", "/", "cin", "cout"]
        },
        {
            id: "ex-2",
            title: "Đếm số chữ số và tính tổng các chữ số",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Nhập số nguyên dương <code>n</code>. Dùng vòng lặp <code>while</code> đếm xem n có bao nhiêu chữ số và tổng các chữ số của n là bao nhiêu. In ra:<br><code>So chu so: [count]</code><br><code>Tong chu so: [sum]</code>",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và tính số chữ số và tổng các chữ số

    return 0;
}`,
            expectedOutput: "So chu so: 4\nTong chu so: 10",
            hint: "Khởi tạo count = 0, sum = 0; while (n > 0) { sum += n % 10; count++; n /= 10; }",
            testKeywords: ["while", "so chu so", "tong chu so", "%", "/"]
        },
        {
            id: "ex-3",
            title: "Tìm ước chung lớn nhất (UCLN)",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Nhập vào 2 số nguyên dương <code>a</code> và <code>b</code>. Sử dụng thuật toán Euclid với vòng lặp <code>while</code> để tìm và in ra: <code>UCLN = [gia tri]</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và tìm UCLN bằng thuật toán Euclid

    return 0;
}`,
            expectedOutput: "UCLN = 6",
            hint: "while (b != 0) { int r = a % b; a = b; b = r; } UCLN chính là a.",
            testKeywords: ["while", "ucln", "%", "cin", "cout"]
        }
    ],

    // --------------------------------------------------------
    // Bài 9: Lệnh điều khiển break & continue
    // --------------------------------------------------------
    "lesson-09": [
        {
            id: "ex-1",
            title: "In các số chẵn dùng lệnh continue",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Duyệt vòng lặp for từ 1 đến 20. Nếu gặp số lẻ, hãy dùng lệnh <code>continue</code> để bỏ qua. Chỉ in ra các số chẵn cách nhau bởi dấu cách.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    // Duyệt từ 1 đến 20, dùng continue bỏ qua số lẻ

    return 0;
}`,
            expectedOutput: "2 4 6 8 10 12 14 16 18 20",
            hint: "if (i % 2 != 0) continue; cout << i << \" \";",
            testKeywords: ["for", "continue", "cout", "%"]
        },
        {
            id: "ex-2",
            title: "Tìm số đầu tiên chia hết cho 7",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Nhập số nguyên <code>n</code>. Bắt đầu từ <code>n + 1</code>, duyệt các số tăng dần. Khi tìm được số đầu tiên chia hết cho 7, in số đó ra và dùng lệnh <code>break</code> để thoát ngay khỏi vòng lặp.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng break khi tìm thấy số chia hết cho 7

    return 0;
}`,
            expectedOutput: "14",
            hint: "while (true) { n++; if (n % 7 == 0) { cout << n; break; } }",
            testKeywords: ["break", "% 7", "cout", "cin"]
        },
        {
            id: "ex-3",
            title: "Kiểm tra số nguyên tố tối ưu với break",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Nhập số nguyên dương <code>n</code> (n > 1). Dùng vòng lặp kiểm tra từ 2 đến căn bậc hai của n (hoặc n/2). Nếu gặp bất kỳ ước số nào, đặt cờ hiệu và dùng <code>break</code> để dừng. In ra <code>Nguyen to</code> hoặc <code>Hop so</code>.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và kiểm tra số nguyên tố dùng break

    return 0;
}`,
            expectedOutput: "Nguyen to",
            hint: "bool isPrime = true; for (int i = 2; i * i <= n; i++) { if (n % i == 0) { isPrime = false; break; } }",
            testKeywords: ["break", "for", "nguyen to", "hop so", "cin"]
        }
    ],

    // --------------------------------------------------------
    // Bài 10: Hàm (Functions) & Truyền tham số
    // --------------------------------------------------------
    "lesson-10": [
        {
            id: "ex-1",
            title: "Viết hàm tính lũy thừa",
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: "Viết hàm <code>long long luyThua(int coSo, int soMu)</code> trả về giá trị coSo mũ soMu. Trong hàm <code>main()</code>, nhập <code>a, b</code> và gọi hàm để in kết quả.",
            starterCode: `#include <iostream>
using namespace std;

// Định nghĩa hàm luyThua tại đây

int main() {
    int a, b;
    cin >> a >> b;
    // Gọi hàm luyThua và in kết quả

    return 0;
}`,
            expectedOutput: "32",
            hint: "Duyệt vòng lặp nhân soMu lần giá trị coSo và return kết quả.",
            testKeywords: ["luythua", "long long", "return", "main"]
        },
        {
            id: "ex-2",
            title: "Hàm kiểm tra số chính phương",
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: "Viết hàm <code>bool laChinhPhuong(int n)</code> trả về <code>true</code> nếu n là số chính phương (căn bậc 2 là số nguyên), ngược lại trả về <code>false</code>. Trong <code>main()</code> nhập n và in <code>Chinh phuong</code> hoặc <code>Khong chinh phuong</code>.",
            starterCode: `#include <iostream>
#include <cmath>
using namespace std;

// Viết hàm bool laChinhPhuong(int n)

int main() {
    int n;
    cin >> n;
    // Gọi hàm và in kết luận

    return 0;
}`,
            expectedOutput: "Chinh phuong",
            hint: "int can = sqrt(n); return can * can == n;",
            testKeywords: ["bool", "lachinhphuong", "sqrt", "return"]
        },
        {
            id: "ex-3",
            title: "Hàm hoán vị sử dụng tham chiếu",
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: "Viết hàm <code>void hoanDoi(int &x, int &y)</code> sử dụng tham chiếu <code>&</code> để tráo đổi giá trị 2 biến. Trong hàm <code>main()</code>, nhập 2 số a và b, gọi hàm <code>hoanDoi(a, b);</code> rồi in kết quả a và b sau khi hoán vị.",
            starterCode: `#include <iostream>
using namespace std;

// Viết hàm void hoanDoi(int &x, int &y)

int main() {
    int a, b;
    cin >> a >> b;
    // Gọi hàm hoanDoi và in ra a, b

    return 0;
}`,
            expectedOutput: "20 10",
            hint: "Dùng toán tử tham chiếu &: void hoanDoi(int &x, int &y) { int temp = x; x = y; y = temp; }",
            testKeywords: ["&", "hoandoi", "temp", "void", "main"]
        }
    ]
};

// ------------------------------------------------------------
// HÀM LẤY 3 BÀI TẬP CHO BẤT KỲ LESSON NÀO
// ------------------------------------------------------------
window.getLessonExercises = function(lesson) {
    if (!lesson) return [];

    // 1. Kiểm tra trong kho dữ liệu bài tập
    if (window.CppExercisesData) {
        if (window.CppExercisesData[lesson.id]) {
            return window.CppExercisesData[lesson.id];
        }
        const digits = String(lesson.id || "").replace(/\D/g, "");
        if (digits) {
            const paddedKey = `lesson-${String(digits).padStart(2, "0")}`;
            if (window.CppExercisesData[paddedKey]) {
                return window.CppExercisesData[paddedKey];
            }
        }
    }

    // 2. Nếu lesson đã có sẵn mảng exercises với 3 bài
    if (Array.isArray(lesson.exercises) && lesson.exercises.length >= 3) {
        return lesson.exercises;
    }

    // 3. Fallback thông minh: Tạo 3 bài tập phù hợp theo chủ đề bài học
    const baseTitle = lesson.exerciseTitle || lesson.title || "Bài tập thực hành";
    const baseDesc = lesson.exerciseDescription || lesson.description || "Thực hành các kiến thức C++ vừa học.";
    const starter = lesson.starterCode || `#include <iostream>\nusing namespace std;\n\nint main() {\n    // Viết code của bạn ở đây\n\n    return 0;\n}`;

    return [
        {
            id: "ex-1",
            title: `${baseTitle} (Cơ bản)`,
            level: "Cơ bản",
            difficulty: "easy",
            points: 100,
            description: `${baseDesc} Hãy bắt đầu với các câu lệnh nền tảng của bài học này.`,
            starterCode: starter,
            expectedOutput: "Ket qua hop le",
            hint: "Áp dụng trực tiếp cú pháp lý thuyết đã học ở phần trên.",
            testKeywords: ["cout", "main", "return 0"]
        },
        {
            id: "ex-2",
            title: `Vận dụng logic: ${lesson.title}`,
            level: "Vận dụng",
            difficulty: "medium",
            points: 100,
            description: `Áp dụng kiến thức bài <strong>${lesson.title}</strong> để giải quyết bài toán tính toán hoặc điều kiện thực tế.`,
            starterCode: starter,
            expectedOutput: "Thanh cong",
            hint: "Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.",
            testKeywords: ["cin", "cout", "main"]
        },
        {
            id: "ex-3",
            title: `Thử thách mở rộng: ${lesson.title}`,
            level: "Thử thách",
            difficulty: "hard",
            points: 100,
            description: `Tối ưu hóa mã nguồn và xử lý các trường hợp biên nâng cao cho chuyên đề <strong>${lesson.title}</strong>.`,
            starterCode: starter,
            expectedOutput: "Chinh xac",
            hint: "Kiểm tra kỹ các trường hợp giá trị đặc biệt để đạt điểm tuyệt đối.",
            testKeywords: ["main", "return"]
        }
    ];
};

