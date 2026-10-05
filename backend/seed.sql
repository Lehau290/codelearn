-- ==============================================================================
-- CODELEARN C++ ACADEMY - SEED DATA & DUMP
-- Tạo lúc: 2026-10-05T15:24:17.973398
-- Tương thích: SQLite 3 / MySQL / PostgreSQL
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `users` (3 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at) VALUES ('user-admin', 'admin', 'admin@codelearn.vn', 'b63c0e4bfd5ac27c4650220372805f3af66360e65cafbe0b537f04b43e94cc51', 'Quản Trị Viên', 'admin', '', '2026-10-05T13:01:59.709488', '2026-10-05T13:01:59.709488');
INSERT OR REPLACE INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at) VALUES ('user-student', 'letrunghau', 'letrunghau@codelearn.vn', 'b63c0e4bfd5ac27c4650220372805f3af66360e65cafbe0b537f04b43e94cc51', 'Lê Trung Hậu', 'student', 'preset-coder-boy', '2026-10-05T13:01:59.709488', '2026-10-05T15:05:06.033688');
INSERT OR REPLACE INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at) VALUES ('user-e1bebac2', 'nguyenthibaongoc', 'baongoc180220@gmail.com', '5fe8513f50d8666aa17865175eeb4436a2ef86568b87d156e5ba68037cd8f7e1', 'nguyenthibaongoc', 'student', '', '2026-10-05T15:11:57.576285', '2026-10-05T15:11:57.576285');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `lessons` (20 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-01', 'Giới thiệu về C++ & Cấu trúc chương trình', 'Chương 1: Bắt đầu với C++', 'Làm quen với ngôn ngữ C++, hàm main(), cấu trúc chương trình và viết chương trình đầu tiên.', 'Cơ bản', '20 phút', '<h3>1. C++ là gì?</h3>
<p>C++ là ngôn ngữ lập trình bậc trung mạnh mẽ, được phát triển bởi Bjarne Stroustrup từ năm 1979 tại Bell Labs. C++ kết hợp cả đặc điểm của ngôn ngữ bậc thấp (thao tác trực tiếp với bộ nhớ) và ngôn ngữ bậc cao (hướng đối tượng, trừu tượng hóa).</p>
<h3>2. Cấu trúc một chương trình C++</h3>
<p>Một chương trình C++ tiêu chuẩn bao gồm:</p>
<ul>
    <li><strong>#include &lt;iostream&gt;</strong>: Chỉ thị tiền xử lý để nhúng thư viện nhập/xuất chuẩn.</li>
    <li><strong>using namespace std;</strong>: Khai báo không gian tên chuẩn, giúp sử dụng <code>cout</code>, <code>cin</code> trực tiếp.</li>
    <li><strong>int main()</strong>: Điểm bắt đầu thực thi của mọi chương trình C++.</li>
    <li><strong>return 0;</strong>: Báo hiệu chương trình kết thúc thành công.</li>
</ul>', '#include <iostream>
using namespace std;

int main() {
    // In ra màn hình câu chào
    cout << "Chao mung ban den voi C++ Basic Academy!" << endl;
    cout << "C++ la mot ngon ngu cuc ky manh me." << endl;
    return 0;
}', 'In lời chào ra màn hình', 'Viết chương trình C++ in ra màn hình dòng chữ: Hello C++ Academy!', '#include <iostream>
using namespace std;

int main() {
    // Viet code in ra man hinh tai day

    return 0;
}', 1, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-02', 'Biến, Kiểu dữ liệu & Hằng số', 'Chương 1: Bắt đầu với C++', 'Tìm hiểu cách khai báo biến, các kiểu dữ liệu nguyên thủy và từ khóa const.', 'Cơ bản', '25 phút', '<h3>1. Biến (Variables)</h3>
<p>Biến là vùng nhớ có tên dùng để lưu trữ giá trị trong chương trình. Cú pháp: <code>kiểu_dữ_liệu tên_biến = giá_trị;</code></p>
<h3>2. Các kiểu dữ liệu cơ bản trong C++</h3>
<ul>
    <li><strong>int</strong> (4 bytes): Số nguyên (-2*10^9 đến 2*10^9).</li>
    <li><strong>long long</strong> (8 bytes): Số nguyên rất lớn (đến ~9*10^18).</li>
    <li><strong>float</strong> (4 bytes): Số thực dấu phẩy động độ chính xác đơn.</li>
    <li><strong>double</strong> (8 bytes): Số thực độ chính xác kép (khuyên dùng).</li>
    <li><strong>char</strong> (1 byte): Một ký tự, đặt trong dấu nháy đơn <code>''A''</code>.</li>
    <li><strong>bool</strong> (1 byte): Giá trị logic <code>true</code> (1) hoặc <code>false</code> (0).</li>
</ul>
<h3>3. Hằng số (Constants)</h3>
<p>Dùng từ khóa <code>const</code> để khai báo giá trị không thể thay đổi sau khi gán: <code>const double PI = 3.14159;</code></p>', '#include <iostream>
using namespace std;

int main() {
    int age = 20;
    double gpa = 3.85;
    char grade = ''A'';
    bool isPassed = true;
    const double PI = 3.14159;

    cout << "Tuoi: " << age << endl;
    cout << "Diem GPA: " << gpa << endl;
    cout << "Xep loai: " << grade << endl;
    cout << "Do tot nghiep: " << isPassed << endl;
    cout << "So PI: " << PI << endl;
    return 0;
}', 'Tính chu vi hình tròn', 'Khai báo hằng số PI = 3.14 và biến bán kính r = 5. Tính chu vi hình tròn (C = 2 * PI * r) và in ra màn hình.', '#include <iostream>
using namespace std;

int main() {
    const double PI = 3.14;
    double r = 5.0;

    // Tinh chu vi va in ket qua tai day

    return 0;
}', 2, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-03', 'Nhập & Xuất dữ liệu với cin, cout', 'Chương 1: Bắt đầu với C++', 'Thành thạo đối tượng cin để nhận dữ liệu người dùng và cout để hiển thị kết quả.', 'Cơ bản', '25 phút', '<h3>1. Xuất dữ liệu với cout</h3>
<p>Sử dụng <code>cout &lt;&lt; giá_trị;</code>. Toán tử chèn <code>&lt;&lt;</code> đẩy dữ liệu ra console. Dùng <code>endl</code> hoặc <code>\\n</code> để xuống dòng.</p>
<h3>2. Nhập dữ liệu với cin</h3>
<p>Sử dụng <code>cin &gt;&gt; tên_biến;</code>. Toán tử trích xuất <code>&gt;&gt;</code> đọc dữ liệu từ bàn phím và gán vào biến.</p>
<p>Có thể nhập liên tiếp nhiều biến: <code>cin &gt;&gt; a &gt;&gt; b;</code> (người dùng phân cách bằng dấu cách hoặc Enter).</p>', '#include <iostream>
using namespace std;

int main() {
    int x, y;
    cout << "Nhap hai so nguyen x va y: ";
    cin >> x >> y;

    cout << "Ban da nhap x = " << x << " va y = " << y << endl;
    cout << "Tich hai so la: " << (x * y) << endl;
    return 0;
}', 'Tính tổng 2 số từ bàn phím', 'Nhập vào 2 số nguyên a và b từ bàn phím. In ra tổng của hai số đó theo định dạng: Tong = [gia tri].', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhap a va b roi in ra Tong = a + b

    return 0;
}', 3, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-04', 'Các toán tử trong C++', 'Chương 1: Bắt đầu với C++', 'Làm chủ toán tử số học, so sánh quan hệ, logic và toán tử gán phức hợp.', 'Cơ bản', '30 phút', '<h3>1. Toán tử số học</h3>
<p><code>+</code> (cộng), <code>-</code> (trừ), <code>*</code> (nhân), <code>/</code> (chia), <code>%</code> (chia lấy phần dư). Lưu ý: Phép chia 2 số nguyên sẽ trả về phần nguyên (ví dụ <code>7 / 2 = 3</code>).</p>
<h3>2. Toán tử quan hệ (So sánh)</h3>
<p><code>==</code> (bằng), <code>!=</code> (khác), <code>&gt;</code>, <code>&lt;</code>, <code>&gt;=</code>, <code>&lt;=</code>. Trả về <code>1</code> (true) hoặc <code>0</code> (false).</p>
<h3>3. Toán tử logic</h3>
<ul>
    <li><code>&&</code> (AND): Đúng khi cả hai vế đều đúng.</li>
    <li><code>||</code> (OR): Đúng khi ít nhất một vế đúng.</li>
    <li><code>!</code> (NOT): Đảo ngược giá trị logic.</li>
</ul>', '#include <iostream>
using namespace std;

int main() {
    int a = 15, b = 4;
    cout << "a / b = " << a / b << endl;   // 3 (chia nguyen)
    cout << "a % b = " << a % b << endl;   // 3 (phan du)

    bool check = (a > 10) && (b < 5);
    cout << "Dieu kien dung hay sai: " << check << endl;
    return 0;
}', 'Kiểm tra số chẵn lẻ', 'Nhập số nguyên n. Sử dụng toán tử chia dư % để in ra 1 nếu n là số chẵn, in ra 0 nếu n là số lẻ.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Kiem tra va in 1 neu chan, 0 neu le

    return 0;
}', 4, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-05', 'Cấu trúc điều kiện if, else if, else', 'Chương 2: Cấu trúc rẽ nhánh', 'Xây dựng logic rẽ nhánh chương trình dựa trên điều kiện đúng/sai.', 'Cơ bản', '30 phút', '<h3>1. Cú pháp if - else</h3>
<pre>if (điều_kiện_1) {
    // Thực thi khi điều_kiện_1 đúng
} else if (điều_kiện_2) {
    // Thực thi khi điều_kiện_2 đúng
} else {
    // Thực thi khi tất cả điều kiện trên đều sai
}</pre>
<h3>2. Toán tử 3 ngôi (Ternary Operator)</h3>
<p>Cú pháp viết gọn: <code>biến = (điều_kiện) ? giá_trị_khi_đúng : giá_trị_khi_sai;</code></p>', '#include <iostream>
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
}', 'Tìm số lớn nhất trong 2 số', 'Nhập 2 số nguyên a và b. Sử dụng câu lệnh if-else để tìm và in ra số lớn hơn.', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    cin >> a >> b;

    // In ra so lon hon trong hai so

    return 0;
}', 5, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-06', 'Cấu trúc rẽ nhánh switch - case', 'Chương 2: Cấu trúc rẽ nhánh', 'Tối ưu hóa các trường hợp kiểm tra giá trị rời rạc bằng switch-case.', 'Cơ bản', '25 phút', '<h3>1. Cú pháp switch - case</h3>
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
<p><strong>Lưu ý:</strong> Từ khóa <code>break</code> rất quan trọng để ngăn chương trình thực thi trôi qua các case phía dưới.</p>', '#include <iostream>
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
}', 'Máy tính đơn giản với switch', 'Nhập 2 số nguyên a, b và 1 ký tự phép toán (+, -, *, /). Sử dụng switch-case để tính và in ra kết quả tương ứng.', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    char op;
    cin >> a >> b >> op;

    // Su dung switch(op) de thuc hien phep tinh

    return 0;
}', 6, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-07', 'Vòng lặp for cơ bản & nâng cao', 'Chương 3: Cấu trúc vòng lặp', 'Nắm vững vòng lặp for xác định số lần lặp, biến đếm và vòng lặp for lồng nhau.', 'Trung bình', '30 phút', '<h3>1. Cấu trúc vòng lặp for</h3>
<pre>for (khởi_tạo; điều_kiện_lặp; bước_nhảy) {
    // Khối lệnh thực thi
}</pre>
<p>Vòng lặp hoạt động qua 4 bước: (1) Khởi tạo biến đếm -> (2) Kiểm tra điều kiện -> (3) Thực hiện khối lệnh -> (4) Tăng/giảm bước nhảy -> Lặp lại bước 2.</p>
<h3>2. Vòng lặp for lồng nhau (Nested For)</h3>
<p>Dùng để duyệt qua các cấu trúc lưới 2 chiều, in các mẫu hình sao tam giác hoặc ma trận.</p>', '#include <iostream>
using namespace std;

int main() {
    int sum = 0;
    // Tinh tong tu 1 den 10
    for (int i = 1; i <= 10; i++) {
        sum += i;
    }
    cout << "Tong cac so tu 1 den 10 la: " << sum << endl;
    return 0;
}', 'Tính tổng dãy số 1 đến N', 'Nhập số nguyên dương n. Sử dụng vòng lặp for để tính tổng S = 1 + 2 + ... + n và in kết quả ra màn hình.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Viet vong lap for tinh tong tai day

    return 0;
}', 7, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-08', 'Vòng lặp while và do-while', 'Chương 3: Cấu trúc vòng lặp', 'Xử lý các tình huống lặp chưa biết trước số lần lặp chính xác bằng while và do-while.', 'Trung bình', '30 phút', '<h3>1. Vòng lặp while</h3>
<p>Kiểm tra điều kiện trước khi thực thi. Nếu điều kiện sai ngay từ đầu, vòng lặp không chạy lần nào.</p>
<pre>while (điều_kiện) {
    // Lệnh thực thi
}</pre>
<h3>2. Vòng lặp do - while</h3>
<p>Thực hiện khối lệnh trước ít nhất 1 lần, sau đó mới kiểm tra điều kiện. Rất thích hợp để tạo menu nhập lại dữ liệu khi không hợp lệ.</p>
<pre>do {
    // Khối lệnh chạy ít nhất 1 lần
} while (điều_kiện);</pre>', '#include <iostream>
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
}', 'Đảo ngược số nguyên', 'Nhập số nguyên dương n. Sử dụng vòng lặp while để in ra các chữ số của n theo thứ tự ngược lại (ví dụ: 123 -> 321).', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Su dung while de dao nguoc va in ra cac chu so

    return 0;
}', 8, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-09', 'Lệnh điều khiển break & continue', 'Chương 3: Cấu trúc vòng lặp', 'Kiểm soát dòng chảy của vòng lặp với câu lệnh nhảy break và continue.', 'Trung bình', '20 phút', '<h3>1. Lệnh break</h3>
<p>Ngắt và thoát ngay lập tức khỏi vòng lặp gần nhất chứa nó mà không cần đợi điều kiện kết thúc.</p>
<h3>2. Lệnh continue</h3>
<p>Bỏ qua các câu lệnh còn lại trong lượt lặp hiện tại và nhảy ngay sang lượt lặp tiếp theo của vòng lặp.</p>', '#include <iostream>
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
}', 'In các số chẵn', 'Dùng vòng lặp for từ 1 đến 20. Nếu là số lẻ thì dùng lệnh continue để bỏ qua, chỉ in ra các số chẵn cách nhau bằng dấu cách.', '#include <iostream>
using namespace std;

int main() {
    // Su dung for va continue de in cac so chan tu 1 den 20

    return 0;
}', 9, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-10', 'Hàm (Functions) & Truyền tham số', 'Chương 4: Hàm & Tổ chức mã nguồn', 'Chia nhỏ chương trình thành các hàm tái sử dụng. Phân biệt tham trị và tham chiếu.', 'Trung bình', '35 phút', '<h3>1. Định nghĩa hàm</h3>
<pre>kiểu_trả_về tên_hàm(danh_sách_tham_số) {
    // Nội dung hàm
    return giá_trị;
}</pre>
<h3>2. Tham trị vs Tham chiếu (&)</h3>
<ul>
    <li><strong>Truyền tham trị (Pass by Value)</strong>: Tạo ra bản sao của biến. Thay đổi trong hàm KHÔNG ảnh hưởng biến gốc ngoài hàm.</li>
    <li><strong>Truyền tham chiếu (Pass by Reference', '#include <iostream>
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
}', 'Viết hàm tính lũy thừa', 'Viết hàm luyThua(int coSo, int soMu) trả về kết quả cơ số mũ. Trong hàm main nhập a, b và gọi hàm in kết quả.', '#include <iostream>
using namespace std;

// Dinh nghia ham luyThua tai day

int main() {
    int a, b;
    cin >> a >> b;
    // Goi ham va in ket qua

    return 0;
}', 10, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-11', 'Nạp chồng hàm & Đệ quy (Recursion)', 'Chương 4: Hàm & Tổ chức mã nguồn', 'Khám phá kỹ thuật nạp chồng hàm (Function Overloading) và giải quyết bài toán bằng đệ quy.', 'Trung bình', '30 phút', '<h3>1. Nạp chồng hàm (Function Overloading)</h3>
<p>Cho phép định nghĩa nhiều hàm cùng tên nhưng khác nhau về số lượng hoặc kiểu dữ liệu của tham số.</p>
<h3>2. Hàm đệ quy (Recursion)</h3>
<p>Hàm gọi lại chính nó. Cần phải có 2 thành phần bắt buộc:</p>
<ul>
    <li><strong>Điều kiện dừng (Base Case)</strong>: Điểm dừng để không bị tràn ngăn xếp (Stack Overflow).</li>
    <li><strong>Bước đệ quy (Recursive Step)</strong>: Gọi lại hàm với kích thước bài toán nhỏ hơn.</li>
</ul>', '#include <iostream>
using namespace std;

// Tinh giai thua bang de quy: n! = n * (n-1)!
long long giaiThua(int n) {
    if (n <= 1) return 1; // Base case
    return n * giaiThua(n - 1); // Recursive call
}

int main() {
    cout << "5! = " << giaiThua(5) << endl;
    return 0;
}', 'Tính số Fibonacci thứ n', 'Viết hàm đệ quy fibo(int n) tính số Fibonacci thứ n (fibo(1)=1, fibo(2)=1, fibo(n) = fibo(n-1) + fibo(n-2)). Nhập n và in kết quả.', '#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}', 11, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-12', 'Mảng một chiều (1D Array)', 'Chương 5: Mảng & Chuỗi ký tự', 'Khai báo, khởi tạo, lưu trữ danh sách phần tử cùng kiểu dữ liệu trên mảng 1 chiều.', 'Trung bình', '30 phút', '<h3>1. Khái niệm mảng 1 chiều</h3>
<p>Mảng là tập hợp liên tiếp các ô nhớ lưu trữ các phần tử có cùng kiểu dữ liệu. Các phần tử được đánh chỉ số từ <code>0</code> đến <code>n - 1</code>.</p>
<pre>kiểu_dữ_liệu tên_mảng[kích_thước];
int arr[5] = {10, 20, 30, 40, 50};</pre>
<h3>2. Duyệt qua các phần tử của mảng</h3>
<p>Sử dụng vòng lặp for từ <code>0</code> đến <code>n - 1</code> để truy cập <code>arr[i]</code>.</p>', '#include <iostream>
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
}', 'Tính tổng mảng n phần tử', 'Nhập số nguyên n, sau đó nhập n số nguyên vào mảng. Tính và in ra tổng của tất cả các phần tử trong mảng.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}', 12, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-13', 'Các thuật toán mảng cơ bản', 'Chương 5: Mảng & Chuỗi ký tự', 'Thực hành các thuật toán thiết yếu trên mảng: Tìm Max/Min, tìm kiếm tuyến tính và sắp xếp.', 'Trung bình', '35 phút', '<h3>1. Tìm Max / Min</h3>
<p>Gán giá trị đầu tiên <code>max = a[0]</code>, duyệt từ phần tử thứ 1 đến cuối mảng, nếu <code>a[i] > max</code> thì cập nhật <code>max = a[i]</code>.</p>
<h3>2. Sắp xếp nổi bọt (Bubble Sort)</h3>
<p>So sánh liên tiếp 2 phần tử kề nhau, nếu sai thứ tự thì hoán đổi. Lặp lại quá trình cho đến khi mảng được sắp xếp tăng dần.</p>', '#include <iostream>
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
}', 'Tìm số nhỏ nhất trong mảng', 'Nhập mảng n số nguyên. Tìm và in ra phần tử có giá trị nhỏ nhất (Min) trong mảng.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}', 13, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-14', 'Chuỗi ký tự std::string', 'Chương 5: Mảng & Chuỗi ký tự', 'Thao tác với văn bản, nối chuỗi, đo độ dài chuỗi và hàm getline trong C++.', 'Trung bình', '30 phút', '<h3>1. Thư viện &lt;string&gt;</h3>
<p>C++ cung cấp lớp <code>std::string</code> tiện dụng hơn nhiều so với mảng char truyền thống của C.</p>
<h3>2. Các thao tác phổ biến</h3>
<ul>
    <li><code>s.length()</code> hoặc <code>s.size()</code>: Độ dài chuỗi.</li>
    <li><code>s[i]</code>: Truy cập ký tự tại vị trí i.</li>
    <li><code>s1 + s2</code>: Nối chuỗi.</li>
    <li><code>getline(cin, s)</code>: Đọc toàn bộ dòng bao gồm cả dấu cách.</li>
</ul>', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string hoTen = "Nguyen Van A";
    cout << "Ten: " << hoTen << endl;
    cout << "Do dai chuoi: " << hoTen.length() << endl;

    string loiChao = "Xin chao, " + hoTen + "!";
    cout << loiChao << endl;
    return 0;
}', 'Đếm số ký tự in hoa', 'Nhập vào một chuỗi ký tự s. Đếm và in ra số lượng ký tự chữ in hoa (''A'' đến ''Z'') có trong chuỗi.', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}', 14, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-15', 'Mảng hai chiều (Ma trận 2D)', 'Chương 5: Mảng & Chuỗi ký tự', 'Làm việc với bảng dữ liệu hàng và cột, ma trận vuông và các bài toán 2D.', 'Trung bình', '35 phút', '<h3>1. Khai báo mảng 2 chiều</h3>
<p>Cú pháp: <code>kiểu_dữ_liệu tên_mảng[số_hàng][số_cột];</code></p>
<p>Ví dụ: <code>int a[3][4];</code> là ma trận có 3 hàng và 4 cột.</p>
<h3>2. Duyệt mảng 2 chiều</h3>
<p>Sử dụng 2 vòng lặp for lồng nhau: Vòng ngoài duyệt theo hàng <code>i</code>, vòng trong duyệt theo cột <code>j</code>, truy cập phần tử qua <code>a[i][j]</code>.</p>', '#include <iostream>
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
}', 'Tính tổng ma trận vuông', 'Nhập số nguyên n (kích thước ma trận n x n) và các phần tử của ma trận. Tính và in ra tổng tất cả các phần tử.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}', 15, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-16', 'Con trỏ (Pointers) trong C++', 'Chương 6: Con trỏ & Quản lý bộ nhớ', 'Khám phá bản chất ô nhớ, toán tử lấy địa chỉ & và con trỏ *.', 'Nâng cao', '35 phút', '<h3>1. Địa chỉ ô nhớ & Toán tử &</h3>
<p>Mỗi biến trong RAM đều nằm tại một địa chỉ cụ thể. Toán tử <code>&amp;tên_biến</code> trả về địa chỉ ô nhớ của biến đó.</p>
<h3>2. Biến con trỏ (Pointer)</h3>
<p>Con trỏ là biến dùng để lưu trữ địa chỉ của một biến khác.</p>
<pre>int a = 10;
int* ptr = &a; // ptr lưu địa chỉ của a</pre>
<h3>3. Toán tử giải tham chiếu (*)</h3>
<p>Dùng <code>*ptr</code> để đọc hoặc ghi giá trị trực tiếp tại ô nhớ mà con trỏ đang trỏ tới.</p>', '#include <iostream>
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
}', 'Gấp đôi giá trị qua con trỏ', 'Khai báo số nguyên n nhập từ bàn phím. Sử dụng con trỏ trỏ tới n để nhân đôi giá trị của n và in kết quả n ra màn hình.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}', 16, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-17', 'Cấp phát bộ nhớ động (new & delete)', 'Chương 6: Con trỏ & Quản lý bộ nhớ', 'Quản lý bộ nhớ Heap linh hoạt trong thời gian chạy với toán tử new và giải phóng bằng delete.', 'Nâng cao', '35 phút', '<h3>1. Vùng nhớ Stack vs Heap</h3>
<p>Bộ nhớ <strong>Stack</strong> do hệ điều hành quản lý tự động (biến cục bộ). Bộ nhớ <strong>Heap</strong> cho phép lập trình viên tự cấp phát kích thước theo nhu cầu thực tế lúc chạy chương trình.</p>
<h3>2. Toán tử new và delete</h3>
<ul>
    <li><code>int* p = new int;</code>: Cấp phát 1 số nguyên.</li>
    <li><code>delete p;</code>: Giải phóng bộ nhớ.</li>
    <li><code>int* arr = new int[n];</code>: Cấp phát mảng động n phần tử.</li>
    <li><code>delete[] arr;</code>: Giải phóng mảng động.</li>
</ul>
<p><strong>Cảnh báo:</strong> Luôn giải phóng bộ nhớ khi dùng xong để tránh rò rỉ bộ nhớ (Memory Leak).</p>', '#include <iostream>
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
}', 'Mảng động n phần tử', 'Nhập số nguyên n. Sử dụng toán tử new để cấp phát mảng n số nguyên, tính tổng mảng, sau đó giải phóng mảng bằng delete[] và in tổng ra màn hình.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}', 17, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-18', 'Kiểu dữ liệu cấu trúc (struct)', 'Chương 7: Lập trình Hướng đối tượng (OOP)', 'Gom nhóm nhiều thuộc tính có kiểu dữ liệu khác nhau vào cùng một thực thể struct.', 'Trung bình', '30 phút', '<h3>1. Struct là gì?</h3>
<p>Struct cho phép gom nhiều biến có các kiểu dữ liệu khác nhau lại thành một kiểu dữ liệu mới do người dùng tự định nghĩa.</p>
<pre>struct SinhVien {
    string hoTen;
    int tuoi;
    double gpa;
};</pre>
<h3>2. Truy xuất thành viên</h3>
<p>Sử dụng toán tử dấu chấm <code>.</code> để truy xuất hoặc gán giá trị cho từng thành viên: <code>sv1.hoTen = "Nam";</code></p>', '#include <iostream>
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
}', 'Định nghĩa struct Phân số', 'Tạo struct PhanSo gồm 2 thành phần tử số (tu) và mẫu số (mau). Nhập 1 phân số và in ra theo định dạng tu/mau.', '#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}', 18, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-19', 'Lớp (Class) & Đối tượng (Object)', 'Chương 7: Lập trình Hướng đối tượng (OOP)', 'Bước vào thế giới OOP: Khái niệm Lớp, Đối tượng, Thuộc tính và Phương thức.', 'Nâng cao', '35 phút', '<h3>1. Class và Object</h3>
<p><strong>Lớp (Class)</strong> là bản thiết kế (blueprint) mô tả các đặc tính và hành vi. <strong>Đối tượng (Object)</strong> là một thực thể cụ thể sinh ra từ Class.</p>
<h3>2. Phạm vi truy cập (Access Specifiers)</h3>
<ul>
    <li><strong>public</strong>: Có thể truy cập từ bất cứ đâu ngoài lớp.</li>
    <li><strong>private</strong>: Chỉ có thể truy cập từ bên trong nội bộ lớp (tính đóng gói).</li>
</ul>', '#include <iostream>
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
}', 'Xây dựng lớp Hình Tròn', 'Tạo class HinhTron có thuộc tính banKinh (private), phương thức setBanKinh(double r) và tinhChuVi() (chu vi = 2 * 3.14 * r). Tạo đối tượng với r = 4 và in chu vi.', '#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}', 19, '2026-10-05T13:01:59.714494');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-20', 'Constructor, Destructor & Kế thừa (OOP)', 'Chương 7: Lập trình Hướng đối tượng (OOP)', 'Tìm hiểu hàm khởi tạo, hàm hủy và cơ chế kế thừa mã nguồn giữa các lớp.', 'Nâng cao', '40 phút', '<h3>1. Constructor & Destructor</h3>
<ul>
    <li><strong>Constructor</strong>: Hàm khởi tạo tự động gọi khi đối tượng được sinh ra, có tên trùng tên lớp, không có kiểu trả về.</li>
    <li><strong>Destructor</strong>: Hàm hủy tự động gọi khi đối tượng bị hủy (có dấu <code>~</code> đằng trước).</li>
</ul>
<h3>2. Tính kế thừa (Inheritance)</h3>
<p>Cho phép một lớp con (Derived Class) tái sử dụng và mở rộng các thuộc tính, phương thức của lớp cha (Base Class).</p>
<pre>class Con : public Cha {
    // Kế thừa các thành phần public của Cha
};</pre>', '#include <iostream>
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
}', 'Kế thừa lớp Động vật', 'Tạo lớp DongVat có phương thức keu() in ''Dong vat keu''. Tạo lớp Meo kế thừa DongVat ghi đè keu() in ''Meo meo''. Khởi tạo đối tượng Meo và gọi phương thức keu().', '#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}', 20, '2026-10-05T13:01:59.714494');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `exercises` (60 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-01', 'In lời chào ra màn hình', 'Cơ bản', 'easy', 100, 'Viết chương trình C++ sử dụng đối tượng <code>cout</code> để in ra màn hình dòng chữ:<br><code>Hello C++ Academy!</code>', '#include <iostream>
using namespace std;

int main() {
    // Viết code in ra màn hình tại đây

    return 0;
}', 'Hello C++ Academy!', 'Sử dụng lệnh cout << \', '["cout", "hello c++ academy", "return 0", "#include"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-01', 'In danh thiếp cá nhân', 'Vận dụng', 'medium', 100, 'Viết chương trình C++ in ra 3 dòng thông tin giới thiệu bản thân:<br>Dòng 1: <code>Ho va ten: Hoc vien CodeLearn</code><br>Dòng 2: <code>Khoa hoc: Lap trinh C++ co ban</code><br>Dòng 3: <code>Muc tieu: Lam chu C++ trong 30 ngay</code>', '#include <iostream>
using namespace std;

int main() {
    // In 3 dòng thông tin cá nhân bằng cout kết hợp endl

    return 0;
}', 'Ho va ten: Hoc vien CodeLearn
Khoa hoc: Lap trinh C++ co ban
Muc tieu: Lam chu C++ trong 30 ngay', 'Sử dụng nhiều lệnh cout với endl hoặc \\n để ngắt dòng đúng yêu cầu.', '["cout", "ho va ten", "khoa hoc", "muc tieu", "endl"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-01', 'Vẽ hình chữ nhật bằng dấu sao', 'Thử thách', 'hard', 100, 'Viết chương trình C++ in ra một hình chữ nhật có kích thước 3 dòng, mỗi dòng chứa đúng 5 dấu sao:<br><code>*****</code><br><code>*****</code><br><code>*****</code>', '#include <iostream>
using namespace std;

int main() {
    // In hình chữ nhật 3x5 bằng ký tự *

    return 0;
}', '*****
*****
*****', 'In ra 3 dòng, mỗi dòng là chuỗi \', '["cout", "*****", "endl"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-02', 'Tính chu vi hình tròn', 'Cơ bản', 'easy', 100, 'Khai báo hằng số <code>const double PI = 3.14;</code> và biến bán kính <code>double r = 5.0;</code>. Tính chu vi hình tròn (C = 2 * PI * r) và in ra màn hình theo định dạng: <code>Chu vi: [gia tri]</code>', '#include <iostream>
using namespace std;

int main() {
    const double PI = 3.14;
    double r = 5.0;

    // Tính chu vi và in kết quả

    return 0;
}', 'Chu vi: 31.4', 'Dùng công thức chuVi = 2 * PI * r; và in ra cout << \', '["const", "pi", "double", "chu vi", "cout"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-02', 'Tính diện tích hình chữ nhật', 'Vận dụng', 'medium', 100, 'Khai báo chiều dài <code>int dai = 12;</code> và chiều rộng <code>int rong = 7;</code>. Tính chu vi P và diện tích S của hình chữ nhật, sau đó in ra màn hình:<br>Dòng 1: <code>Chu vi: [P]</code><br>Dòng 2: <code>Dien tich: [S]</code>', '#include <iostream>
using namespace std;

int main() {
    int dai = 12;
    int rong = 7;

    // Tính chu vi và diện tích rồi in ra

    return 0;
}', 'Chu vi: 38
Dien tich: 84', 'Chu vi = (dai + rong) * 2; Diện tích = dai * rong;', '["dai", "rong", "chu vi", "dien tich", "cout"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-02', 'Quy đổi giây sang giờ, phút, giây', 'Thử thách', 'hard', 100, 'Khai báo biến tổng số giây <code>int totalSeconds = 3675;</code>. Sử dụng các phép toán số học chia lấy nguyên và chia lấy dư để quy đổi ra số giờ, phút, giây và in ra dạng:<br><code>1 gio 1 phut 15 giay</code>', '#include <iostream>
using namespace std;

int main() {
    int totalSeconds = 3675;

    // Tính gio, phut, giay và in ra màn hình

    return 0;
}', '1 gio 1 phut 15 giay', 'gio = totalSeconds / 3600; phut = (totalSeconds % 3600) / 60; giay = totalSeconds % 60;', '["totalseconds", "gio", "phut", "giay", "%"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-03', 'Tính tổng 2 số từ bàn phím', 'Cơ bản', 'easy', 100, 'Nhập vào 2 số nguyên <code>a</code> và <code>b</code> từ bàn phím bằng <code>cin</code>. In ra tổng của chúng theo định dạng:<br><code>Tong = [gia tri]</code>', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và in Tong = a + b

    return 0;
}', 'Tong = 15', 'Sử dụng cin >> a >> b; sau đó cout << \', '["cin", "cout", "tong", "a", "b"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-03', 'Tính tiền mua hàng có thuế VAT', 'Vận dụng', 'medium', 100, 'Nhập vào số lượng mua <code>int sl;</code> và đơn giá <code>double donGia;</code>. Tính tổng tiền trước thuế (tienGoc = sl * donGia) và tổng thanh toán khi cộng thêm thuế VAT 10% (tongTien = tienGoc * 1.1). In ra:<br><code>Thanh toan: [tongTien]</code>', '#include <iostream>
using namespace std;

int main() {
    int sl;
    double donGia;
    // Nhập sl và donGia, tính tiền kèm VAT 10%

    return 0;
}', 'Thanh toan: 110', 'Nhập cin >> sl >> donGia; tính tongTien = sl * donGia * 1.1; và in ra.', '["cin", "cout", "thanh toan", "dongia", "sl"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-03', 'Tính điểm trung bình 3 môn', 'Thử thách', 'hard', 100, 'Nhập vào 3 số thực điểm Toán, Văn, Anh từ bàn phím. Tính điểm trung bình cộng của 3 môn và in ra theo định dạng:<br><code>Diem trung binh: [gia tri]</code>', '#include <iostream>
using namespace std;

int main() {
    double toan, van, anh;
    // Nhập điểm 3 môn và tính trung bình cộng

    return 0;
}', 'Diem trung binh: 8.5', 'Dùng kiểu double cho toan, van, anh và tính dtb = (toan + van + anh) / 3.0;', '["cin", "cout", "diem trung binh", "toan", "van", "anh"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-04', 'Kiểm tra số chẵn lẻ bằng toán tử dư', 'Cơ bản', 'easy', 100, 'Nhập vào số nguyên <code>n</code>. Sử dụng toán tử chia lấy phần dư <code>%</code> để kiểm tra. Nếu n chẵn in ra <code>Chan</code>, nếu lẻ in ra <code>Le</code>.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và kiểm tra chẵn/lẻ bằng toán tử %

    return 0;
}', 'Chan', 'Dùng điều kiện n % 2 == 0 để kiểm tra chẵn lẻ.', '["%", "cin", "cout", "chan", "le"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-04', 'Kiểm tra khoảng giá trị và chia hết', 'Vận dụng', 'medium', 100, 'Nhập vào số nguyên <code>x</code>. Dùng toán tử logic <code>&&</code> để kiểm tra xem x có nằm trong đoạn [10, 100] VÀ đồng thời chia hết cho 5 hay không. Nếu thỏa mãn in <code>Hop le</code>, ngược lại in <code>Khong hop le</code>.', '#include <iostream>
using namespace std;

int main() {
    int x;
    // Nhập x và kiểm tra bằng toán tử && và %

    return 0;
}', 'Hop le', 'Biểu thức: (x >= 10 && x <= 100 && x % 5 == 0)', '["&&", "%", "cin", "hop le", "khong hop le"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-04', 'Hoán vị 2 số không dùng biến trung gian', 'Thử thách', 'hard', 100, 'Nhập vào 2 số nguyên <code>a</code> và <code>b</code>. Chỉ sử dụng các phép toán số học cộng (+) và trừ (-) để đổi chỗ giá trị của a và b (không khai báo thêm biến thứ 3), sau đó in ra dạng:<br><code>a = [gia tri], b = [gia tri]</code>', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và hoán vị bằng toán tử + -

    return 0;
}', 'a = 20, b = 10', 'Cách làm: a = a + b; b = a - b; a = a - b;', '["cin", "cout", "a =", "b ="]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-05', 'Tìm số lớn nhất trong 2 số', 'Cơ bản', 'easy', 100, 'Nhập vào 2 số nguyên <code>a</code> và <code>b</code>. Dùng cấu trúc <code>if - else</code> để tìm và in ra số lớn hơn.', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và dùng if-else tìm số lớn hơn

    return 0;
}', 'So lon nhat: 25', 'if (a > b) cout << \', '["if", "else", "cin", "cout"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-05', 'Xếp loại học lực học sinh', 'Vận dụng', 'medium', 100, 'Nhập điểm trung bình <code>dtb</code> (thang 10). Sử dụng <code>if - else if - else</code> để xếp loại:<br>• dtb >= 8.0: in <code>Gioi</code><br>• dtb >= 6.5: in <code>Kha</code><br>• dtb >= 5.0: in <code>Trung binh</code><br>• còn lại: in <code>Yeu</code>', '#include <iostream>
using namespace std;

int main() {
    double dtb;
    // Nhập dtb và xếp loại học lực

    return 0;
}', 'Gioi', 'Sắp xếp thứ tự kiểm tra từ cao xuống thấp: >= 8.0 -> >= 6.5 -> >= 5.0 -> else.', '["if", "else if", "gioi", "kha", "trung binh", "yeu"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-05', 'Kiểm tra và phân loại tam giác', 'Thử thách', 'hard', 100, 'Nhập 3 cạnh <code>a, b, c</code> của tam giác (số nguyên dương). Kiểm tra xem có tạo thành tam giác hợp lệ không (tổng 2 cạnh bất kỳ lớn hơn cạnh còn lại). Nếu hợp lệ: in <code>Tam giac deu</code> nếu 3 cạnh bằng nhau, <code>Tam giac vuong</code> nếu thỏa định lý Pytago, hoặc <code>Tam giac thuong</code>. Nếu không hợp lệ in <code>Khong phai tam giac</code>.', '#include <iostream>
using namespace std;

int main() {
    int a, b, c;
    // Nhập a, b, c và phân loại tam giác

    return 0;
}', 'Tam giac vuong', 'Điều kiện tam giác: a+b>c && a+c>b && b+c>a. Vuông: a*a + b*b == c*c (hoặc các hoán vị).', '["if", "else", "tam giac", "cin", "cout"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-06', 'Đọc thứ trong tuần', 'Cơ bản', 'easy', 100, 'Nhập vào số nguyên từ 2 đến 8. Sử dụng <code>switch - case</code> để in ra: 2: <code>Thu hai</code>, 3: <code>Thu ba</code>, ..., 8: <code>Chu nhat</code>. Nếu ngoài phạm vi in <code>Khong hop le</code>.', '#include <iostream>
using namespace std;

int main() {
    int day;
    // Nhập day và dùng switch-case để in thứ

    return 0;
}', 'Thu hai', 'Dùng switch(day) với các case 2, 3, 4, 5, 6, 7, 8 và default.', '["switch", "case", "break", "thu hai", "chu nhat"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-06', 'Máy tính đơn giản 4 phép toán', 'Vận dụng', 'medium', 100, 'Nhập vào 2 số thực <code>a, b</code> và 1 ký tự phép toán <code>char op;</code> (+, -, *, /). Dùng <code>switch(op)</code> để tính và in kết quả theo dạng <code>Ket qua = [gia tri]</code>.', '#include <iostream>
using namespace std;

int main() {
    double a, b;
    char op;
    // Nhập a, op, b và dùng switch tính kết quả

    return 0;
}', 'Ket qua = 15', 'Nhập cin >> a >> op >> b; dùng switch(op) cho ''+'', ''-'', ''*'', ''/''.', '["switch", "case", "op", "ket qua", "break"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-06', 'Đếm số ngày trong tháng', 'Thử thách', 'hard', 100, 'Nhập vào tháng <code>m</code> (1-12) và năm <code>y</code>. Dùng <code>switch(m)</code> để in ra số ngày trong tháng. Tháng 1, 3, 5, 7, 8, 10, 12 có 31 ngày; tháng 4, 6, 9, 11 có 30 ngày; tháng 2 có 29 ngày nếu năm nhuận hoặc 28 ngày nếu năm không nhuận.', '#include <iostream>
using namespace std;

int main() {
    int m, y;
    // Nhập m, y và in ra số ngày của tháng

    return 0;
}', '31 ngay', 'Gộp các case có cùng số ngày lại với nhau. Tháng 2 kiểm tra (y % 400 == 0 || (y % 4 == 0 && y % 100 != 0)).', '["switch", "case", "break", "ngay", "cin"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-07', 'Tính tổng dãy số 1 đến N', 'Cơ bản', 'easy', 100, 'Nhập vào số nguyên dương <code>n</code>. Dùng vòng lặp <code>for</code> để tính tổng <code>S = 1 + 2 + ... + n</code> và in ra dạng <code>Tong = [S]</code>.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng vòng lặp for tính tổng S

    return 0;
}', 'Tong = 55', 'Khởi tạo int sum = 0; chạy for (int i = 1; i <= n; i++) sum += i;', '["for", "cin", "cout", "tong ="]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-07', 'In bảng cửu chương của số K', 'Vận dụng', 'medium', 100, 'Nhập vào số nguyên <code>k</code> (1 <= k <= 9). Dùng vòng lặp <code>for</code> in ra bảng cửu chương của k từ 1 đến 10 theo định dạng mỗi dòng:<br><code>k x i = [k * i]</code>', '#include <iostream>
using namespace std;

int main() {
    int k;
    // Nhập k và in bảng nhân từ 1 đến 10

    return 0;
}', '5 x 1 = 5
5 x 2 = 10
5 x 3 = 15', 'Chạy vòng lặp for (int i = 1; i <= 10; i++) và in cout << k << \', '["for", "cin", "cout", "x", "="]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-07', 'Tính giai thừa N!', 'Thử thách', 'hard', 100, 'Nhập vào số nguyên dương <code>n</code> (1 <= n <= 15). Dùng kiểu <code>long long</code> và vòng lặp <code>for</code> để tính <code>n! = 1 * 2 * ... * n</code> và in ra: <code>Giai thua: [kq]</code>.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và tính n! bằng vòng lặp for

    return 0;
}', 'Giai thua: 120', 'Khởi tạo long long fact = 1; for (int i = 1; i <= n; i++) fact *= i;', '["for", "long long", "giai thua", "cin", "cout"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-08', 'Đảo ngược số nguyên dương', 'Cơ bản', 'easy', 100, 'Nhập vào số nguyên dương <code>n</code>. Sử dụng vòng lặp <code>while</code> để in ra các chữ số của n theo thứ tự đảo ngược (ví dụ n = 123 in ra <code>321</code>).', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng while in đảo ngược

    return 0;
}', '321', 'while (n > 0) { cout << n % 10; n /= 10; }', '["while", "%", "/", "cin", "cout"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-08', 'Đếm số chữ số và tính tổng các chữ số', 'Vận dụng', 'medium', 100, 'Nhập số nguyên dương <code>n</code>. Dùng vòng lặp <code>while</code> đếm xem n có bao nhiêu chữ số và tổng các chữ số của n là bao nhiêu. In ra:<br><code>So chu so: [count]</code><br><code>Tong chu so: [sum]</code>', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và tính số chữ số và tổng các chữ số

    return 0;
}', 'So chu so: 4
Tong chu so: 10', 'Khởi tạo count = 0, sum = 0; while (n > 0) { sum += n % 10; count++; n /= 10; }', '["while", "so chu so", "tong chu so", "%", "/"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-08', 'Tìm ước chung lớn nhất (UCLN)', 'Thử thách', 'hard', 100, 'Nhập vào 2 số nguyên dương <code>a</code> và <code>b</code>. Sử dụng thuật toán Euclid với vòng lặp <code>while</code> để tìm và in ra: <code>UCLN = [gia tri]</code>.', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và tìm UCLN bằng thuật toán Euclid

    return 0;
}', 'UCLN = 6', 'while (b != 0) { int r = a % b; a = b; b = r; } UCLN chính là a.', '["while", "ucln", "%", "cin", "cout"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-09', 'In các số chẵn dùng lệnh continue', 'Cơ bản', 'easy', 100, 'Duyệt vòng lặp for từ 1 đến 20. Nếu gặp số lẻ, hãy dùng lệnh <code>continue</code> để bỏ qua. Chỉ in ra các số chẵn cách nhau bởi dấu cách.', '#include <iostream>
using namespace std;

int main() {
    // Duyệt từ 1 đến 20, dùng continue bỏ qua số lẻ

    return 0;
}', '2 4 6 8 10 12 14 16 18 20', 'if (i % 2 != 0) continue; cout << i << \', '["for", "continue", "cout", "%"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-09', 'Tìm số đầu tiên chia hết cho 7', 'Vận dụng', 'medium', 100, 'Nhập số nguyên <code>n</code>. Bắt đầu từ <code>n + 1</code>, duyệt các số tăng dần. Khi tìm được số đầu tiên chia hết cho 7, in số đó ra và dùng lệnh <code>break</code> để thoát ngay khỏi vòng lặp.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng break khi tìm thấy số chia hết cho 7

    return 0;
}', '14', 'while (true) { n++; if (n % 7 == 0) { cout << n; break; } }', '["break", "% 7", "cout", "cin"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-09', 'Kiểm tra số nguyên tố tối ưu với break', 'Thử thách', 'hard', 100, 'Nhập số nguyên dương <code>n</code> (n > 1). Dùng vòng lặp kiểm tra từ 2 đến căn bậc hai của n (hoặc n/2). Nếu gặp bất kỳ ước số nào, đặt cờ hiệu và dùng <code>break</code> để dừng. In ra <code>Nguyen to</code> hoặc <code>Hop so</code>.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và kiểm tra số nguyên tố dùng break

    return 0;
}', 'Nguyen to', 'bool isPrime = true; for (int i = 2; i * i <= n; i++) { if (n % i == 0) { isPrime = false; break; } }', '["break", "for", "nguyen to", "hop so", "cin"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-10', 'Viết hàm tính lũy thừa', 'Cơ bản', 'easy', 100, 'Viết hàm <code>long long luyThua(int coSo, int soMu)</code> trả về giá trị coSo mũ soMu. Trong hàm <code>main()</code>, nhập <code>a, b</code> và gọi hàm để in kết quả.', '#include <iostream>
using namespace std;

// Định nghĩa hàm luyThua tại đây

int main() {
    int a, b;
    cin >> a >> b;
    // Gọi hàm luyThua và in kết quả

    return 0;
}', '32', 'Duyệt vòng lặp nhân soMu lần giá trị coSo và return kết quả.', '["luythua", "long long", "return", "main"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-10', 'Hàm kiểm tra số chính phương', 'Vận dụng', 'medium', 100, 'Viết hàm <code>bool laChinhPhuong(int n)</code> trả về <code>true</code> nếu n là số chính phương (căn bậc 2 là số nguyên), ngược lại trả về <code>false</code>. Trong <code>main()</code> nhập n và in <code>Chinh phuong</code> hoặc <code>Khong chinh phuong</code>.', '#include <iostream>
#include <cmath>
using namespace std;

// Viết hàm bool laChinhPhuong(int n)

int main() {
    int n;
    cin >> n;
    // Gọi hàm và in kết luận

    return 0;
}', 'Chinh phuong', 'int can = sqrt(n); return can * can == n;', '["bool", "lachinhphuong", "sqrt", "return"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-10', 'Hàm hoán vị sử dụng tham chiếu', 'Thử thách', 'hard', 100, 'Viết hàm <code>void hoanDoi(int &x, int &y)</code> sử dụng tham chiếu <code>&</code> để tráo đổi giá trị 2 biến. Trong hàm <code>main()</code>, nhập 2 số a và b, gọi hàm <code>hoanDoi(a, b);</code> rồi in kết quả a và b sau khi hoán vị.', '#include <iostream>
using namespace std;

// Viết hàm void hoanDoi(int &x, int &y)

int main() {
    int a, b;
    cin >> a >> b;
    // Gọi hàm hoanDoi và in ra a, b

    return 0;
}', '20 10', 'Dùng toán tử tham chiếu &: void hoanDoi(int &x, int &y) { int temp = x; x = y; y = temp; }', '["&", "hoandoi", "temp", "void", "main"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-11', 'Tính số Fibonacci thứ n (Cơ bản)', 'Cơ bản', 'easy', 100, 'Viết hàm đệ quy fibo(int n) tính số Fibonacci thứ n (fibo(1)=1, fibo(2)=1, fibo(n) = fibo(n-1) + fibo(n-2)). Nhập n và in kết quả. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-11', 'Vận dụng logic: Nạp chồng hàm & Đệ quy (Recursion)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Nạp chồng hàm & Đệ quy (Recursion) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-11', 'Thử thách mở rộng: Nạp chồng hàm & Đệ quy (Recursion)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Nạp chồng hàm & Đệ quy (Recursion).', '#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-12', 'Tính tổng mảng n phần tử (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập số nguyên n, sau đó nhập n số nguyên vào mảng. Tính và in ra tổng của tất cả các phần tử trong mảng. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-12', 'Vận dụng logic: Mảng một chiều (1D Array)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Mảng một chiều (1D Array) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-12', 'Thử thách mở rộng: Mảng một chiều (1D Array)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Mảng một chiều (1D Array).', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-13', 'Tìm số nhỏ nhất trong mảng (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập mảng n số nguyên. Tìm và in ra phần tử có giá trị nhỏ nhất (Min) trong mảng. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-13', 'Vận dụng logic: Các thuật toán mảng cơ bản', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Các thuật toán mảng cơ bản để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-13', 'Thử thách mở rộng: Các thuật toán mảng cơ bản', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Các thuật toán mảng cơ bản.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-14', 'Đếm số ký tự in hoa (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập vào một chuỗi ký tự s. Đếm và in ra số lượng ký tự chữ in hoa (''A'' đến ''Z'') có trong chuỗi. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-14', 'Vận dụng logic: Chuỗi ký tự std::string', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Chuỗi ký tự std::string để giải quyết bài toán tính toán thực tế.', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-14', 'Thử thách mở rộng: Chuỗi ký tự std::string', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Chuỗi ký tự std::string.', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-15', 'Tính tổng ma trận vuông (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập số nguyên n (kích thước ma trận n x n) và các phần tử của ma trận. Tính và in ra tổng tất cả các phần tử. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-15', 'Vận dụng logic: Mảng hai chiều (Ma trận 2D)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Mảng hai chiều (Ma trận 2D) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-15', 'Thử thách mở rộng: Mảng hai chiều (Ma trận 2D)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Mảng hai chiều (Ma trận 2D).', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-16', 'Gấp đôi giá trị qua con trỏ (Cơ bản)', 'Cơ bản', 'easy', 100, 'Khai báo số nguyên n nhập từ bàn phím. Sử dụng con trỏ trỏ tới n để nhân đôi giá trị của n và in kết quả n ra màn hình. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-16', 'Vận dụng logic: Con trỏ (Pointers) trong C++', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Con trỏ (Pointers) trong C++ để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-16', 'Thử thách mở rộng: Con trỏ (Pointers) trong C++', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Con trỏ (Pointers) trong C++.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-17', 'Mảng động n phần tử (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập số nguyên n. Sử dụng toán tử new để cấp phát mảng n số nguyên, tính tổng mảng, sau đó giải phóng mảng bằng delete[] và in tổng ra màn hình. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-17', 'Vận dụng logic: Cấp phát bộ nhớ động (new & delete)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Cấp phát bộ nhớ động (new & delete) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-17', 'Thử thách mở rộng: Cấp phát bộ nhớ động (new & delete)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Cấp phát bộ nhớ động (new & delete).', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-18', 'Định nghĩa struct Phân số (Cơ bản)', 'Cơ bản', 'easy', 100, 'Tạo struct PhanSo gồm 2 thành phần tử số (tu) và mẫu số (mau). Nhập 1 phân số và in ra theo định dạng tu/mau. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-18', 'Vận dụng logic: Kiểu dữ liệu cấu trúc (struct)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Kiểu dữ liệu cấu trúc (struct) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-18', 'Thử thách mở rộng: Kiểu dữ liệu cấu trúc (struct)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Kiểu dữ liệu cấu trúc (struct).', '#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-19', 'Xây dựng lớp Hình Tròn (Cơ bản)', 'Cơ bản', 'easy', 100, 'Tạo class HinhTron có thuộc tính banKinh (private), phương thức setBanKinh(double r) và tinhChuVi() (chu vi = 2 * 3.14 * r). Tạo đối tượng với r = 4 và in chu vi. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-19', 'Vận dụng logic: Lớp (Class) & Đối tượng (Object)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Lớp (Class) & Đối tượng (Object) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-19', 'Thử thách mở rộng: Lớp (Class) & Đối tượng (Object)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Lớp (Class) & Đối tượng (Object).', '#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-20', 'Kế thừa lớp Động vật (Cơ bản)', 'Cơ bản', 'easy', 100, 'Tạo lớp DongVat có phương thức keu() in ''Dong vat keu''. Tạo lớp Meo kế thừa DongVat ghi đè keu() in ''Meo meo''. Khởi tạo đối tượng Meo và gọi phương thức keu(). Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-20', 'Vận dụng logic: Constructor, Destructor & Kế thừa (OOP)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Constructor, Destructor & Kế thừa (OOP) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-20', 'Thử thách mở rộng: Constructor, Destructor & Kế thừa (OOP)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Constructor, Destructor & Kế thừa (OOP).', '#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `progress` (1 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO progress (id, user_id, lesson_id, status, code, score, comprehension_level, completed_at, updated_at) VALUES ('prog-1791187503.970785', 'user-student', 'lesson-01', 'completed', '
    #include <iostream>
    using namespace std;
    int main() {
        cout << "Hello C++ Academy!" << endl;
        return 0;
    }
    ', 100, 'Hiểu bài xuất sắc (90%+)', '2026-10-05T15:05:03.968870', '2026-10-05T15:05:03.968870');
