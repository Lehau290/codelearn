/* =========================================================
   CODELEARN C++
   STORAGE.JS
   Quản lý dữ liệu localStorage
   ========================================================= */

(function () {
    "use strict";

    /* =====================================================
       1. STORAGE KEYS
       ===================================================== */

    const STORAGE_KEYS = {
        USERS: "cpp_users",
        CURRENT_USER: "cpp_currentUser",
        LESSONS: "cpp_lessons",
        PROGRESS: "cpp_progress",
        SETTINGS: "cpp_settings"
    };


    /* =====================================================
       2. DEFAULT LESSONS
       ===================================================== */

    const DEFAULT_LESSONS = [
        {
            id: "lesson-01",
            title: "Giới thiệu về C++ & Cấu trúc chương trình",
            chapter: "Chương 1: Bắt đầu với C++",
            description: "Làm quen với ngôn ngữ C++, hàm main(), cấu trúc chương trình và viết chương trình đầu tiên.",
            level: "Cơ bản",
            duration: "20 phút",
            content: `
<h3>1. C++ là gì?</h3>
<p>C++ là ngôn ngữ lập trình bậc trung mạnh mẽ, được phát triển bởi Bjarne Stroustrup từ năm 1979 tại Bell Labs. C++ kết hợp cả đặc điểm của ngôn ngữ bậc thấp (thao tác trực tiếp với bộ nhớ) và ngôn ngữ bậc cao (hướng đối tượng, trừu tượng hóa).</p>
<h3>2. Cấu trúc một chương trình C++</h3>
<p>Một chương trình C++ tiêu chuẩn bao gồm:</p>
<ul>
    <li><strong>#include &lt;iostream&gt;</strong>: Chỉ thị tiền xử lý để nhúng thư viện nhập/xuất chuẩn.</li>
    <li><strong>using namespace std;</strong>: Khai báo không gian tên chuẩn, giúp sử dụng <code>cout</code>, <code>cin</code> trực tiếp.</li>
    <li><strong>int main()</strong>: Điểm bắt đầu thực thi của mọi chương trình C++.</li>
    <li><strong>return 0;</strong>: Báo hiệu chương trình kết thúc thành công.</li>
</ul>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // In ra màn hình câu chào
    cout << "Chao mung ban den voi C++ Basic Academy!" << endl;
    cout << "C++ la mot ngon ngu cuc ky manh me." << endl;
    return 0;
}`,
            exerciseTitle: "In lời chào ra màn hình",
            exerciseDescription: "Viết chương trình C++ in ra màn hình dòng chữ: Hello C++ Academy!",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    // Viet code in ra man hinh tai day

    return 0;
}`,
            order: 1,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-02",
            title: "Biến, Kiểu dữ liệu & Hằng số",
            chapter: "Chương 1: Bắt đầu với C++",
            description: "Tìm hiểu cách khai báo biến, các kiểu dữ liệu nguyên thủy và từ khóa const.",
            level: "Cơ bản",
            duration: "25 phút",
            content: `
<h3>1. Biến (Variables)</h3>
<p>Biến là vùng nhớ có tên dùng để lưu trữ giá trị trong chương trình. Cú pháp: <code>kiểu_dữ_liệu tên_biến = giá_trị;</code></p>
<h3>2. Các kiểu dữ liệu cơ bản trong C++</h3>
<ul>
    <li><strong>int</strong> (4 bytes): Số nguyên (-2*10^9 đến 2*10^9).</li>
    <li><strong>long long</strong> (8 bytes): Số nguyên rất lớn (đến ~9*10^18).</li>
    <li><strong>float</strong> (4 bytes): Số thực dấu phẩy động độ chính xác đơn.</li>
    <li><strong>double</strong> (8 bytes): Số thực độ chính xác kép (khuyên dùng).</li>
    <li><strong>char</strong> (1 byte): Một ký tự, đặt trong dấu nháy đơn <code>'A'</code>.</li>
    <li><strong>bool</strong> (1 byte): Giá trị logic <code>true</code> (1) hoặc <code>false</code> (0).</li>
</ul>
<h3>3. Hằng số (Constants)</h3>
<p>Dùng từ khóa <code>const</code> để khai báo giá trị không thể thay đổi sau khi gán: <code>const double PI = 3.14159;</code></p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int age = 20;
    double gpa = 3.85;
    char grade = 'A';
    bool isPassed = true;
    const double PI = 3.14159;

    cout << "Tuoi: " << age << endl;
    cout << "Diem GPA: " << gpa << endl;
    cout << "Xep loai: " << grade << endl;
    cout << "Do tot nghiep: " << isPassed << endl;
    cout << "So PI: " << PI << endl;
    return 0;
}`,
            exerciseTitle: "Tính chu vi hình tròn",
            exerciseDescription: "Khai báo hằng số PI = 3.14 và biến bán kính r = 5. Tính chu vi hình tròn (C = 2 * PI * r) và in ra màn hình.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    const double PI = 3.14;
    double r = 5.0;

    // Tinh chu vi va in ket qua tai day

    return 0;
}`,
            order: 2,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-03",
            title: "Nhập & Xuất dữ liệu với cin, cout",
            chapter: "Chương 1: Bắt đầu với C++",
            description: "Thành thạo đối tượng cin để nhận dữ liệu người dùng và cout để hiển thị kết quả.",
            level: "Cơ bản",
            duration: "25 phút",
            content: `
<h3>1. Xuất dữ liệu với cout</h3>
<p>Sử dụng <code>cout &lt;&lt; giá_trị;</code>. Toán tử chèn <code>&lt;&lt;</code> đẩy dữ liệu ra console. Dùng <code>endl</code> hoặc <code>\\n</code> để xuống dòng.</p>
<h3>2. Nhập dữ liệu với cin</h3>
<p>Sử dụng <code>cin &gt;&gt; tên_biến;</code>. Toán tử trích xuất <code>&gt;&gt;</code> đọc dữ liệu từ bàn phím và gán vào biến.</p>
<p>Có thể nhập liên tiếp nhiều biến: <code>cin &gt;&gt; a &gt;&gt; b;</code> (người dùng phân cách bằng dấu cách hoặc Enter).</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int x, y;
    cout << "Nhap hai so nguyen x va y: ";
    cin >> x >> y;

    cout << "Ban da nhap x = " << x << " va y = " << y << endl;
    cout << "Tich hai so la: " << (x * y) << endl;
    return 0;
}`,
            exerciseTitle: "Tính tổng 2 số từ bàn phím",
            exerciseDescription: "Nhập vào 2 số nguyên a và b từ bàn phím. In ra tổng của hai số đó theo định dạng: Tong = [gia tri].",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhap a va b roi in ra Tong = a + b

    return 0;
}`,
            order: 3,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-04",
            title: "Các toán tử trong C++",
            chapter: "Chương 1: Bắt đầu với C++",
            description: "Làm chủ toán tử số học, so sánh quan hệ, logic và toán tử gán phức hợp.",
            level: "Cơ bản",
            duration: "30 phút",
            content: `
<h3>1. Toán tử số học</h3>
<p><code>+</code> (cộng), <code>-</code> (trừ), <code>*</code> (nhân), <code>/</code> (chia), <code>%</code> (chia lấy phần dư). Lưu ý: Phép chia 2 số nguyên sẽ trả về phần nguyên (ví dụ <code>7 / 2 = 3</code>).</p>
<h3>2. Toán tử quan hệ (So sánh)</h3>
<p><code>==</code> (bằng), <code>!=</code> (khác), <code>&gt;</code>, <code>&lt;</code>, <code>&gt;=</code>, <code>&lt;=</code>. Trả về <code>1</code> (true) hoặc <code>0</code> (false).</p>
<h3>3. Toán tử logic</h3>
<ul>
    <li><code>&&</code> (AND): Đúng khi cả hai vế đều đúng.</li>
    <li><code>||</code> (OR): Đúng khi ít nhất một vế đúng.</li>
    <li><code>!</code> (NOT): Đảo ngược giá trị logic.</li>
</ul>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int a = 15, b = 4;
    cout << "a / b = " << a / b << endl;   // 3 (chia nguyen)
    cout << "a % b = " << a % b << endl;   // 3 (phan du)

    bool check = (a > 10) && (b < 5);
    cout << "Dieu kien dung hay sai: " << check << endl;
    return 0;
}`,
            exerciseTitle: "Kiểm tra số chẵn lẻ",
            exerciseDescription: "Nhập số nguyên n. Sử dụng toán tử chia dư % để in ra 1 nếu n là số chẵn, in ra 0 nếu n là số lẻ.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Kiem tra va in 1 neu chan, 0 neu le

    return 0;
}`,
            order: 4,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-05",
            title: "Cấu trúc điều kiện if, else if, else",
            chapter: "Chương 2: Cấu trúc rẽ nhánh",
            description: "Xây dựng logic rẽ nhánh chương trình dựa trên điều kiện đúng/sai.",
            level: "Cơ bản",
            duration: "30 phút",
            content: `
<h3>1. Cú pháp if - else</h3>
<pre>if (điều_kiện_1) {
    // Thực thi khi điều_kiện_1 đúng
} else if (điều_kiện_2) {
    // Thực thi khi điều_kiện_2 đúng
} else {
    // Thực thi khi tất cả điều kiện trên đều sai
}</pre>
<h3>2. Toán tử 3 ngôi (Ternary Operator)</h3>
<p>Cú pháp viết gọn: <code>biến = (điều_kiện) ? giá_trị_khi_đúng : giá_trị_khi_sai;</code></p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    double diem;
    cout << "Nhap diem thi (0 - 10): ";
    cin >> diem;

    if (diem >= 8.5) {
        cout << "Xep loai: Gioi" << endl;
    } else if (diem >= 6.5) {
        cout << "Xep loai: Kha" << endl;
    } else if (diem >= 5.0) {
        cout << "Xep loai: Trung binh" << endl;
    } else {
        cout << "Xep loai: Yeu" << endl;
    }
    return 0;
}`,
            exerciseTitle: "Tìm số lớn nhất trong 2 số",
            exerciseDescription: "Nhập 2 số nguyên a và b. Sử dụng câu lệnh if-else để tìm và in ra số lớn hơn.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int a, b;
    cin >> a >> b;

    // In ra so lon hon trong hai so

    return 0;
}`,
            order: 5,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-06",
            title: "Cấu trúc rẽ nhánh switch - case",
            chapter: "Chương 2: Cấu trúc rẽ nhánh",
            description: "Tối ưu hóa các trường hợp kiểm tra giá trị rời rạc bằng switch-case.",
            level: "Cơ bản",
            duration: "25 phút",
            content: `
<h3>1. Cú pháp switch - case</h3>
<p>Sử dụng khi cần so sánh một biến với nhiều giá trị hằng số rời rạc (kiểu số nguyên hoặc ký tự).</p>
<pre>switch (biến) {
    case giá_trị_1:
        // Lệnh thực thi
        break;
    case giá_trị_2:
        // Lệnh thực thi
        break;
    default:
        // Lệnh mặc định nếu không khớp case nào
}</pre>
<p><strong>Lưu ý:</strong> Từ khóa <code>break</code> rất quan trọng để ngăn chương trình thực thi trôi qua các case phía dưới.</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int thang = 3;
    switch (thang) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            cout << "Thang " << thang << " co 31 ngay." << endl;
            break;
        case 4: case 6: case 9: case 11:
            cout << "Thang " << thang << " co 30 ngay." << endl;
            break;
        case 2:
            cout << "Thang 2 co 28 hoac 29 ngay." << endl;
            break;
        default:
            cout << "Thang khong hop le!" << endl;
    }
    return 0;
}`,
            exerciseTitle: "Máy tính đơn giản với switch",
            exerciseDescription: "Nhập 2 số nguyên a, b và 1 ký tự phép toán (+, -, *, /). Sử dụng switch-case để tính và in ra kết quả tương ứng.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int a, b;
    char op;
    cin >> a >> b >> op;

    // Su dung switch(op) de thuc hien phep tinh

    return 0;
}`,
            order: 6,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-07",
            title: "Vòng lặp for cơ bản & nâng cao",
            chapter: "Chương 3: Cấu trúc vòng lặp",
            description: "Nắm vững vòng lặp for xác định số lần lặp, biến đếm và vòng lặp for lồng nhau.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Cấu trúc vòng lặp for</h3>
<pre>for (khởi_tạo; điều_kiện_lặp; bước_nhảy) {
    // Khối lệnh thực thi
}</pre>
<p>Vòng lặp hoạt động qua 4 bước: (1) Khởi tạo biến đếm -> (2) Kiểm tra điều kiện -> (3) Thực hiện khối lệnh -> (4) Tăng/giảm bước nhảy -> Lặp lại bước 2.</p>
<h3>2. Vòng lặp for lồng nhau (Nested For)</h3>
<p>Dùng để duyệt qua các cấu trúc lưới 2 chiều, in các mẫu hình sao tam giác hoặc ma trận.</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int sum = 0;
    // Tinh tong tu 1 den 10
    for (int i = 1; i <= 10; i++) {
        sum += i;
    }
    cout << "Tong cac so tu 1 den 10 la: " << sum << endl;
    return 0;
}`,
            exerciseTitle: "Tính tổng dãy số 1 đến N",
            exerciseDescription: "Nhập số nguyên dương n. Sử dụng vòng lặp for để tính tổng S = 1 + 2 + ... + n và in kết quả ra màn hình.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Viet vong lap for tinh tong tai day

    return 0;
}`,
            order: 7,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-08",
            title: "Vòng lặp while và do-while",
            chapter: "Chương 3: Cấu trúc vòng lặp",
            description: "Xử lý các tình huống lặp chưa biết trước số lần lặp chính xác bằng while và do-while.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Vòng lặp while</h3>
<p>Kiểm tra điều kiện trước khi thực thi. Nếu điều kiện sai ngay từ đầu, vòng lặp không chạy lần nào.</p>
<pre>while (điều_kiện) {
    // Lệnh thực thi
}</pre>
<h3>2. Vòng lặp do - while</h3>
<p>Thực hiện khối lệnh trước ít nhất 1 lần, sau đó mới kiểm tra điều kiện. Rất thích hợp để tạo menu nhập lại dữ liệu khi không hợp lệ.</p>
<pre>do {
    // Khối lệnh chạy ít nhất 1 lần
} while (điều_kiện);</pre>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int n = 12345;
    int count = 0;
    // Dem so chu so
    while (n > 0) {
        n /= 10;
        count++;
    }
    cout << "So luong chu so: " << count << endl;
    return 0;
}`,
            exerciseTitle: "Đảo ngược số nguyên",
            exerciseDescription: "Nhập số nguyên dương n. Sử dụng vòng lặp while để in ra các chữ số của n theo thứ tự ngược lại (ví dụ: 123 -> 321).",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Su dung while de dao nguoc va in ra cac chu so

    return 0;
}`,
            order: 8,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-09",
            title: "Lệnh điều khiển break & continue",
            chapter: "Chương 3: Cấu trúc vòng lặp",
            description: "Kiểm soát dòng chảy của vòng lặp với câu lệnh nhảy break và continue.",
            level: "Trung bình",
            duration: "20 phút",
            content: `
<h3>1. Lệnh break</h3>
<p>Ngắt và thoát ngay lập tức khỏi vòng lặp gần nhất chứa nó mà không cần đợi điều kiện kết thúc.</p>
<h3>2. Lệnh continue</h3>
<p>Bỏ qua các câu lệnh còn lại trong lượt lặp hiện tại và nhảy ngay sang lượt lặp tiếp theo của vòng lặp.</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // In cac so tu 1 den 10 nhung bo qua so 5
    for (int i = 1; i <= 10; i++) {
        if (i == 5) continue; // Bo qua so 5
        if (i == 9) break;    // Dung lai khi gap 9
        cout << i << " ";
    }
    cout << endl;
    return 0;
}`,
            exerciseTitle: "In các số chẵn",
            exerciseDescription: "Dùng vòng lặp for từ 1 đến 20. Nếu là số lẻ thì dùng lệnh continue để bỏ qua, chỉ in ra các số chẵn cách nhau bằng dấu cách.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    // Su dung for va continue de in cac so chan tu 1 den 20

    return 0;
}`,
            order: 9,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-10",
            title: "Hàm (Functions) & Truyền tham số",
            chapter: "Chương 4: Hàm & Tổ chức mã nguồn",
            description: "Chia nhỏ chương trình thành các hàm tái sử dụng. Phân biệt tham trị và tham chiếu.",
            level: "Trung bình",
            duration: "35 phút",
            content: `
<h3>1. Định nghĩa hàm</h3>
<pre>kiểu_trả_về tên_hàm(danh_sách_tham_số) {
    // Nội dung hàm
    return giá_trị;
}</pre>
<h3>2. Tham trị vs Tham chiếu (&)</h3>
<ul>
    <li><strong>Truyền tham trị (Pass by Value)</strong>: Tạo ra bản sao của biến. Thay đổi trong hàm KHÔNG ảnh hưởng biến gốc ngoài hàm.</li>
    <li><strong>Truyền tham chiếu (Pass by Reference `&`)</strong>: Truyền trực tiếp địa chỉ biến gốc. Mọi thay đổi trong hàm SẼ làm thay đổi biến ngoài hàm.</li>
</ul>`,
            example: `#include <iostream>
using namespace std;

// Ham hoan doi 2 so dung tham chieu &
void hoanDoi(int &x, int &y) {
    int temp = x;
    x = y;
    y = temp;
}

int main() {
    int a = 5, b = 10;
    cout << "Truoc hoan doi: a=" << a << ", b=" << b << endl;
    hoanDoi(a, b);
    cout << "Sau hoan doi: a=" << a << ", b=" << b << endl;
    return 0;
}`,
            exerciseTitle: "Viết hàm tính lũy thừa",
            exerciseDescription: "Viết hàm luyThua(int coSo, int soMu) trả về kết quả cơ số mũ. Trong hàm main nhập a, b và gọi hàm in kết quả.",
            starterCode: `#include <iostream>
using namespace std;

// Dinh nghia ham luyThua tai day

int main() {
    int a, b;
    cin >> a >> b;
    // Goi ham va in ket qua

    return 0;
}`,
            order: 10,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-11",
            title: "Nạp chồng hàm & Đệ quy (Recursion)",
            chapter: "Chương 4: Hàm & Tổ chức mã nguồn",
            description: "Khám phá kỹ thuật nạp chồng hàm (Function Overloading) và giải quyết bài toán bằng đệ quy.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Nạp chồng hàm (Function Overloading)</h3>
<p>Cho phép định nghĩa nhiều hàm cùng tên nhưng khác nhau về số lượng hoặc kiểu dữ liệu của tham số.</p>
<h3>2. Hàm đệ quy (Recursion)</h3>
<p>Hàm gọi lại chính nó. Cần phải có 2 thành phần bắt buộc:</p>
<ul>
    <li><strong>Điều kiện dừng (Base Case)</strong>: Điểm dừng để không bị tràn ngăn xếp (Stack Overflow).</li>
    <li><strong>Bước đệ quy (Recursive Step)</strong>: Gọi lại hàm với kích thước bài toán nhỏ hơn.</li>
</ul>`,
            example: `#include <iostream>
using namespace std;

// Tinh giai thua bang de quy: n! = n * (n-1)!
long long giaiThua(int n) {
    if (n <= 1) return 1; // Base case
    return n * giaiThua(n - 1); // Recursive call
}

int main() {
    cout << "5! = " << giaiThua(5) << endl;
    return 0;
}`,
            exerciseTitle: "Tính số Fibonacci thứ n",
            exerciseDescription: "Viết hàm đệ quy fibo(int n) tính số Fibonacci thứ n (fibo(1)=1, fibo(2)=1, fibo(n) = fibo(n-1) + fibo(n-2)). Nhập n và in kết quả.",
            starterCode: `#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}`,
            order: 11,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-12",
            title: "Mảng một chiều (1D Array)",
            chapter: "Chương 5: Mảng & Chuỗi ký tự",
            description: "Khai báo, khởi tạo, lưu trữ danh sách phần tử cùng kiểu dữ liệu trên mảng 1 chiều.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Khái niệm mảng 1 chiều</h3>
<p>Mảng là tập hợp liên tiếp các ô nhớ lưu trữ các phần tử có cùng kiểu dữ liệu. Các phần tử được đánh chỉ số từ <code>0</code> đến <code>n - 1</code>.</p>
<pre>kiểu_dữ_liệu tên_mảng[kích_thước];
int arr[5] = {10, 20, 30, 40, 50};</pre>
<h3>2. Duyệt qua các phần tử của mảng</h3>
<p>Sử dụng vòng lặp for từ <code>0</code> đến <code>n - 1</code> để truy cập <code>arr[i]</code>.</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int n = 5;
    int a[5] = {3, 7, 2, 9, 5};

    cout << "Cac phan tu trong mang la: ";
    for (int i = 0; i < n; i++) {
        cout << a[i] << " ";
    }
    cout << endl;
    return 0;
}`,
            exerciseTitle: "Tính tổng mảng n phần tử",
            exerciseDescription: "Nhập số nguyên n, sau đó nhập n số nguyên vào mảng. Tính và in ra tổng của tất cả các phần tử trong mảng.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}`,
            order: 12,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-13",
            title: "Các thuật toán mảng cơ bản",
            chapter: "Chương 5: Mảng & Chuỗi ký tự",
            description: "Thực hành các thuật toán thiết yếu trên mảng: Tìm Max/Min, tìm kiếm tuyến tính và sắp xếp.",
            level: "Trung bình",
            duration: "35 phút",
            content: `
<h3>1. Tìm Max / Min</h3>
<p>Gán giá trị đầu tiên <code>max = a[0]</code>, duyệt từ phần tử thứ 1 đến cuối mảng, nếu <code>a[i] > max</code> thì cập nhật <code>max = a[i]</code>.</p>
<h3>2. Sắp xếp nổi bọt (Bubble Sort)</h3>
<p>So sánh liên tiếp 2 phần tử kề nhau, nếu sai thứ tự thì hoán đổi. Lặp lại quá trình cho đến khi mảng được sắp xếp tăng dần.</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int a[] = {12, 45, 7, 89, 23};
    int n = 5;

    int maxVal = a[0];
    for (int i = 1; i < n; i++) {
        if (a[i] > maxVal) {
            maxVal = a[i];
        }
    }
    cout << "Phan tu lon nhat la: " << maxVal << endl;
    return 0;
}`,
            exerciseTitle: "Tìm số nhỏ nhất trong mảng",
            exerciseDescription: "Nhập mảng n số nguyên. Tìm và in ra phần tử có giá trị nhỏ nhất (Min) trong mảng.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}`,
            order: 13,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-14",
            title: "Chuỗi ký tự std::string",
            chapter: "Chương 5: Mảng & Chuỗi ký tự",
            description: "Thao tác với văn bản, nối chuỗi, đo độ dài chuỗi và hàm getline trong C++.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Thư viện &lt;string&gt;</h3>
<p>C++ cung cấp lớp <code>std::string</code> tiện dụng hơn nhiều so với mảng char truyền thống của C.</p>
<h3>2. Các thao tác phổ biến</h3>
<ul>
    <li><code>s.length()</code> hoặc <code>s.size()</code>: Độ dài chuỗi.</li>
    <li><code>s[i]</code>: Truy cập ký tự tại vị trí i.</li>
    <li><code>s1 + s2</code>: Nối chuỗi.</li>
    <li><code>getline(cin, s)</code>: Đọc toàn bộ dòng bao gồm cả dấu cách.</li>
</ul>`,
            example: `#include <iostream>
#include <string>
using namespace std;

int main() {
    string hoTen = "Nguyen Van A";
    cout << "Ten: " << hoTen << endl;
    cout << "Do dai chuoi: " << hoTen.length() << endl;

    string loiChao = "Xin chao, " + hoTen + "!";
    cout << loiChao << endl;
    return 0;
}`,
            exerciseTitle: "Đếm số ký tự in hoa",
            exerciseDescription: "Nhập vào một chuỗi ký tự s. Đếm và in ra số lượng ký tự chữ in hoa ('A' đến 'Z') có trong chuỗi.",
            starterCode: `#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}`,
            order: 14,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-15",
            title: "Mảng hai chiều (Ma trận 2D)",
            chapter: "Chương 5: Mảng & Chuỗi ký tự",
            description: "Làm việc với bảng dữ liệu hàng và cột, ma trận vuông và các bài toán 2D.",
            level: "Trung bình",
            duration: "35 phút",
            content: `
<h3>1. Khai báo mảng 2 chiều</h3>
<p>Cú pháp: <code>kiểu_dữ_liệu tên_mảng[số_hàng][số_cột];</code></p>
<p>Ví dụ: <code>int a[3][4];</code> là ma trận có 3 hàng và 4 cột.</p>
<h3>2. Duyệt mảng 2 chiều</h3>
<p>Sử dụng 2 vòng lặp for lồng nhau: Vòng ngoài duyệt theo hàng <code>i</code>, vòng trong duyệt theo cột <code>j</code>, truy cập phần tử qua <code>a[i][j]</code>.</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int a[2][3] = {
        {1, 2, 3},
        {4, 5, 6}
    };

    cout << "Ma tran 2x3:" << endl;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            cout << a[i][j] << " ";
        }
        cout << endl;
    }
    return 0;
}`,
            exerciseTitle: "Tính tổng ma trận vuông",
            exerciseDescription: "Nhập số nguyên n (kích thước ma trận n x n) và các phần tử của ma trận. Tính và in ra tổng tất cả các phần tử.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}`,
            order: 15,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-16",
            title: "Con trỏ (Pointers) trong C++",
            chapter: "Chương 6: Con trỏ & Quản lý bộ nhớ",
            description: "Khám phá bản chất ô nhớ, toán tử lấy địa chỉ & và con trỏ *.",
            level: "Nâng cao",
            duration: "35 phút",
            content: `
<h3>1. Địa chỉ ô nhớ & Toán tử &</h3>
<p>Mỗi biến trong RAM đều nằm tại một địa chỉ cụ thể. Toán tử <code>&amp;tên_biến</code> trả về địa chỉ ô nhớ của biến đó.</p>
<h3>2. Biến con trỏ (Pointer)</h3>
<p>Con trỏ là biến dùng để lưu trữ địa chỉ của một biến khác.</p>
<pre>int a = 10;
int* ptr = &a; // ptr lưu địa chỉ của a</pre>
<h3>3. Toán tử giải tham chiếu (*)</h3>
<p>Dùng <code>*ptr</code> để đọc hoặc ghi giá trị trực tiếp tại ô nhớ mà con trỏ đang trỏ tới.</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int x = 100;
    int* ptr = &x;

    cout << "Gia tri cua x: " << x << endl;
    cout << "Dia chi cua x: " << ptr << endl;
    cout << "Gia tri qua con tro *ptr: " << *ptr << endl;

    *ptr = 200; // Thay doi x thong qua con tro
    cout << "Gia tri x sau khi sua: " << x << endl;
    return 0;
}`,
            exerciseTitle: "Gấp đôi giá trị qua con trỏ",
            exerciseDescription: "Khai báo số nguyên n nhập từ bàn phím. Sử dụng con trỏ trỏ tới n để nhân đôi giá trị của n và in kết quả n ra màn hình.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}`,
            order: 16,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-17",
            title: "Cấp phát bộ nhớ động (new & delete)",
            chapter: "Chương 6: Con trỏ & Quản lý bộ nhớ",
            description: "Quản lý bộ nhớ Heap linh hoạt trong thời gian chạy với toán tử new và giải phóng bằng delete.",
            level: "Nâng cao",
            duration: "35 phút",
            content: `
<h3>1. Vùng nhớ Stack vs Heap</h3>
<p>Bộ nhớ <strong>Stack</strong> do hệ điều hành quản lý tự động (biến cục bộ). Bộ nhớ <strong>Heap</strong> cho phép lập trình viên tự cấp phát kích thước theo nhu cầu thực tế lúc chạy chương trình.</p>
<h3>2. Toán tử new và delete</h3>
<ul>
    <li><code>int* p = new int;</code>: Cấp phát 1 số nguyên.</li>
    <li><code>delete p;</code>: Giải phóng bộ nhớ.</li>
    <li><code>int* arr = new int[n];</code>: Cấp phát mảng động n phần tử.</li>
    <li><code>delete[] arr;</code>: Giải phóng mảng động.</li>
</ul>
<p><strong>Cảnh báo:</strong> Luôn giải phóng bộ nhớ khi dùng xong để tránh rò rỉ bộ nhớ (Memory Leak).</p>`,
            example: `#include <iostream>
using namespace std;

int main() {
    int n = 3;
    int* arr = new int[n]; // Cap phat dong mang 3 phan tu

    arr[0] = 10;
    arr[1] = 20;
    arr[2] = 30;

    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    delete[] arr; // Giai phong bo nho
    return 0;
}`,
            exerciseTitle: "Mảng động n phần tử",
            exerciseDescription: "Nhập số nguyên n. Sử dụng toán tử new để cấp phát mảng n số nguyên, tính tổng mảng, sau đó giải phóng mảng bằng delete[] và in tổng ra màn hình.",
            starterCode: `#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}`,
            order: 17,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-18",
            title: "Kiểu dữ liệu cấu trúc (struct)",
            chapter: "Chương 7: Lập trình Hướng đối tượng (OOP)",
            description: "Gom nhóm nhiều thuộc tính có kiểu dữ liệu khác nhau vào cùng một thực thể struct.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Struct là gì?</h3>
<p>Struct cho phép gom nhiều biến có các kiểu dữ liệu khác nhau lại thành một kiểu dữ liệu mới do người dùng tự định nghĩa.</p>
<pre>struct SinhVien {
    string hoTen;
    int tuoi;
    double gpa;
};</pre>
<h3>2. Truy xuất thành viên</h3>
<p>Sử dụng toán tử dấu chấm <code>.</code> để truy xuất hoặc gán giá trị cho từng thành viên: <code>sv1.hoTen = "Nam";</code></p>`,
            example: `#include <iostream>
#include <string>
using namespace std;

struct SinhVien {
    string ten;
    int tuoi;
    double gpa;
};

int main() {
    SinhVien sv = {"Le Van B", 19, 3.65};
    cout << "Sinh vien: " << sv.ten << endl;
    cout << "Tuoi: " << sv.tuoi << endl;
    cout << "GPA: " << sv.gpa << endl;
    return 0;
}`,
            exerciseTitle: "Định nghĩa struct Phân số",
            exerciseDescription: "Tạo struct PhanSo gồm 2 thành phần tử số (tu) và mẫu số (mau). Nhập 1 phân số và in ra theo định dạng tu/mau.",
            starterCode: `#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}`,
            order: 18,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-19",
            title: "Lớp (Class) & Đối tượng (Object)",
            chapter: "Chương 7: Lập trình Hướng đối tượng (OOP)",
            description: "Bước vào thế giới OOP: Khái niệm Lớp, Đối tượng, Thuộc tính và Phương thức.",
            level: "Nâng cao",
            duration: "35 phút",
            content: `
<h3>1. Class và Object</h3>
<p><strong>Lớp (Class)</strong> là bản thiết kế (blueprint) mô tả các đặc tính và hành vi. <strong>Đối tượng (Object)</strong> là một thực thể cụ thể sinh ra từ Class.</p>
<h3>2. Phạm vi truy cập (Access Specifiers)</h3>
<ul>
    <li><strong>public</strong>: Có thể truy cập từ bất cứ đâu ngoài lớp.</li>
    <li><strong>private</strong>: Chỉ có thể truy cập từ bên trong nội bộ lớp (tính đóng gói).</li>
</ul>`,
            example: `#include <iostream>
using namespace std;

class HinhChuNhat {
private:
    double dai;
    double rong;

public:
    void setKichThuoc(double d, double r) {
        dai = d;
        rong = r;
    }

    double tinhDienTich() {
        return dai * rong;
    }
};

int main() {
    HinhChuNhat hcn;
    hcn.setKichThuoc(5.0, 3.0);
    cout << "Dien tich HCN: " << hcn.tinhDienTich() << endl;
    return 0;
}`,
            exerciseTitle: "Xây dựng lớp Hình Tròn",
            exerciseDescription: "Tạo class HinhTron có thuộc tính banKinh (private), phương thức setBanKinh(double r) và tinhChuVi() (chu vi = 2 * 3.14 * r). Tạo đối tượng với r = 4 và in chu vi.",
            starterCode: `#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}`,
            order: 19,
            createdAt: new Date().toISOString()
        },
        {
            id: "lesson-20",
            title: "Constructor, Destructor & Kế thừa (OOP)",
            chapter: "Chương 7: Lập trình Hướng đối tượng (OOP)",
            description: "Tìm hiểu hàm khởi tạo, hàm hủy và cơ chế kế thừa mã nguồn giữa các lớp.",
            level: "Nâng cao",
            duration: "40 phút",
            content: `
<h3>1. Constructor & Destructor</h3>
<ul>
    <li><strong>Constructor</strong>: Hàm khởi tạo tự động gọi khi đối tượng được sinh ra, có tên trùng tên lớp, không có kiểu trả về.</li>
    <li><strong>Destructor</strong>: Hàm hủy tự động gọi khi đối tượng bị hủy (có dấu <code>~</code> đằng trước).</li>
</ul>
<h3>2. Tính kế thừa (Inheritance)</h3>
<p>Cho phép một lớp con (Derived Class) tái sử dụng và mở rộng các thuộc tính, phương thức của lớp cha (Base Class).</p>
<pre>class Con : public Cha {
    // Kế thừa các thành phần public của Cha
};</pre>`,
            example: `#include <iostream>
#include <string>
using namespace std;

// Lop cha
class Nguoi {
public:
    string hoTen;
    Nguoi(string ten) : hoTen(ten) {}
    void xinChao() {
        cout << "Xin chao, toi la " << hoTen << endl;
    }
};

// Lop con ke thua Nguoi
class SinhVien : public Nguoi {
public:
    string maSV;
    SinhVien(string ten, string msv) : Nguoi(ten), maSV(msv) {}
    void inThongTin() {
        xinChao();
        cout << "Ma sinh vien: " << maSV << endl;
    }
};

int main() {
    SinhVien sv("Tran Thi C", "SV12345");
    sv.inThongTin();
    return 0;
}`,
            exerciseTitle: "Kế thừa lớp Động vật",
            exerciseDescription: "Tạo lớp DongVat có phương thức keu() in 'Dong vat keu'. Tạo lớp Meo kế thừa DongVat ghi đè keu() in 'Meo meo'. Khởi tạo đối tượng Meo và gọi phương thức keu().",
            starterCode: `#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}`,
            order: 20,
            createdAt: new Date().toISOString()
        }
    ];


    /* =====================================================
       3. DEFAULT SETTINGS
       ===================================================== */

    const DEFAULT_SETTINGS = {
        academyName: "CodeLearn C++",
        version: "1.0.0",
        language: "vi"
    };


    /* =====================================================
       4. BASIC STORAGE FUNCTIONS
       ===================================================== */

    function getItem(key, fallback = null) {

        try {

            const value = localStorage.getItem(key);

            if (value === null) {
                return fallback;
            }

            return JSON.parse(value);

        } catch (error) {

            console.error(
                "Không thể đọc localStorage:",
                error
            );

            return fallback;
        }
    }


    function setItem(key, value) {

        try {

            localStorage.setItem(
                key,
                JSON.stringify(value)
            );

            return true;

        } catch (error) {

            console.error(
                "Không thể lưu localStorage:",
                error
            );

            return false;
        }
    }


    function removeItem(key) {

        try {

            localStorage.removeItem(key);

            return true;

        } catch (error) {

            console.error(
                "Không thể xóa localStorage:",
                error
            );

            return false;
        }
    }


    /* =====================================================
       5. USERS
       ===================================================== */

    const DEFAULT_USERS = [
        {
            id: "user-admin",
            username: "admin",
            fullName: "Quản Trị Viên",
            email: "admin@codelearn.vn",
            password: "123456",
            role: "admin",
            avatar: "",
            createdAt: new Date().toISOString()
        },
        {
            id: "user-student",
            username: "letrunghau",
            fullName: "Lê Trung Hậu",
            email: "letrunghau@codelearn.vn",
            password: "123456",
            role: "student",
            avatar: "",
            createdAt: new Date().toISOString()
        }
    ];

    function initializeUsers() {
        let users = getItem(STORAGE_KEYS.USERS, null);
        if (!Array.isArray(users) || users.length === 0) {
            setItem(STORAGE_KEYS.USERS, DEFAULT_USERS);
        } else {
            let modified = false;

            // Nếu người dùng đã có tài khoản hocvien trước đó thì đổi sang letrunghau
            const oldHocvien = users.find(u => u.username === "hocvien");
            if (oldHocvien) {
                oldHocvien.username = "letrunghau";
                oldHocvien.fullName = "Lê Trung Hậu";
                oldHocvien.email = "letrunghau@codelearn.vn";
                modified = true;
            }

            DEFAULT_USERS.forEach(defUser => {
                const exists = users.some(u => u.username === defUser.username);
                if (!exists) {
                    users.push(defUser);
                    modified = true;
                }
            });
            if (modified) {
                setItem(STORAGE_KEYS.USERS, users);
            }
        }

        // Cập nhật phiên đăng nhập hiện tại nếu đang là hocvien
        const current = getCurrentUser();
        if (current && (current.username === "hocvien" || current.id === "user-student")) {
            current.username = "letrunghau";
            current.fullName = "Lê Trung Hậu";
            current.email = "letrunghau@codelearn.vn";
            saveCurrentUser(current);
        }
    }


    function getUsers() {

        const users = getItem(
            STORAGE_KEYS.USERS,
            []
        );

        return Array.isArray(users)
            ? users
            : [];
    }


    function saveUsers(users) {

        return setItem(
            STORAGE_KEYS.USERS,
            users
        );
    }


    function getUserById(id) {

        if (!id) {
            return null;
        }

        return getUsers().find(
            user => user.id === id
        ) || null;
    }


    function getUserByUsername(username) {

        if (!username) {
            return null;
        }

        const normalized =
            String(username)
                .trim()
                .toLowerCase();

        return getUsers().find(
            user =>
                String(user.username)
                    .toLowerCase() === normalized
        ) || null;
    }


    function getUserByEmail(email) {

        if (!email) {
            return null;
        }

        const normalized =
            String(email)
                .trim()
                .toLowerCase();

        return getUsers().find(
            user =>
                String(user.email)
                    .toLowerCase() === normalized
        ) || null;
    }


    function createUser(data) {

        const users = getUsers();

        const now =
            new Date().toISOString();

        const user = {

            id:
                "user-" +
                Date.now() +
                "-" +
                Math.random()
                    .toString(36)
                    .substring(2, 8),

            username:
                String(data.username || "")
                    .trim(),

            email:
                String(data.email || "")
                    .trim()
                    .toLowerCase(),

            password:
                String(data.password || ""),

            role:
                data.role || "student",

            createdAt:
                data.createdAt || now,

            avatar:
                data.avatar || "",

            updatedAt:
                now
        };

        users.push(user);

        saveUsers(users);

        return user;
    }


    function updateUser(id, changes) {

        const users = getUsers();

        const index =
            users.findIndex(
                user => user.id === id
            );

        if (index === -1) {
            return null;
        }

        users[index] = {
            ...users[index],
            ...changes,
            updatedAt:
                new Date().toISOString()
        };

        saveUsers(users);

        if (window.CodeLearnApi && typeof CodeLearnApi.user?.updateProfile === "function") {
            CodeLearnApi.user.updateProfile(changes).catch(() => {});
        }

        return users[index];
    }


    function deleteUser(id) {

        const users = getUsers();

        const filtered =
            users.filter(
                user => user.id !== id
            );

        saveUsers(filtered);

        return filtered.length !== users.length;
    }


    /* =====================================================
       6. CURRENT USER
       ===================================================== */

    function getCurrentUser() {

        return getItem(
            STORAGE_KEYS.CURRENT_USER,
            null
        );
    }


    function setCurrentUser(user) {

        if (!user) {

            removeItem(
                STORAGE_KEYS.CURRENT_USER
            );

            return;
        }

        const safeUser = {
            id: user.id,
            username: user.username,
            email: user.email,
            role: user.role,
            createdAt: user.createdAt,
            avatar: user.avatar || ""
        };

        setItem("cpp_loggedOut", false);

        setItem(
            STORAGE_KEYS.CURRENT_USER,
            safeUser
        );
    }


    function clearCurrentUser() {

        setItem("cpp_loggedOut", true);

        removeItem(
            STORAGE_KEYS.CURRENT_USER
        );
    }


    function isLoggedIn() {

        return Boolean(
            getCurrentUser()
        );
    }


    function isAdmin() {

        const user =
            getCurrentUser();

        return Boolean(
            user &&
            user.role === "admin"
        );
    }


    /* =====================================================
       7. LESSONS
       ===================================================== */

    function initializeLessons() {

        let lessons =
            getItem(
                STORAGE_KEYS.LESSONS,
                null
            );

        if (!Array.isArray(lessons) || lessons.length === 0) {

            setItem(
                STORAGE_KEYS.LESSONS,
                DEFAULT_LESSONS
            );

            return;
        }

        /*
         * Tự động bổ sung đầy đủ toàn bộ các bài học trong chương trình mới
         * mà vẫn giữ nguyên các bài học người dùng tự tạo hoặc chỉnh sửa.
         */
        const existingIds = new Set(lessons.map(l => String(l.id)));
        const missing = DEFAULT_LESSONS.filter(l => !existingIds.has(String(l.id)));

        if (missing.length > 0) {
            const updated = [
                ...lessons,
                ...missing
            ].sort(
                (a, b) =>
                    Number(a.order || 0) -
                    Number(b.order || 0)
            );

            setItem(
                STORAGE_KEYS.LESSONS,
                updated
            );
        }
    }


    function getLessons() {

        let lessons =
            getItem(
                STORAGE_KEYS.LESSONS,
                []
            );

        if (!Array.isArray(lessons) || lessons.length === 0) {
            lessons = Array.isArray(DEFAULT_LESSONS) && DEFAULT_LESSONS.length > 0
                ? DEFAULT_LESSONS
                : [];
            if (lessons.length > 0) {
                setItem(STORAGE_KEYS.LESSONS, lessons);
            }
        }

        return lessons
            .map(lesson => ({
                ...lesson,
                theory: lesson.theory || lesson.content || "",
                content: lesson.content || lesson.theory || "",
                example: lesson.example || lesson.exampleCode || "",
                exampleCode: lesson.exampleCode || lesson.example || ""
            }))
            .sort(
                (a, b) =>
                    Number(a.order || 0) -
                    Number(b.order || 0)
            );
    }

    function resetLessons() {
        setItem(STORAGE_KEYS.LESSONS, DEFAULT_LESSONS);
        return getLessons();
    }


    function saveLessons(lessons) {

        return setItem(
            STORAGE_KEYS.LESSONS,
            lessons
        );
    }


    function getLessonById(id) {

        if (!id) {
            return null;
        }

        return getLessons().find(
            lesson =>
                String(lesson.id) === String(id)
        ) || null;
    }


    function addLesson(lessonData) {

        const lessons =
            getLessons();

        const lesson = {

            id:
                lessonData.id ||
                "lesson-" +
                Date.now() +
                "-" +
                Math.random()
                    .toString(36)
                    .substring(2, 7),

            title:
                lessonData.title || "Bài học mới",

            chapter:
                lessonData.chapter || "Chương mới",

            description:
                lessonData.description || "",

            level:
                lessonData.level || "Cơ bản",

            duration:
                lessonData.duration || "20 phút",

            content:
                lessonData.content || lessonData.theory || "",

            theory:
                lessonData.theory || lessonData.content || "",

            example:
                lessonData.example || lessonData.exampleCode || "",

            exampleCode:
                lessonData.exampleCode || lessonData.example || "",

            exerciseTitle:
                lessonData.exerciseTitle || "",

            exerciseDescription:
                lessonData.exerciseDescription || "",

            starterCode:
                lessonData.starterCode || "",

            order:
                Number(lessonData.order) ||
                lessons.length + 1,

            createdAt:
                lessonData.createdAt ||
                new Date().toISOString(),

            updatedAt:
                new Date().toISOString()
        };

        lessons.push(lesson);

        saveLessons(lessons);

        if (window.CodeLearnApi && typeof CodeLearnApi.lessons?.create === "function") {
            CodeLearnApi.lessons.create(lesson).catch(() => {});
        }

        return lesson;
    }


    function updateLesson(id, changes) {

        const lessons =
            getLessons();

        const index =
            lessons.findIndex(
                lesson =>
                    String(lesson.id) === String(id)
            );

        if (index === -1) {
            return null;
        }

        const merged = {
            ...lessons[index],
            ...changes,
            id: lessons[index].id,
            updatedAt:
                new Date().toISOString()
        };

        if (changes.theory && !changes.content) merged.content = changes.theory;
        if (changes.content && !changes.theory) merged.theory = changes.content;
        if (changes.exampleCode && !changes.example) merged.example = changes.exampleCode;
        if (changes.example && !changes.exampleCode) merged.exampleCode = changes.example;

        lessons[index] = merged;

        saveLessons(lessons);

        if (window.CodeLearnApi && typeof CodeLearnApi.lessons?.update === "function") {
            CodeLearnApi.lessons.update(id, merged).catch(() => {});
        }

        return lessons[index];
    }


    function deleteLesson(id) {

        const lessons =
            getLessons();

        const filtered =
            lessons.filter(
                lesson =>
                    String(lesson.id) !== String(id)
            );

        /*
         * Sắp xếp lại order
         */
        filtered.forEach(
            (lesson, index) => {
                lesson.order = index + 1;
            }
        );

        saveLessons(filtered);

        if (window.CodeLearnApi && typeof CodeLearnApi.lessons?.delete === "function") {
            CodeLearnApi.lessons.delete(id).catch(() => {});
        }

        return filtered.length !== lessons.length;
    }


    /* =====================================================
       8. PROGRESS
       ===================================================== */

    function getAllProgress() {

        const progress =
            getItem(
                STORAGE_KEYS.PROGRESS,
                {}
            );

        return progress &&
            typeof progress === "object"
            ? progress
            : {};
    }


    function saveAllProgress(progress) {

        return setItem(
            STORAGE_KEYS.PROGRESS,
            progress
        );
    }


    function getUserProgress(userId) {

        if (!userId) {
            return {};
        }

        const allProgress =
            getAllProgress();

        if (
            !allProgress[userId] ||
            typeof allProgress[userId] !== "object"
        ) {

            allProgress[userId] = {};

            saveAllProgress(
                allProgress
            );
        }

        return allProgress[userId];
    }


    function saveUserProgress(
        userId,
        progress
    ) {

        if (!userId) {
            return false;
        }

        const allProgress =
            getAllProgress();

        allProgress[userId] =
            progress;

        return saveAllProgress(
            allProgress
        );
    }


    function getLessonProgress(
        userId,
        lessonId
    ) {

        if (!userId || !lessonId) {
            return null;
        }

        const userProgress =
            getUserProgress(userId);

        return userProgress[lessonId] || null;
    }


    function saveLessonProgress(
        userId,
        lessonId,
        data
    ) {

        if (!userId || !lessonId) {
            return null;
        }

        const userProgress =
            getUserProgress(userId);

        const oldProgress =
            userProgress[lessonId] || {};

        userProgress[lessonId] = {

            ...oldProgress,

            ...data,

            lessonId,

            updatedAt:
                new Date().toISOString()
        };

        saveUserProgress(
            userId,
            userProgress
        );

        if (window.CodeLearnApi && typeof CodeLearnApi.progress?.save === "function") {
            const p = userProgress[lessonId];
            CodeLearnApi.progress.save(
                lessonId,
                p.savedCode || p.submittedCode || "",
                p.completed ? "completed" : "in_progress",
                p.score || 0
            ).catch(() => {});
        }

        return userProgress[lessonId];
    }


    function getLessonCode(userId, lessonId) {
        if (!userId || !lessonId) {
            return "";
        }
        const userProgress = getUserProgress(userId);
        return (userProgress[lessonId] && userProgress[lessonId].savedCode) || "";
    }


    function saveLessonCode(userId, lessonId, code) {
        if (!userId || !lessonId) {
            return false;
        }
        saveLessonProgress(userId, lessonId, {
            savedCode: code
        });
        return true;
    }


    function markLessonCompleted(
        userId,
        lessonId,
        score = 0
    ) {

        return saveLessonProgress(
            userId,
            lessonId,
            {
                completed: true,
                score:
                    Math.max(
                        0,
                        Math.min(
                            100,
                            Number(score) || 0
                        )
                    ),
                completedAt:
                    new Date().toISOString()
            }
        );
    }


    function markLessonStarted(
        userId,
        lessonId
    ) {

        const existing =
            getLessonProgress(
                userId,
                lessonId
            );

        if (
            existing &&
            existing.started
        ) {
            return existing;
        }

        return saveLessonProgress(
            userId,
            lessonId,
            {
                started: true,
                startedAt:
                    new Date().toISOString()
            }
        );
    }


    function getCompletedLessonCount(
        userId
    ) {

        const progress =
            getUserProgress(userId);

        return Object.values(progress)
            .filter(
                item =>
                    item &&
                    item.completed === true
            )
            .length;
    }


    function getStartedLessonCount(
        userId
    ) {

        const progress =
            getUserProgress(userId);

        return Object.values(progress)
            .filter(
                item =>
                    item &&
                    (
                        item.started === true ||
                        item.completed === true
                    )
            )
            .length;
    }


    function getAverageScore(userId) {

        const progress =
            getUserProgress(userId);

        const scores =
            Object.values(progress)
                .filter(
                    item =>
                        item &&
                        item.completed === true &&
                        typeof item.score === "number"
                )
                .map(
                    item =>
                        Number(item.score)
                );

        if (scores.length === 0) {
            return 0;
        }

        const total =
            scores.reduce(
                (sum, score) =>
                    sum + score,
                0
            );

        return Math.round(
            total / scores.length
        );
    }


    function getProgressPercent(userId) {

        const lessons =
            getLessons();

        if (lessons.length === 0) {
            return 0;
        }

        const completed =
            getCompletedLessonCount(
                userId
            );

        return Math.round(
            (completed / lessons.length) *
            100
        );
    }


    function getLessonStatus(
        userId,
        lessonId
    ) {

        const progress =
            getLessonProgress(
                userId,
                lessonId
            );

        if (
            progress &&
            progress.completed
        ) {

            return "completed";
        }

        if (
            progress &&
            progress.started
        ) {

            return "in-progress";
        }

        return "not-started";
    }


    /* =====================================================
       9. RESET USER PROGRESS
       ===================================================== */

    function resetUserProgress(
        userId
    ) {

        if (!userId) {
            return false;
        }

        const allProgress =
            getAllProgress();

        delete allProgress[userId];

        return saveAllProgress(
            allProgress
        );
    }


    function resetAllData() {

        Object.values(
            STORAGE_KEYS
        ).forEach(
            key =>
                removeItem(key)
        );

        initialize();

        return true;
    }


    /* =====================================================
       10. SETTINGS
       ===================================================== */

    function getSettings() {

        return getItem(
            STORAGE_KEYS.SETTINGS,
            DEFAULT_SETTINGS
        );
    }


    function saveSettings(settings) {

        return setItem(
            STORAGE_KEYS.SETTINGS,
            {
                ...DEFAULT_SETTINGS,
                ...settings
            }
        );
    }


    /* =====================================================
       11. STATISTICS
       ===================================================== */

    function getStatistics() {

        const users =
            getUsers();

        const lessons =
            getLessons();

        let totalCompleted = 0;

        let totalScores = [];

        users.forEach(
            user => {

                const progress =
                    getUserProgress(
                        user.id
                    );

                Object.values(
                    progress
                ).forEach(
                    item => {

                        if (
                            item &&
                            item.completed
                        ) {

                            totalCompleted++;
                        }

                        if (
                            item &&
                            item.completed &&
                            typeof item.score === "number"
                        ) {

                            totalScores.push(
                                item.score
                            );
                        }

                    }
                );

            }
        );

        const averageScore =
            totalScores.length
                ? Math.round(
                    totalScores.reduce(
                        (sum, score) =>
                            sum + score,
                        0
                    ) /
                    totalScores.length
                )
                : 0;

        return {

            users:
                users.length,

            lessons:
                lessons.length,

            completedLessons:
                totalCompleted,

            averageScore
        };
    }


    /* =====================================================
       12. INITIALIZE
       ===================================================== */

    function initialize() {

        initializeUsers();

        initializeLessons();

        const settings =
            getItem(
                STORAGE_KEYS.SETTINGS,
                null
            );

        if (!settings) {

            setItem(
                STORAGE_KEYS.SETTINGS,
                DEFAULT_SETTINGS
            );
        }

        // Tự động đồng bộ với Backend API nếu có kết nối
        if (window.CodeLearnApi && typeof CodeLearnApi.checkHealth === "function") {
            CodeLearnApi.checkHealth().then(online => {
                if (online) {
                    CodeLearnApi.lessons.getAll().then(res => {
                        if (res && Array.isArray(res.lessons) && res.lessons.length > 0) {
                            const cur = getLessons();
                            if (cur.length < res.lessons.length) {
                                saveLessons(res.lessons);
                            }
                        }
                    }).catch(() => {});
                }
            });
        }
    }


    /* =====================================================
       13. EXPORT GLOBAL API
       ===================================================== */

    window.CppStorage = {

        /* Keys */
        STORAGE_KEYS,

        /* Users */
        getUsers,
        saveUsers,
        getUserById,
        getUserByUsername,
        getUserByEmail,
        createUser,
        updateUser,
        deleteUser,

        /* Current user */
        getCurrentUser,
        setCurrentUser,
        clearCurrentUser,
        logout: clearCurrentUser,
        isLoggedIn,
        isAdmin,

        /* Lessons */
        getLessons,
        resetLessons,
        saveLessons,
        getLessonById,
        addLesson,
        createLesson: addLesson,
        updateLesson,
        deleteLesson,

        /* Progress */
        getAllProgress,
        saveAllProgress,
        getUserProgress,
        saveUserProgress,
        getLessonProgress,
        saveLessonProgress,
        getLessonCode,
        saveLessonCode,
        markLessonStarted,
        markLessonCompleted,
        getCompletedLessonCount,
        getStartedLessonCount,
        getAverageScore,
        getProgressPercent,
        getLessonStatus,
        resetUserProgress,

        /* Settings */
        getSettings,
        saveSettings,

        /* Statistics */
        getStatistics,

        /* System */
        resetAllData
    };


    /* =====================================================
       14. START
       ===================================================== */

    initialize();

})();