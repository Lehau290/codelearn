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

    const LESSONS_CONTENT_VERSION = "2026.10.realworld.v4";

    const DEFAULT_LESSONS = [
        {
            id: "lesson-01",
            title: "Giới thiệu về C++ & Cấu trúc chương trình",
            chapter: "Chương 1: Bắt đầu với C++",
            description: "Làm quen với ngôn ngữ C++, quy trình biên dịch, giải phẫu hàm main() và viết chương trình hóa đơn thực tế đầu tiên.",
            level: "Cơ bản",
            duration: "25 phút",
            content: `
<h3>1. Ngôn ngữ C++ là gì & Tại sao lại quan trọng?</h3>
<p><strong>C++</strong> là ngôn ngữ lập trình bậc trung (middle-level language) do <strong>Bjarne Stroustrup</strong> phát triển tại phòng thí nghiệm Bell Labs từ năm 1979 (ban đầu gọi là "C with Classes"). C++ kết hợp hoàn hảo hai thế giới:</p>
<ul>
    <li><strong>Sức mạnh phần cứng của bậc thấp:</strong> Tốc độ thực thi cực nhanh, cho phép quản lý trực tiếp từng ô nhớ RAM và CPU.</li>
    <li><strong>Tư duy hiện đại của bậc cao:</strong> Hỗ trợ Lập trình Hướng đối tượng (OOP), Lập trình Tổng quát (Templates) và thư viện chuẩn STL đồ sộ.</li>
</ul>
<p>Ngày nay, C++ đứng đằng sau hầu hết các hệ thống đòi hỏi hiệu năng tối đa: Hệ điều hành (Windows, macOS, nhân Linux), Game Engine (Unreal Engine), Trình duyệt web (Google Chrome V8), Hệ thống giao dịch tài chính高频 (High-Frequency Trading) và phần mềm nhúng ô tô tự lái.</p>

<h3>2. Giải phẫu cấu trúc một chương trình C++ chuẩn</h3>
<p>Mọi chương trình C++ dù nhỏ hay lớn đều xoay quanh một bộ khung tiêu chuẩn gồm 4 thành phần cốt lõi:</p>
<ul>
    <li><code>#include &lt;iostream&gt;</code>: <strong>Chỉ thị tiền xử lý (Preprocessor Directive)</strong>. Báo cho trình biên dịch nạp thư viện nhập/xuất chuẩn (Input/Output Stream) trước khi dịch code, giúp chương trình biết cách hiển thị chữ lên màn hình hoặc đọc phím bấm.</li>
    <li><code>using namespace std;</code>: <strong>Khai báo không gian tên chuẩn (Standard Namespace)</strong>. Mọi công cụ chuẩn của C++ đều được đóng gói trong hộp tên <code>std</code>. Nhờ dòng này, bạn chỉ cần viết <code>cout</code> thay vì phải viết đầy đủ <code>std::cout</code>.</li>
    <li><code>int main() { ... }</code>: <strong>Hàm chính (Entry Point)</strong>. Khi bạn bấm chạy chương trình, hệ điều hành sẽ luôn tìm đến đúng hàm <code>main()</code> để bắt đầu thực thi từng dòng lệnh từ trên xuống dưới.</li>
    <li><code>return 0;</code>: <strong>Mã trạng thái thoát (Exit Code)</strong>. Trả số <code>0</code> về cho Hệ điều hành để báo hiệu: <em>"Chương trình đã chạy hoàn tất mà không gặp bất kỳ lỗi nào!"</em>.</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Quy trình mở quán Pha chế Cà phê buổi sáng</h4>
    </div>
    <p>Hãy tưởng tượng việc viết một chương trình C++ giống hệt như <strong>quy trình vận hành một quầy pha chế cà phê</strong>:</p>
    <ul>
        <li><strong><code>#include &lt;iostream&gt;</code></strong> giống như việc <em>nhập nguyên liệu và máy pha cà phê</em> về quán trước giờ mở cửa. Nếu không nhập máy pha (thư viện), bạn không thể phục vụ khách.</li>
        <li><strong><code>using namespace std;</code></strong> giống như việc <em>bày sẵn dụng cụ pha chế ngay trên mặt bàn</em> thay vì mỗi lần pha lại phải chạy vào kho chính lấy từng món.</li>
        <li><strong><code>int main() { ... }</code></strong> chính là <em>ca làm việc chính thức từ lúc mở cửa đón khách</em>: nhân viên thực hiện tuần tự từng bước từ in phiếu order, pha chế đến giao nước.</li>
        <li><strong><code>return 0;</code></strong> giống như <em>báo cáo chốt ca cuối ngày an toàn</em> (0 sự cố) trước khi đóng cửa quán.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Quên dấu chấm phẩy <code>;</code> cuối câu lệnh:</strong> Trong C++, dấu <code>;</code> giống như dấu chấm kết thúc câu văn tiếng Việt. Thiếu nó, trình biên dịch sẽ báo lỗi <code>expected ';' before...</code>.</li>
        <li><strong>Phân biệt chữ HOA và chữ thường:</strong> C++ cực kỳ nghiêm ngặt — viết <code>Main()</code> hay <code>COUT</code> đều sẽ báo lỗi vì chuẩn bắt buộc là chữ thường <code>main()</code> và <code>cout</code>.</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong in Hoa don thanh toan tai quan Ca phe C++
    cout << "========================================" << endl;
    cout << "       HIGHLANDS C++ COFFEE SHOP        " << endl;
    cout << "========================================" << endl;
    cout << "Mon: 01 Bac Xiu Da (Size L)   39.000 VND" << endl;
    cout << "Mon: 01 Banh Mi Que Pate      19.000 VND" << endl;
    cout << "----------------------------------------" << endl;
    cout << "Tong thanh toan:              58.000 VND" << endl;
    cout << "Cam on quy khach & Hen gap lai!" << endl;
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
            description: "Tìm hiểu cách bộ nhớ RAM lưu trữ dữ liệu qua Biến, các kiểu dữ liệu nguyên thủy và từ khóa bảo vệ const.",
            level: "Cơ bản",
            duration: "25 phút",
            content: `
<h3>1. Bản chất của Biến (Variables) trong bộ nhớ RAM</h3>
<p>Khi một chương trình chạy, nó cần nơi lưu trữ các thông tin tạm thời như tuổi tác, giá tiền sản phẩm hay điểm thi. <strong>Biến (Variable)</strong> chính là một vùng nhớ trong RAM được đặt tên để lập trình viên dễ dàng đọc và thay đổi dữ liệu bên trong mà không cần nhớ địa chỉ thập lục phân phức tạp.</p>
<pre>kiểu_dữ_liệu tên_biến = giá_trị_khởi_tạo;</pre>

<h3>2. Bảng phân tích các Kiểu dữ liệu cơ bản trong C++</h3>
<p>Tại sao C++ lại chia ra nhiều kiểu dữ liệu khác nhau? Vì mỗi loại thông tin cần dung lượng bộ nhớ RAM khác nhau để tránh lãng phí:</p>
<ul>
    <li><strong><code>int</code> (4 bytes):</strong> Lưu số nguyên thông thường (từ khoảng -2 tỷ đến +2 tỷ). Phù hợp lưu: tuổi, số lượng hàng hóa, năm sinh.</li>
    <li><strong><code>long long</code> (8 bytes):</strong> Lưu số nguyên siêu lớn (lên tới ±9 × 10<sup>18</sup>). Bắt buộc dùng khi tính toán dân số thế giới, số dư tài khoản ngân hàng hàng tỷ đồng.</li>
    <li><strong><code>float</code> (4 bytes) &amp; <code>double</code> (8 bytes):</strong> Lưu số thực có phần thập phân. Trong thực tế, <code>double</code> luôn được ưu tiên dùng để tính lãi suất, điểm trung bình GPA, tọa độ GPS vì độ chính xác cao gấp đôi <code>float</code>.</li>
    <li><strong><code>char</code> (1 byte):</strong> Lưu đúng 1 ký tự đơn đặt trong dấu nháy đơn, ví dụ: <code>'A'</code>, <code>'9'</code>, <code>'$'</code>.</li>
    <li><strong><code>bool</code> (1 byte):</strong> Chỉ nhận 2 trạng thái đúng (<code>true</code> = 1) hoặc sai (<code>false</code> = 0). Dùng cho các công tắc trạng thái như: Đã thanh toán chưa? Đèn đang bật hay tắt?</li>
</ul>

<h3>3. Hằng số (Constants) với từ khóa <code>const</code></h3>
<p>Những đại lượng không bao giờ được phép thay đổi trong suốt quá trình chạy chương trình (như số <code>PI = 3.14159</code>, thuế suất <code>VAT = 0.08</code>) cần được khóa lại bằng từ khóa <code>const</code>. Nếu bất kỳ dòng code nào cố tình sửa giá trị biến <code>const</code>, trình biên dịch sẽ chặn lại ngay lập tức.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Hệ thống Hộp bảo quản trong Gian bếp &amp; Siêu thị</h4>
    </div>
    <p>Hãy hình dung bộ nhớ RAM của máy tính giống như <strong>kệ tủ trong căn bếp gia đình</strong>:</p>
    <ul>
        <li><strong>Kiểu dữ liệu (Data Type)</strong> là <em>kích cỡ và chất liệu chiếc hộp</em>: Hộp nhỏ <code>char</code> chỉ đựng vừa 1 viên gia vị, hộp vừa <code>int</code> đựng các quả trứng nguyên vẹn (không thể đựng nửa quả), bình thủy tinh chia vạch <code>double</code> dùng để đong 1.5 lít sữa tươi, còn thùng phi lớn <code>long long</code> dùng để chứa hàng ngàn lít nước.</li>
        <li><strong>Tên biến (Variable Name)</strong> là <em>nhãn dán ngoài vỏ hộp</em> (ví dụ: <code>giaTien</code>, <code>soLuongTonKho</code>) để bạn nhìn vào biết ngay bên trong đựng gì.</li>
        <li><strong>Hằng số (<code>const</code>)</strong> giống như <em>thông tin in chìm cố định trên tờ tiền mệnh giá 500.000đ hoặc thuế VAT 8% của Nhà nước</em> — bạn chỉ được phép đọc để tính toán chứ không thể tự ý xóa đi viết số khác đè lên.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Lỗi tràn số (Integer Overflow):</strong> Nếu bạn lưu số tiền <code>5.000.000.000 VND</code> (5 tỷ đồng) vào biến <code>int</code> (giới hạn ~2.14 tỷ), số sẽ bị tràn và biến thành số âm sai lệch hoàn toàn! Hãy dùng <code>long long</code> cho tiền tệ lớn.</li>
        <li><strong>Biến chưa khởi tạo chứa "giác bộ nhớ":</strong> Khai báo <code>int x;</code> mà quên gán <code>= 0</code> sẽ khiến <code>x</code> mang một con số ngẫu nhiên vô nghĩa còn sót lại trong RAM.</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong quan ly san pham tai Sieu thi Mini
    const double THUE_VAT = 0.08;      // Hang so thue VAT 8% co dinh
    int soLuongSua = 4;                // So nguyen: 4 loc sua
    double donGia = 32500.5;           // So thuc: 32,500.5 VND / loc
    char phanHang = 'A';               // Ky tu: Hang chat luong loai A
    bool conHang = true;               // Logic: Dang con hang trong kho

    double tamTinh = soLuongSua * donGia;
    double tongThanhToan = tamTinh + (tamTinh * THUE_VAT);

    cout << "=== THONG TIN SAN PHAM SIEU THI ===" << endl;
    cout << "Phan hang chat luong: Loai " << phanHang << endl;
    cout << "Trang thai ton kho: " << conHang << " (1: Con hang, 0: Het)" << endl;
    cout << "So luong mua: " << soLuongSua << " loc" << endl;
    cout << "Tam tinh: " << tamTinh << " VND" << endl;
    cout << "Tong tien (gom VAT 8%): " << tongThanhToan << " VND" << endl;
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
            description: "Thành thạo luồng giao tiếp hai chiều giữa người dùng và máy tính thông qua đối tượng cin và cout.",
            level: "Cơ bản",
            duration: "25 phút",
            content: `
<h3>1. Luồng xuất chuẩn <code>cout</code> (Character Output)</h3>
<p>Một phần mềm thực tế luôn cần hiển thị thông báo, kết quả tính toán cho người dùng nhìn thấy. C++ sử dụng đối tượng <code>cout</code> đi kèm với <strong>toán tử chèn luồng <code>&lt;&lt;</code></strong> (hướng mũi tên chỉ về phía <code>cout</code> như đang đẩy dữ liệu ra màn hình):</p>
<pre>cout &lt;&lt; "Tong tien cua ban la: " &lt;&lt; tongTien &lt;&lt; " VND" &lt;&lt; endl;</pre>
<ul>
    <li>Có thể nối nhiều toán tử <code>&lt;&lt;</code> liên tiếp trên cùng một dòng để in kết hợp cả chữ và giá trị biến.</li>
    <li>Dùng <code>endl</code> hoặc ký tự điều khiển <code>\n</code> để ngắt xuống dòng mới, dùng <code>\t</code> để căn lề một khoảng Tab.</li>
</ul>

<h3>2. Luồng nhập chuẩn <code>cin</code> (Character Input)</h3>
<p>Để chương trình có tính tương tác (nhận số lượng hàng khách muốn mua, nhận số tiền cần chuyển khoản...), ta dùng <code>cin</code> đi kèm với <strong>toán tử trích xuất luồng <code>&gt;&gt;</code></strong> (hướng mũi tên chỉ vào biến như đang rót dữ liệu từ bàn phím vào biến):</p>
<pre>cin &gt;&gt; soLuong &gt;&gt; donGia;</pre>
<p>Khi gặp lệnh <code>cin</code>, chương trình sẽ tạm dừng chờ người dùng gõ dữ liệu rồi nhấn phím <strong>Enter</strong>. Dấu cách (Space), phím Tab hoặc phím Enter được <code>cin</code> dùng làm dấu hiệu phân tách giữa các giá trị.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Máy bán nước tự động &amp; Cây rút tiền ATM</h4>
    </div>
    <p>Hãy quan sát cách bạn tương tác với một <strong>máy bán nước ngọt tự động ở sảnh tòa nhà</strong>:</p>
    <ul>
        <li><strong><code>cout &lt;&lt; ...</code></strong> chính là <em>màn hình LED của máy bán hàng</em> hiển thị lời chào: <code>"Mời bạn chọn mã lon nước và số lượng cần mua"</code>, hoặc in ra số tiền thừa trả lại.</li>
        <li><strong><code>cin &gt;&gt; ...</code></strong> chính là <em>bàn phím bấm số và khe nhận tiền</em> của máy: máy đứng đợi bạn bấm mã món hàng và số lượng. Tùy vào con số bạn nhập vào lúc đó mà máy sẽ tính ra số tiền tương ứng, chứ không cố định một mức giá sẵn trong code!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Nhầm chiều mũi tên giữa <code>cout</code> và <code>cin</code>:</strong> Mẹo nhớ cực dễ: <code>cout &lt;&lt;</code> mũi tên hướng ra ngoài màn hình; <code>cin &gt;&gt;</code> mũi tên đẩy thẳng vào tên biến cần lưu.</li>
        <li><strong><code>cin &gt;&gt;</code> dừng lại khi gặp khoảng trắng:</strong> Nếu nhập họ tên có dấu cách như <code>"Nguyen Van A"</code> bằng <code>cin &gt;&gt; ten</code>, biến sẽ chỉ lấy được chữ <code>"Nguyen"</code>. (Ở Chương 5 bạn sẽ học hàm <code>getline</code> để đọc trọn vẹn cả dòng có dấu cách).</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong He thong dat ve xem phim rap CGV
    int soVeNguoiLon, soVeTreEm;
    const int GIA_NGUOI_LON = 90000;
    const int GIA_TRE_EM = 60000;

    // Gia lap nguoi dung nhap 2 ve nguoi lon va 1 ve tre em
    soVeNguoiLon = 2;
    soVeTreEm = 1;

    int tongTien = (soVeNguoiLon * GIA_NGUOI_LON) + (soVeTreEm * GIA_TRE_EM);

    cout << "=== QUAY DAT VE XEM PHIM TU DONG ===" << endl;
    cout << "So ve nguoi lon: " << soVeNguoiLon << " x 90.000d" << endl;
    cout << "So ve tre em   : " << soVeTreEm << " x 60.000d" << endl;
    cout << "------------------------------------" << endl;
    cout << "Tong thanh toan: " << tongTien << " VND" << endl;
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
            description: "Làm chủ bộ công cụ tính toán số học, chia lấy dư %, so sánh quan hệ và kết hợp điều kiện logic.",
            level: "Cơ bản",
            duration: "30 phút",
            content: `
<h3>1. Nhóm Toán tử Số học (Arithmetic Operators)</h3>
<p>C++ cung cấp 5 phép toán cơ bản: Cộng (<code>+</code>), Trừ (<code>-</code>), Nhân (<code>*</code>), Chia (<code>/</code>) và Chia lấy phần dư (<code>%</code>). Trong đó có 2 quy tắc vàng bạn bắt buộc phải nhớ:</p>
<ul>
    <li><strong>Phép chia nguyên (<code>/</code>):</strong> Khi lấy hai số nguyên chia cho nhau (ví dụ <code>7 / 2</code>), C++ sẽ <strong>cắt bỏ hoàn toàn phần thập phân</strong> và chỉ trả về thương nguyên là <code>3</code>. Muốn ra <code>3.5</code>, ít nhất một vế phải là số thực: <code>7.0 / 2</code>.</li>
    <li><strong>Phép chia lấy dư (<code>%</code> - Modulo):</strong> Chỉ áp dụng cho số nguyên, trả về phần dư sau phép chia (ví dụ <code>7 % 2 = 1</code>). Cực kỳ hữu ích để kiểm tra số chẵn/lẻ (<code>n % 2 == 0</code>), đổi giây sang giờ:phút:giây, hoặc tính số tờ tiền lẻ khi rút ATM.</li>
</ul>

<h3>2. Toán tử Quan hệ (So sánh) &amp; Toán tử Logic</h3>
<p>Dùng để đặt câu hỏi đúng/sai cho máy tính (trả về <code>1</code> nếu đúng, <code>0</code> nếu sai):</p>
<ul>
    <li><strong>So sánh:</strong> Bằng nhau (<code>==</code>), Khác nhau (<code>!=</code>), Lớn hơn (<code>&gt;</code>), Nhỏ hơn (<code>&lt;</code>), Lớn hơn hoặc bằng (<code>&gt;=</code>), Nhỏ hơn hoặc bằng (<code>&lt;=</code>).</li>
    <li><strong>Logic <code>&amp;&amp;</code> (VÀ - AND):</strong> Chỉ đúng khi <strong>TẤT CẢ</strong> các điều kiện cùng đúng (Ví dụ: Đủ 18 tuổi <code>&amp;&amp;</code> Có giấy phép lái xe).</li>
    <li><strong>Logic <code>||</code> (HOẶC - OR):</strong> Đúng ngay khi có <strong>ÍT NHẤT MỘT</strong> điều kiện đúng (Ví dụ: Có thẻ thành viên VIP <code>||</code> Đơn hàng trên 500k thì được freeship).</li>
    <li><strong>Logic <code>!</code> (PHỦ ĐỊNH - NOT):</strong> Đảo ngược trạng thái từ Đúng sang Sai và ngược lại.</li>
</ul>

<h3>3. Toán tử Gán phức hợp &amp; Tăng giảm (<code>++</code>, <code>--</code>)</h3>
<p>Viết gọn <code>tong += 50;</code> tương đương <code>tong = tong + 50;</code>. Toán tử <code>i++</code> giúp tăng biến đếm lên 1 đơn vị nhanh chóng.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Máy rút tiền ATM chia mệnh giá &amp; Xét duyệt Freeship sàn TMĐT</h4>
    </div>
    <p>Các toán tử C++ hiện diện khắp nơi trong đời sống hàng ngày:</p>
    <ul>
        <li><strong>Phép chia nguyên <code>/</code> và chia dư <code>%</code> tại cây ATM:</strong> Giả sử bạn rút <code>1.350.000đ</code> và máy ưu tiên trả tờ <code>500.000đ</code> trước. Máy tính số tờ 500k bằng phép chia nguyên: <code>1350000 / 500000 = 2</code> tờ. Số tiền lẻ còn lại cần trả tiếp bằng mệnh giá nhỏ hơn chính là phép chia dư: <code>1350000 % 500000 = 350.000đ</code>!</li>
        <li><strong>Toán tử logic <code>&amp;&amp;</code> và <code>||</code> trên ứng dụng Shopee/Grab:</strong> Khi bạn bấm áp mã giảm giá, hệ thống kiểm tra: <code>(giaTriDonHang &gt;= 200000) &amp;&amp; (soLuotDungConLai &gt; 0)</code>. Cả hai vế đều thỏa mãn thì mã giảm giá mới có hiệu lực.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Nhầm lẫn giữa dấu gán <code>=</code> và dấu so sánh bằng <code>==</code>:</strong> Một dấu <code>=</code> dùng để gán giá trị mới cho biến (<code>a = 5</code>), còn hai dấu <code>==</code> mới dùng để kiểm tra hai bên có bằng nhau hay không (<code>a == 5</code>).</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Bai toan thuc te: May ATM doi tien 1.350.000 VND ra to 500k, 200k, 100k, 50k
    int soTienRut = 1350000;
    int conLai = soTienRut;

    int to500k = conLai / 500000;
    conLai = conLai % 500000;

    int to200k = conLai / 200000;
    conLai = conLai % 200000;

    int to100k = conLai / 100000;
    conLai = conLai % 100000;

    int to50k = conLai / 50000;

    cout << "=== MAY ATM PHAN BO MENH GIA TIEN ===" << endl;
    cout << "So tien yeu cau rut: " << soTienRut << " VND" << endl;
    cout << "- Menh gia 500.000d: " << to500k << " to" << endl;
    cout << "- Menh gia 200.000d: " << to200k << " to" << endl;
    cout << "- Menh gia 100.000d: " << to100k << " to" << endl;
    cout << "- Menh gia  50.000d: " << to50k << " to" << endl;
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
            description: "Trao khả năng ra quyết định thông minh cho chương trình dựa trên các điều kiện thực tế.",
            level: "Cơ bản",
            duration: "30 phút",
            content: `
<h3>1. Tại sao chương trình cần Cấu trúc rẽ nhánh?</h3>
<p>Nếu không có cấu trúc rẽ nhánh, chương trình chỉ biết chạy thẳng từ dòng đầu đến dòng cuối một cách máy móc. Trong thực tế, phần mềm luôn phải đưa ra quyết định tùy thuộc vào tình huống: <em>Nếu số dư đủ thì cho phép chuyển khoản, ngược lại thì báo lỗi; Nếu trời mưa thì bật gạt nước ô tô...</em></p>

<h3>2. Cú pháp <code>if - else if - else</code> &amp; Luồng thực thi</h3>
<pre>if (điều_kiện_1) {
    // Chạy khối lệnh này nếu điều_kiện_1 ĐÚNG
} else if (điều_kiện_2) {
    // Chỉ kiểm tra khi điều_kiện_1 SAI và điều_kiện_2 ĐÚNG
} else {
    // Phương án dự phòng cuối cùng khi tất cả điều kiện trên đều SAI
}</pre>
<p><strong>Cơ chế loại trừ tuần tự:</strong> Máy tính kiểm tra từ trên xuống dưới. Ngay khi tìm thấy <strong>một nhánh đầu tiên đúng</strong>, nó thực thi khối lệnh đó rồi <strong>bỏ qua toàn bộ các nhánh <code>else if / else</code> bên dưới</strong>.</p>

<h3>3. Toán tử điều kiện 3 ngôi (Ternary Operator)</h3>
<p>Khi chỉ cần gán nhanh một giá trị theo điều kiện đúng/sai, ta có thể rút gọn 4 dòng <code>if-else</code> thành 1 dòng duy nhất:</p>
<pre>string trangThai = (tuoi &gt;= 18) ? "Du tuoi thi bang lai" : "Chua du tuoi";</pre>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Trạm thu phí tự động &amp; Cách tính Hóa đơn Tiền điện bậc thang EVN</h4>
    </div>
    <p>Hãy liên tưởng cấu trúc <code>if - else if - else</code> với các quy tắc phân loại ngoài đời thực:</p>
    <ul>
        <li><strong>Cổng soát vé Khu vui chơi theo chiều cao:</strong>
            <ul>
                <li><code>if (chieuCao &lt; 100)</code> → Miễn phí vé hoàn toàn (Trẻ dưới 1m).</li>
                <li><code>else if (chieuCao &lt; 140)</code> → Tính giá vé Trẻ em (150.000đ).</li>
                <li><code>else</code> → Tính giá vé Người lớn tiêu chuẩn (250.000đ).</li>
            </ul>
        </li>
        <li><strong>Hệ thống cảnh báo Pin điện thoại:</strong> <code>if (pin &lt;= 10)</code> bật chế độ Siêu tiết kiệm pin màu đỏ; <code>else if (pin &lt;= 20)</code> hiện thông báo nhắc cắm sạc màu vàng; <code>else</code> hoạt động bình thường.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Sắp xếp thứ tự điều kiện từ chặt đến lỏng:</strong> Khi xếp loại điểm hoặc bậc lương, phải kiểm tra mốc cao nhất trước (<code>diem &gt;= 8.5</code> rồi mới tới <code>diem &gt;= 6.5</code>). Nếu đặt <code>if (diem &gt;= 5.0)</code> lên đầu, học sinh 9.0 điểm cũng sẽ lọt ngay vào nhánh Trung bình!</li>
        <li><strong>Lỗi gán nhầm trong <code>if (a = 5)</code>:</strong> Viết 1 dấu bằng sẽ gán <code>a</code> thành 5 và biểu thức luôn đúng! Hãy luôn kiểm tra kỹ <code>if (a == 5)</code>.</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong He thong tinh cuoc Taxi & Giam gia khach hang VIP
    double soKm = 14.5;
    bool laKhachVIP = true;
    double giaCuoc = 0;

    // Quy tac tinh cuoc theo bac quang duong
    if (soKm <= 1.0) {
        giaCuoc = 20000; // Gia mo cua 1km dau
    } else if (soKm <= 10.0) {
        giaCuoc = 20000 + (soKm - 1.0) * 15000;
    } else {
        // Tu km thu 11 tro di gia giam con 12.000d/km
        giaCuoc = 20000 + 9.0 * 15000 + (soKm - 10.0) * 12000;
    }

    // Neu la khach VIP thi giam 10% tong hoa don
    double thanhToan = laKhachVIP ? (giaCuoc * 0.9) : giaCuoc;

    cout << "=== HOA DON CUOC TAXI CONG NGHE ===" << endl;
    cout << "Quang duong di chuyen: " << soKm << " km" << endl;
    cout << "Cuoc tam tinh: " << giaCuoc << " VND" << endl;
    cout << "Hang khach hang: " << (laKhachVIP ? "Thanh vien VIP (-10%)" : "Thuong") << endl;
    cout << "Tong thanh toan: " << thanhToan << " VND" << endl;
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
            description: "Xây dựng hệ thống Menu lựa chọn rõ ràng, tối ưu tốc độ kiểm tra các trường hợp giá trị rời rạc.",
            level: "Cơ bản",
            duration: "25 phút",
            content: `
<h3>1. Khi nào nên dùng <code>switch - case</code> thay cho <code>if - else</code>?</h3>
<p>Khi bạn cần kiểm tra một biến nguyên (<code>int</code>, <code>char</code>) với <strong>nhiều giá trị hằng số cụ thể rời rạc</strong> (ví dụ: bấm phím số 1, 2, 3 trên menu, các thứ trong tuần từ 2 đến 8, hoặc các phép toán <code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>), cấu trúc <code>switch - case</code> giúp mã nguồn sạch sẽ, dễ đọc hơn hẳn và được trình biên dịch tối ưu bằng bảng nhảy (Jump Table) tốc độ cao.</p>

<h3>2. Cú pháp chuẩn &amp; Vai trò của <code>break</code>, <code>default</code></h3>
<pre>switch (biểu_thức_nguyên) {
    case giá_trị_1:
        // Thực thi khi biểu_thức == giá_trị_1
        break; // Thoát khỏi switch ngay lập tức
    case giá_trị_2:
        // Thực thi khi biểu_thức == giá_trị_2
        break;
    default:
        // Thực thi khi KHÔNG khớp với bất kỳ case nào ở trên
}</pre>
<ul>
    <li><strong>Lệnh <code>break</code>:</strong> Đóng vai trò như "bức tường ngăn" giữa các nhánh. Nếu quên <code>break</code>, chương trình sẽ bị <strong>trôi (fall-through)</strong> và chạy luôn các câu lệnh của những <code>case</code> nằm kế tiếp bên dưới!</li>
    <li><strong>Nhóm nhiều <code>case</code> chung kết quả:</strong> Có thể tận dụng tính chất trôi có chủ đích để gom các tháng có 31 ngày: <code>case 1: case 3: case 5: ...</code></li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Bảng nút bấm Thang máy tòa nhà &amp; Tổng đài Chăm sóc khách hàng</h4>
    </div>
    <p>Cấu trúc <code>switch - case</code> hoạt động giống hệt <strong>hệ thống tổng đài tự động hoặc thang máy</strong>:</p>
    <ul>
        <li>Khi bạn gọi tổng đài ngân hàng: <em>"Bấm phím 1 để tra cứu số dư, phím 2 để khóa thẻ khẩn cấp, phím 3 để gặp tổng đài viên..."</em>. Biến <code>phimBam</code> được đưa vào <code>switch(phimBam)</code> để nhảy thẳng tới đúng dịch vụ bạn chọn (<code>case 1</code>, <code>case 2</code>, <code>case 3</code>).</li>
        <li>Nếu bạn bấm nhầm phím 9 (không có trong danh mục), hệ thống tự động chuyển vào nhánh <strong><code>default</code></strong>: <em>"Phím bấm không hợp lệ, xin vui lòng chọn lại!"</em>.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong><code>switch</code> chỉ nhận số nguyên (<code>int</code>, <code>long</code>) hoặc ký tự (<code>char</code>):</strong> Bạn KHÔNG thể truyền số thực <code>double</code> hay chuỗi văn bản <code>string</code> vào <code>switch(...)</code> trong C++.</li>
        <li><strong>Giá trị sau từ khóa <code>case</code> bắt buộc phải là hằng số cố định:</strong> Không thể viết biểu thức biến động như <code>case x &gt; 5:</code> trong <code>switch</code>.</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong Menu Giao dich tai Cay ATM Ngan hang
    int luaChon = 2; // Gia su khach hang bam phim chuc nang so 2
    long long soDu = 15000000;
    long long soTienRut = 3000000;

    cout << "=== MENU CAY ATM NGAN HANG C++ ===" << endl;
    cout << "1. Van tin so du  | 2. Rut tien mat  | 3. Chuyen khoan" << endl;
    cout << "Khach hang da chon chuc nang so: " << luaChon << endl;
    cout << "----------------------------------" << endl;

    switch (luaChon) {
        case 1:
            cout << "So du hien tai cua quy khach: " << soDu << " VND" << endl;
            break;
        case 2:
            soDu -= soTienRut;
            cout << "Rut thanh cong: " << soTienRut << " VND" << endl;
            cout << "So du con lai : " << soDu << " VND" << endl;
            break;
        case 3:
            cout << "Chuyen den man hinh nhap so tai khoan nhan..." << endl;
            break;
        default:
            cout << "Lua chon khong hop le! Vui long bam phim tu 1 den 3." << endl;
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
            description: "Tự động hóa các công việc lặp đi lặp lại với số lần xác định trước bằng vòng lặp for và for lồng nhau.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Sức mạnh của Vòng lặp (Loops) trong lập trình</h3>
<p>Con người rất dễ mệt mỏi và nhầm lẫn khi phải làm đi làm lại một việc hàng nghìn lần, nhưng máy tính có thể lặp lại hàng triệu phép tính mỗi giây với độ chính xác tuyệt đối. <strong>Vòng lặp <code>for</code></strong> được thiết kế chuyên biệt cho những bài toán <strong>đã biết trước số lần lặp</strong> (ví dụ: tính lương cho 500 nhân viên, tính lãi tiết kiệm qua 12 tháng).</p>

<h3>2. Chu trình 4 bước của vòng lặp <code>for</code></h3>
<pre>for (Bước_1_Khởi_tạo; Bước_2_Điều_kiện_lặp; Bước_4_Bước_nhảy) {
    // Bước_3: Khối lệnh được lặp lại khi điều kiện còn ĐÚNG
}</pre>
<ul>
    <li><strong>Bước 1 (Khởi tạo):</strong> Chạy <strong>duy nhất 1 lần</strong> lúc bắt đầu vòng lặp (ví dụ: <code>int thang = 1</code>).</li>
    <li><strong>Bước 2 (Kiểm tra điều kiện):</strong> Nếu đúng (<code>thang &lt;= 12</code>) thì đi vào Bước 3; nếu sai thì kết thúc vòng lặp ngay.</li>
    <li><strong>Bước 3 (Thân vòng lặp):</strong> Thực hiện các câu lệnh tính toán bên trong cặp ngoặc nhọn <code>{ ... }</code>.</li>
    <li><strong>Bước 4 (Bước nhảy):</strong> Cập nhật biến đếm (<code>thang++</code>), sau đó quay lại Bước 2.</li>
</ul>

<h3>3. Vòng lặp <code>for</code> lồng nhau (Nested Loops)</h3>
<p>Khi đặt một vòng lặp <code>for</code> bên trong một vòng lặp <code>for</code> khác, mỗi lần vòng ngoài nhích lên 1 bước thì vòng trong sẽ chạy trọn vẹn một chu kỳ từ đầu đến cuối (giống như kim giờ nhích 1 nấc thì kim phút phải quay đủ 60 vòng).</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Tính Lãi kép Sổ tiết kiệm Ngân hàng &amp; Chạy bộ quanh Sân vận động</h4>
    </div>
    <p>Hãy hình dung vòng lặp <code>for</code> qua hai tình huống quen thuộc:</p>
    <ul>
        <li><strong>Vận động viên chạy đủ 10 vòng sân:</strong>
            <ul>
                <li>Khởi tạo: Đứng ở vạch xuất phát (<code>vong = 1</code>).</li>
                <li>Điều kiện: Chưa vượt quá 10 vòng (<code>vong &lt;= 10</code>).</li>
                <li>Thực thi: Chạy hết 1 vòng sân.</li>
                <li>Bước nhảy: Đồng hồ bấm tăng thêm 1 vòng (<code>vong++</code>).</li>
            </ul>
        </li>
        <li><strong>Sổ tiết kiệm tính lãi kép hàng năm:</strong> Bạn gửi 100 triệu đồng với lãi suất 7%/năm trong 5 năm. Mỗi năm (mỗi lượt lặp <code>for</code> từ năm 1 đến năm 5), tiền lãi được cộng dồn thẳng vào vốn gốc để năm sau sinh lời nhiều hơn!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Lỗi vòng lặp vô tận (Infinite Loop):</strong> Nếu điều kiện lặp không bao giờ sai (ví dụ: <code>for (int i = 1; i &gt; 0; i++)</code>), chương trình sẽ treo cứng máy hoặc bị quá thời gian thực thi (Time Limit Exceeded).</li>
        <li><strong>Dư dấu chấm phẩy ngay sau <code>for(...);</code>:</strong> Viết <code>for (int i = 1; i &lt;= 5; i++);</code> sẽ khiến vòng lặp chạy rỗng không làm gì cả!</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong Bai toan tinh Lai kep gui tiet kiem Ngan hang trong 5 nam
    double tienGui = 100000000; // Von ban dau: 100 trieu VND
    double laiSuatNam = 0.07;   // Lai suat: 7% / nam
    int soNam = 5;

    cout << "=== BANG KE LAI KEP TIET KIEM NGAN HANG ===" << endl;
    cout << "Von ban dau: " << (long long)tienGui << " VND (Lai suat 7%/nam)" << endl;
    cout << "-------------------------------------------" << endl;

    for (int nam = 1; nam <= soNam; nam++) {
        double tienLai = tienGui * laiSuatNam;
        tienGui += tienLai; // Cong don lai vao goc
        cout << "Het nam " << nam << " -> Tong so du: " << (long long)tienGui << " VND" << endl;
    }
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
            description: "Xử lý các bài toán lặp theo điều kiện sự kiện chưa biết trước số lần kết thúc bằng while và do-while.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Khi nào dùng <code>while</code> thay vì <code>for</code>?</h3>
<p>Trong thực tế, có rất nhiều tình huống ta <strong>không thể biết trước chính xác cần lặp bao nhiêu lần</strong>, mà chỉ biết điều kiện để dừng lại: <em>Đọc file dữ liệu cho tới khi hết dòng; Cho khách nhập lại mật khẩu cho đến khi đúng; Trừ dần số dư cho đến khi hết tiền...</em> Đó là lúc <code>while</code> và <code>do-while</code> phát huy tác dụng.</p>

<h3>2. Phân biệt <code>while</code> (Kiểm tra trước) và <code>do-while</code> (Làm trước, kiểm tra sau)</h3>
<ul>
    <li><strong>Vòng lặp <code>while (điều_kiện) { ... }</code>:</strong> Kiểm tra điều kiện ngay ở cửa. Nếu điều kiện sai ngay từ đầu, khối lệnh bên trong sẽ <strong>không chạy dù chỉ 1 lần</strong> (Số lần chạy tối thiểu: <code>0</code>).</li>
    <li><strong>Vòng lặp <code>do { ... } while (điều_kiện);</code>:</strong> Cứ thực hiện khối lệnh bên trong <strong>ít nhất 1 lần trước</strong>, sau đó mới kiểm tra điều kiện ở cuối để quyết định có lặp tiếp hay không (Số lần chạy tối thiểu: <code>1</code>).</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Cổng soát vé Tàu điện (while) vs Mở khóa Mã PIN Điện thoại (do-while)</h4>
    </div>
    <p>Sự khác biệt giữa <code>while</code> và <code>do-while</code> thể hiện rất rõ qua 2 thiết bị hàng ngày:</p>
    <ul>
        <li><strong>Cổng soát vé tàu điện Metro (<code>while</code> — Kiểm tra trước, hành động sau):</strong> Khi bạn chạm thẻ vào cổng, hệ thống kiểm tra <code>while (soDuThe &gt;= giaVe)</code> trước. Nếu thẻ hết tiền ngay từ đầu, cửa chắn không mở lần nào.</li>
        <li><strong>Màn hình nhập mật khẩu mở khóa điện thoại (<code>do-while</code> — Hành động trước, kiểm tra sau):</strong> Điện thoại bắt buộc phải hiện bàn phím cho bạn nhập mật khẩu <strong>ít nhất 1 lần trước</strong> (<code>do</code>). Sau khi bạn bấm xong, máy mới kiểm tra <code>while (matKhauNhap != matKhauDung)</code> để yêu cầu bạn nhập lại nếu sai!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Quên thay đổi biến điều kiện bên trong <code>while</code>:</strong> Khác với <code>for</code> có sẵn ô bước nhảy, trong <code>while</code> bạn phải tự viết lệnh cập nhật biến (ví dụ <code>n /= 10;</code> hoặc <code>soLanThu++;</code>), nếu quên vòng lặp sẽ chạy mãi mãi.</li>
        <li><strong>Quên dấu chấm phẩy <code>;</code> cuối dòng <code>while (điều_kiện);</code> của cấu trúc <code>do-while</code>.</strong></li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong Tiet kiem tien mua Laptop 20 trieu VND
    long long mucTieu = 20000000;
    long long quyTietKiem = 0;
    long long tietKiemMoiThang = 3500000;
    int soThang = 0;

    // Chua biet can bao nhieu thang, lap cho den khi du muc tieu
    while (quyTietKiem < mucTieu) {
        soThang++;
        quyTietKiem += tietKiemMoiThang;
        cout << "Thang thu " << soThang << ": Da tich luy duoc " << quyTietKiem << " VND" << endl;
    }

    cout << "=> Chuc mung! Ban can " << soThang << " thang de du tien mua Laptop!" << endl;
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
            description: "Kiểm soát linh hoạt dòng chảy vòng lặp: Dừng khẩn cấp với break hoặc bỏ qua trường hợp ngoại lệ với continue.",
            level: "Trung bình",
            duration: "20 phút",
            content: `
<h3>1. Lệnh <code>break</code> — Phanh khẩn cấp thoát khỏi vòng lặp</h3>
<p>Thông thường, vòng lặp chỉ dừng khi điều kiện lặp bị sai. Tuy nhiên, nếu bạn đang tìm kiếm một món đồ trong 1.000 chiếc hộp và đã tìm thấy nó ngay ở chiếc hộp thứ 5, việc mở tiếp 995 chiếc hộp còn lại là vô ích! Câu lệnh <strong><code>break;</code></strong> giúp chương trình <strong>dừng và thoát ngay lập tức</strong> khỏi vòng lặp chứa nó để tiết kiệm thời gian xử lý.</p>

<h3>2. Lệnh <code>continue</code> — Bỏ qua lượt hiện tại, đi tiếp lượt sau</h3>
<p>Ngược lại với <code>break</code> (dừng hẳn cả vòng lặp), câu lệnh <strong><code>continue;</code></strong> chỉ <strong>bỏ qua các câu lệnh phía dưới nó trong lượt lặp hiện tại</strong> và nhảy thẳng sang lượt lặp kế tiếp.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Dây chuyền Kiểm định chất lượng Sản phẩm trong Nhà máy</h4>
    </div>
    <p>Hãy tưởng tượng một <strong>băng chuyền đóng gói 100 chai nước ngọt trong nhà máy</strong>:</p>
    <ul>
        <li><strong>Lệnh <code>continue</code> (Loại bỏ sản phẩm lỗi lẻ tẻ):</strong> Khi cảm biến phát hiện chai thứ 15 bị lệch nhãn dán, cánh tay robot gạt chai thứ 15 ra khỏi băng chuyền (bỏ qua khâu đóng nắp cho chai đó) rồi <strong>băng chuyền vẫn tiếp tục chạy sang chai thứ 16, 17...</strong> bình thường.</li>
        <li><strong>Lệnh <code>break</code> (Nút dừng khẩn cấp toàn bộ dây chuyền):</strong> Nếu cảm biến phát hiện có dị vật nguy hiểm hoặc chập điện động cơ ở chai thứ 40, hệ thống kích hoạt <code>break</code> — <strong>ngắt toàn bộ băng chuyền ngay lập tức</strong> để kỹ sư kiểm tra!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Trong vòng lặp lồng nhau:</strong> Lệnh <code>break</code> hoặc <code>continue</code> chỉ tác động lên <strong>vòng lặp gần nhất bao quanh nó</strong> chứ không thoát một lúc cả 2 vòng lặp trong và ngoài.</li>
        <li><strong>Cẩn thận khi dùng <code>continue</code> trong vòng lặp <code>while</code>:</strong> Hãy đảm bảo biến đếm đã được tăng trước khi gọi <code>continue</code>, nếu không chương trình sẽ lặp lại mãi một giá trị!</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong Day chuyen kiem tra 8 kien hang (So am = Hang hong, So 999 = Loi he thong)
    int kienHang[8] = {120, 150, -1, 200, 180, 999, 130, 160};
    int tongKhoiLuong = 0;

    cout << "=== HE THONG QUET KIEN HANG TU DONG ===" << endl;
    for (int i = 0; i < 8; i++) {
        if (kienHang[i] == -1) {
            cout << "[Canh bao] Kien hang #" << (i + 1) << " bi loi bao bi -> Bo qua (continue)!" << endl;
            continue; // Bo qua kien hang hong, quet tiep kien sau
        }
        if (kienHang[i] == 999) {
            cout << "[NGUY HIEM] Kien hang #" << (i + 1) << " qua tai -> Dung bang chuyen (break)!" << endl;
            break; // Dung han day chuyen
        }
        tongKhoiLuong += kienHang[i];
        cout << "Kien hang #" << (i + 1) << " hop le (" << kienHang[i] << "g) -> Da dong goi." << endl;
    }

    cout << "Tong khoi luong hang da dong goi an toan: " << tongKhoiLuong << "g" << endl;
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
            description: "Chia để trị: Đóng gói mã nguồn thành các hàm chuyên biệt tái sử dụng và phân biệt Tham trị với Tham chiếu (&).",
            level: "Trung bình",
            duration: "35 phút",
            content: `
<h3>1. Tại sao phải chia chương trình thành các Hàm (Functions)?</h3>
<p>Một phần mềm thực tế có hàng chục nghìn dòng lệnh. Nếu nhồi nhét tất cả vào trong <code>main()</code>, code sẽ rối như tơ vò và phải viết đi viết lại cùng một công thức nhiều lần. <strong>Hàm (Function)</strong> là một khối lệnh độc lập có tên riêng, nhận đầu vào (tham số), xử lý công việc cụ thể và trả về kết quả (<code>return</code>). Nếu hàm chỉ thực hiện hành động (như in hóa đơn) mà không trả về số liệu, ta dùng kiểu <code>void</code>.</p>
<pre>kiểu_trả_về tên_hàm(kiểu_1 tham_số_1, kiểu_2 tham_số_2) {
    // Xử lý nghiệp vụ
    return kết_quả;
}</pre>

<h3>2. Sự khác biệt sống còn: Truyền Tham trị vs Truyền Tham chiếu (<code>&amp;</code>)</h3>
<ul>
    <li><strong>Truyền tham trị (Pass by Value — Mặc định):</strong> Ví dụ <code>void tangLuong(int luong)</code>. Máy tính tạo ra một <strong>bản sao (photocopy)</strong> của biến truyền vào. Mọi chỉnh sửa bên trong hàm chỉ làm thay đổi tờ giấy photocopy, còn biến gốc trong <code>main()</code> vẫn giữ nguyên giá trị cũ!</li>
    <li><strong>Truyền tham chiếu (Pass by Reference — Có dấu <code>&amp;</code>):</strong> Ví dụ <code>void tangLuong(int &amp;luong)</code>. Hàm làm việc <strong>trực tiếp trên biến gốc</strong> trong bộ nhớ. Mọi thay đổi bên trong hàm sẽ cập nhật thẳng vào biến gốc ngoài <code>main()</code>!</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Gửi Bản Photocopy (Tham trị) vs Chia sẻ File Google Docs gốc (Tham chiếu &amp;)</h4>
    </div>
    <p>Hãy hình dung sự khác nhau giữa Tham trị và Tham chiếu qua cách làm việc văn phòng:</p>
    <ul>
        <li><strong>Truyền Tham trị (<code>int x</code>):</strong> Giống như bạn <em>in bản hợp đồng ra giấy photocopy</em> rồi đưa cho đồng nghiệp ghi chú. Đồng nghiệp có gạch xóa thế nào trên tờ bản sao đó thì <strong>tờ hợp đồng gốc trong tủ của bạn vẫn không hề thay đổi</strong>.</li>
        <li><strong>Truyền Tham chiếu (<code>int &amp;x</code>):</strong> Giống như bạn <em>gửi link tài liệu Google Docs quyền chỉnh sửa trực tiếp</em> hoặc đưa tận tay sổ tiết kiệm gốc cho nhân viên ngân hàng. Khi nhân viên ngân hàng cộng tiền lãi vào sổ, <strong>số dư thực tế của bạn thay đổi ngay lập tức</strong>!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Hàm phải được khai báo trước khi gọi:</strong> Trong C++, nếu bạn viết hàm ở phía dưới hàm <code>main()</code> mà không khai báo nguyên mẫu hàm (Function Prototype) ở trên đầu, trình biên dịch sẽ báo lỗi không nhận diện được tên hàm.</li>
        <li><strong>Quên dấu <code>&amp;</code> khi viết hàm hoán đổi (<code>swap</code>) hoặc hàm cập nhật số dư:</strong> Đây là lỗi kinh điển khiến hàm chạy xong mà dữ liệu không hề thay đổi!</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

// Ham tinh thue VAT (Truyen tham tri: chi doc gia tri de tinh toan)
double tinhThueVAT(double giaGoc) {
    return giaGoc * 0.08;
}

// Ham nap tien vao Vi dien tu (Truyen tham chieu &: cap nhat truc tiep so du goc)
void napTienVaoVi(long long &soDuVi, long long soTienNap) {
    soDuVi += soTienNap;
}

int main() {
    long long soDuMoMo = 500000;
    cout << "So du Vi MoMo ban dau : " << soDuMoMo << " VND" << endl;

    // Goi ham nap them 200.000 VND (tac dong truc tiep len bien soDuMoMo)
    napTienVaoVi(soDuMoMo, 200000);
    cout << "So du sau khi nap tien: " << soDuMoMo << " VND" << endl;

    double donHang = 300000;
    cout << "Thue VAT (8%) cua don hang 300k: " << tinhThueVAT(donHang) << " VND" << endl;
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
            description: "Khám phá kỹ thuật Nạp chồng hàm (Function Overloading) đa hình tĩnh và tư duy giải bài toán Đệ quy.",
            level: "Trung bình",
            duration: "35 phút",
            content: `
<h3>1. Nạp chồng hàm (Function Overloading) — Cùng tên, đa năng</h3>
<p>Trong C++, bạn được phép đặt <strong>nhiều hàm trùng tên nhau</strong> miễn là chúng <strong>khác nhau về số lượng tham số hoặc kiểu dữ liệu tham số</strong>. Trình biên dịch sẽ tự động nhìn vào các đối số bạn truyền vào lúc gọi hàm để chọn đúng phiên bản hàm tương ứng.</p>
<pre>double tinhPhiShip(double khoiLuongKg);                  // Giao hàng nội thành
double tinhPhiShip(double khoiLuongKg, double soKmXa);   // Giao hàng liên tỉnh</pre>

<h3>2. Đệ quy (Recursion) — Hàm tự gọi lại chính nó</h3>
<p>Một hàm được gọi là <strong>đệ quy</strong> khi bên trong thân hàm lại có lời gọi đến chính hàm đó để giải quyết bài toán con nhỏ hơn. Mọi hàm đệ quy bắt buộc phải có đủ <strong>2 phần sống còn</strong>:</p>
<ul>
    <li><strong>Điều kiện dừng (Base Case):</strong> Trường hợp nhỏ nhất đã biết sẵn đáp án, giúp dừng việc gọi hàm tiếp. Nếu thiếu Base Case, hàm sẽ gọi vô tận gây lỗi tràn bộ nhớ ngăn xếp (<strong>Stack Overflow</strong>).</li>
    <li><strong>Bước thu nhỏ đệ quy (Recursive Step):</strong> Biến đổi bài toán kích thước <code>n</code> về bài toán kích thước nhỏ hơn (<code>n - 1</code>).</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Búp bê gỗ Nga Matryoshka (Đệ quy) &amp; Nút "Thanh toán" đa phương thức (Overloading)</h4>
    </div>
    <p>Hai kỹ thuật trong bài học này gắn liền với những hình ảnh rất gần gũi:</p>
    <ul>
        <li><strong>Nạp chồng hàm (Overloading):</strong> Giống như hành động <em>"Thanh toán"</em> tại siêu thị: Dù bạn đưa <code>thanhToan(tienMat)</code>, hay quẹt thẻ <code>thanhToan(maThe, maPIN)</code>, hay quét QR <code>thanhToan(maQR, appNganHang)</code> thì cùng một tên hành động "Thanh toán" đều xử lý trơn tru tùy theo thứ bạn đưa vào!</li>
        <li><strong>Đệ quy (Recursion):</strong> Giống như việc mở một bộ <em>Búp bê gỗ Nga Matryoshka</em> lồng vào nhau: Mở con búp bê lớn thứ <code>n</code> sẽ thấy con búp bê nhỏ hơn <code>n - 1</code> bên trong (Bước đệ quy), cứ mở tiếp tục như vậy cho đến khi gặp con búp bê gỗ đặc nhỏ nhất ở trong cùng không thể mở tiếp được nữa (<strong>Base Case — Điều kiện dừng</strong>)!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Nạp chồng hàm KHÔNG phân biệt qua kiểu trả về:</strong> Hai hàm chỉ khác nhau mỗi kiểu trả về (ví dụ <code>int tong(int a)</code> và <code>double tong(int a)</code>) sẽ báo lỗi trùng lặp.</li>
        <li><strong>Đệ quy quá sâu gây tốn RAM:</strong> Mỗi lần gọi đệ quy sẽ tốn một khung nhớ trên Stack. Với <code>n</code> rất lớn (hàng triệu), nên ưu tiên dùng vòng lặp hoặc Quy hoạch động.</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

// 1. Nap chong ham (Overloading): Tinh cuoc van chuyen Giao Hang Nhanh
double tinhCuocShip(double soKg) {
    // Goi noi thanh: Dong gia 15.000d + 5.000d moi kg
    return 15000 + soKg * 5000;
}

double tinhCuocShip(double soKg, int khoangCachKm) {
    // Goi lien tinh: Tinh them phu phi khoang cach 2.000d / km
    return 15000 + soKg * 5000 + khoangCachKm * 2000;
}

// 2. Ham De quy (Recursion): Tinh tong tien li xi tich luy tu ngay 1 den ngay n
int tongLiXiDeQuy(int ngay) {
    if (ngay <= 1) return 10000; // Base case: Ngay mung 1 nhan 10.000d
    return (ngay * 10000) + tongLiXiDeQuy(ngay - 1);
}

int main() {
    cout << "=== 1. NAP CHONG HAM TINH CUOC SHIP ===" << endl;
    cout << "Ship noi thanh (2.5 kg)         : " << tinhCuocShip(2.5) << " VND" << endl;
    cout << "Ship lien tinh (2.5 kg, 30 km)  : " << tinhCuocShip(2.5, 30) << " VND" << endl;

    cout << "\n=== 2. DE QUY TINH TIEN LI XI 5 NGAY TET ===" << endl;
    cout << "Tong li xi sau 5 ngay Tet: " << tongLiXiDeQuy(5) << " VND" << endl;
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
            description: "Quản lý hàng loạt dữ liệu cùng kiểu trong một dãy ô nhớ liên tiếp bằng Mảng một chiều (1D Array).",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Tại sao cần Mảng một chiều (1D Array)?</h3>
<p>Giả sử bạn cần lưu điểm thi của 50 học sinh trong lớp. Nếu dùng biến rời rạc, bạn phải khai báo <code>diem1, diem2, ..., diem50</code> — cực kỳ thủ công và không thể dùng vòng lặp để xử lý! <strong>Mảng 1 chiều</strong> giải quyết triệt để vấn đề này bằng cách gom tất cả các phần tử có <strong>cùng kiểu dữ liệu</strong> vào một dãy các ô nhớ <strong>nằm liền kề nhau trong RAM</strong> dưới một cái tên chung duy nhất.</p>
<pre>kiểu_dữ_liệu tên_mảng[số_lượng_phần_tử];
double nhietDoTuan[7] = {28.5, 30.0, 31.2, 29.8, 27.5, 26.0, 29.0};</pre>

<h3>2. Quy tắc đánh chỉ số từ <code>0</code> (Zero-based Indexing)</h3>
<ul>
    <li>Trong C++, phần tử đầu tiên của mảng có kích thước <code>N</code> luôn bắt đầu tại vị trí <strong><code>0</code></strong> (<code>arr[0]</code>), và phần tử cuối cùng nằm tại vị trí <strong><code>N - 1</code></strong> (<code>arr[N - 1]</code>).</li>
    <li>Nhờ các ô nhớ nằm sát cạnh nhau liên tiếp, máy tính có thể truy cập thẳng tới bất kỳ phần tử <code>arr[i]</code> nào chỉ trong 1 phép tính địa chỉ tức thời <strong>O(1)</strong>!</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Hộp chia thuốc 7 ngày trong tuần &amp; Tủ gửi đồ Siêu thị đánh số</h4>
    </div>
    <p>Mảng một chiều trong đời thực chính là những dãy ngăn chứa đồng nhất nằm liền kề nhau:</p>
    <ul>
        <li><strong>Hộp chia thuốc 7 ngăn (Thứ Hai đến Chủ Nhật):</strong> Cả 7 ngăn gắn liền thành một thanh nhựa dài tên là <code>hopThuoc[7]</code>. Ngăn đầu tiên là <code>hopThuoc[0]</code>, ngăn cuối cùng là <code>hopThuoc[6]</code>. Mỗi ngày bạn chỉ cần mở đúng ngăn thứ <code>i</code> để uống.</li>
        <li><strong>Bảng theo dõi Chi tiêu 7 ngày trên ứng dụng Ngân hàng:</strong> Lưu số tiền bạn tiêu mỗi ngày vào mảng <code>chiTieu[7]</code> để cuối tuần dùng vòng lặp <code>for</code> cộng tổng và tính trung bình chi tiêu/ngày.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Lỗi tràn chỉ số mảng (Index Out of Bounds):</strong> Khi khai báo <code>int a[5];</code>, các vị trí hợp lệ chỉ từ <code>a[0]</code> đến <code>a[4]</code>. Nếu bạn cố tình truy cập <code>a[5]</code>, chương trình sẽ đọc/ghi đè vào vùng nhớ lạ gây lỗi sập chương trình (Segmentation Fault) hoặc sai kết quả ngầm!</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong Quan ly chi tieu ca nhan 7 ngay trong tuan (don vi: nghin dong)
    int chiTieu[7] = {85, 120, 60, 95, 150, 210, 180};
    int tongChiTieu = 0;
    int ngayTieuNhieuNhat = 0;

    cout << "=== BAO CAO CHI TIEU 7 NGAY TRONG TUAN ===" << endl;
    for (int i = 0; i < 7; i++) {
        cout << "Ngay thu " << (i + 2 <= 7 ? i + 2 : 8) << ": " << chiTieu[i] << ".000 VND" << endl;
        tongChiTieu += chiTieu[i];
        if (chiTieu[i] > chiTieu[ngayTieuNhieuNhat]) {
            ngayTieuNhieuNhat = i;
        }
    }

    cout << "------------------------------------------" << endl;
    cout << "Tong chi tieu ca tuan : " << tongChiTieu << ".000 VND" << endl;
    cout << "Trung binh moi ngay   : " << (tongChiTieu / 7) << ".000 VND" << endl;
    cout << "Muc chi cao nhat ngay : " << chiTieu[ngayTieuNhieuNhat] << ".000 VND" << endl;
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
            description: "Làm chủ 3 bài toán cốt lõi trên mảng: Tìm cực trị (Max/Min), Tìm kiếm tuyến tính và Sắp xếp tăng/giảm dần.",
            level: "Trung bình",
            duration: "35 phút",
            content: `
<h3>1. Thuật toán Tìm giá trị Lớn nhất (Max) &amp; Nhỏ nhất (Min)</h3>
<p>Ý tưởng chuẩn mực: Giả sử phần tử đầu tiên <code>a[0]</code> đang là "nhà vô địch" tạm thời (<code>maxVal = a[0]</code>). Sau đó cho vòng lặp duyệt từ phần tử thứ hai (<code>i = 1</code>) đến cuối mảng: hễ gặp phần tử <code>a[i]</code> nào lớn hơn <code>maxVal</code> thì trao lại ngôi vô địch cho nó (<code>maxVal = a[i]</code>).</p>

<h3>2. Thuật toán Tìm kiếm tuyến tính (Linear Search)</h3>
<p>Duyệt tuần tự từng phần tử từ đầu mảng đến cuối mảng để kiểm tra xem có phần tử nào bằng giá trị <code>X</code> cần tìm hay không. Nếu khớp thì trả về vị trí <code>i</code> và dùng <code>break</code> dừng tìm kiếm.</p>

<h3>3. Thuật toán Sắp xếp nổi bọt / Đổi chỗ (Bubble &amp; Selection Sort)</h3>
<p>Sử dụng 2 vòng lặp lồng nhau để so sánh các cặp phần tử. Nếu phần tử đứng trước lại lớn hơn phần tử đứng sau (<code>a[i] &gt; a[j]</code>), ta thực hiện <strong>hoán đổi vị trí (swap)</strong> thông qua một biến trung gian <code>temp</code> để đưa các giá trị nhỏ về đầu mảng, giá trị lớn về cuối mảng.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Bộ lọc "Giá từ Thấp đến Cao" trên Shopee/Tiki &amp; Xếp hàng Chào cờ</h4>
    </div>
    <p>Các thuật toán mảng bạn vừa học chính là bộ máy vận hành các tính năng quen thuộc hàng ngày:</p>
    <ul>
        <li><strong>Tìm Min/Max ngoài thực tế:</strong> Khi bạn tìm vé máy bay trên Traveloka và chọn <em>"Vé rẻ nhất trong tháng"</em>, hệ thống chạy thuật toán tìm <code>Min</code> trên mảng giá vé.</li>
        <li><strong>Hoán đổi 2 biến qua biến tạm <code>temp</code>:</strong> Giống như khi bạn có <em>1 ly nước Cam</em> và <em>1 ly nước Táo</em> muốn đổi cốc cho nhau — bạn bắt buộc phải lấy thêm <strong>1 chiếc cốc rỗng thứ 3 (biến <code>temp</code>)</strong> để rót tạm nước Cam sang trước!</li>
        <li><strong>Sắp xếp mảng tăng dần:</strong> Chính là nút <em>"Sắp xếp theo Giá: Thấp đến Cao"</em> trên sàn thương mại điện tử hoặc cách giáo viên thể dục xếp hàng học sinh từ thấp đến cao.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Đừng khởi tạo <code>maxVal = 0</code> hoặc <code>minVal = 0</code>:</strong> Nếu cả mảng toàn số âm (ví dụ nhiệt độ mùa đông <code>{-5, -12, -3}</code>), khởi tạo <code>maxVal = 0</code> sẽ trả về kết quả sai là <code>0</code>! Hãy luôn khởi tạo <code>maxVal = a[0]</code>.</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong Tinh nang "Loc gia tu Thap den Cao" tren san Thuong mai dien tu
    int giaSanPham[5] = {450, 199, 890, 120, 320}; // Don vi: nghin VND
    int n = 5;

    // 1. Tim san pham re nhat (Min) va dat nhat (Max)
    int giaReNhat = giaSanPham[0];
    int giaDatNhat = giaSanPham[0];
    for (int i = 1; i < n; i++) {
        if (giaSanPham[i] < giaReNhat) giaReNhat = giaSanPham[i];
        if (giaSanPham[i] > giaDatNhat) giaDatNhat = giaSanPham[i];
    }

    // 2. Sap xep bang gia tang dan (Tu thap den cao)
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (giaSanPham[i] > giaSanPham[j]) {
                int temp = giaSanPham[i];
                giaSanPham[i] = giaSanPham[j];
                giaSanPham[j] = temp;
            }
        }
    }

    cout << "=== BO LOC GIA SAN PHAM SHOPEE C++ ===" << endl;
    cout << "San pham re nhat : " << giaReNhat << ".000 VND" << endl;
    cout << "San pham dat nhat: " << giaDatNhat << ".000 VND" << endl;
    cout << "Danh sach gia tu Thap -> Cao: ";
    for (int i = 0; i < n; i++) {
        cout << giaSanPham[i] << "k ";
    }
    cout << endl;
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
            description: "Xử lý văn bản chuyên nghiệp với thư viện std::string: nhập chuỗi có khoảng trắng, kiểm tra mật khẩu và chuẩn hóa tên.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Bản chất của lớp <code>std::string</code> trong C++</h3>
<p>Khai báo thư viện <code>#include &lt;string&gt;</code> mang đến cho bạn kiểu dữ liệu <code>string</code> — về bản chất là một mảng ký tự động thông minh có khả năng tự co giãn kích thước và tích hợp sẵn hàng chục hàm xử lý văn bản mạnh mẽ.</p>

<h3>2. Các thao tác cốt lõi trên <code>std::string</code></h3>
<ul>
    <li><strong>Đo độ dài chuỗi:</strong> Dùng <code>s.length()</code> hoặc <code>s.size()</code> để biết chuỗi có bao nhiêu ký tự (kể cả dấu cách).</li>
    <li><strong>Truy cập từng ký tự:</strong> Giống hệt mảng 1 chiều, <code>s[i]</code> trả về ký tự kiểu <code>char</code> tại vị trí <code>i</code> (từ <code>0</code> đến <code>s.length() - 1</code>).</li>
    <li><strong>Ghép nối chuỗi &amp; So sánh:</strong> Dùng trực tiếp dấu <code>+</code> để nối 2 chuỗi (<code>ho + " " + ten</code>) và dấu <code>==</code> để kiểm tra hai chuỗi có giống hệt nhau không.</li>
    <li><strong>Nhập cả dòng có dấu cách:</strong> Dùng <code>getline(cin, s);</code> thay vì <code>cin &gt;&gt; s;</code> để đọc trọn vẹn họ tên, địa chỉ nhà hoặc câu văn.</li>
    <li><strong>Cắt &amp; Tìm kiếm chuỗi con:</strong> <code>s.substr(vi_tri, so_ky_tu)</code> để trích xuất chuỗi con; <code>s.find("tu_khoa")</code> để tìm vị trí xuất hiện.</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Kiểm tra độ mạnh Mật khẩu Ngân hàng &amp; Tự động tạo Email Sinh viên</h4>
    </div>
    <p>Xử lý chuỗi <code>std::string</code> xuất hiện ở mọi biểu mẫu đăng ký tài khoản ngoài đời thực:</p>
    <ul>
        <li><strong>Kiểm tra độ mạnh mật khẩu khi đăng ký tài khoản:</strong> Hệ thống kiểm tra <code>matKhau.length() &gt;= 8</code> và duyệt vòng lặp qua từng ký tự <code>matKhau[i]</code> xem có chứa ít nhất 1 chữ cái in hoa (<code>'A'..'Z'</code>) và 1 chữ số (<code>'0'..'9'</code>) hay không.</li>
        <li><strong>Hệ thống tự động cấp Email trường Đại học:</strong> Ghép mã số sinh viên với tên miền trường bằng phép cộng chuỗi: <code>email = maSV + "@student.edu.vn"</code>.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Lỗi trôi lệnh <code>getline()</code> sau <code>cin &gt;&gt;</code>:</strong> Khi bạn dùng <code>cin &gt;&gt; tuoi;</code> rồi gọi ngay <code>getline(cin, hoTen);</code>, phím Enter còn sót lại trong bộ đệm sẽ khiến <code>getline</code> đọc chuỗi rỗng! Cách khắc phục: Gọi <code>cin.ignore();</code> trước <code>getline</code>.</li>
    </ul>
</div>`,
            example: `#include <iostream>
#include <string>
using namespace std;

int main() {
    // Mo phong He thong Kiem tra Do bao mat Mat khau & Cap Email Sinh vien
    string hoTen = "Le Trung Hau";
    string maSV = "B24DCCN001";
    string matKhau = "CppAcademy2026";

    // Ghep chuoi tao email tu dong
    string emailTruong = maSV + "@codelearn.edu.vn";

    // Duyet chuoi kiem tra so ky tu in hoa va chu so trong mat khau
    int soChuHoa = 0, soChuSo = 0;
    for (int i = 0; i < (int)matKhau.length(); i++) {
        if (matKhau[i] >= 'A' && matKhau[i] <= 'Z') soChuHoa++;
        if (matKhau[i] >= '0' && matKhau[i] <= '9') soChuSo++;
    }

    cout << "=== HE THONG TAI KHOAN SINH VIEN ===" << endl;
    cout << "Ho va ten      : " << hoTen << " (" << hoTen.length() << " ky tu)" << endl;
    cout << "Email cap phat : " << emailTruong << endl;
    cout << "Do dai mat khau: " << matKhau.length() << " ky tu (" << soChuHoa << " chu hoa, " << soChuSo << " chu so)" << endl;
    cout << "Danh gia       : " << (matKhau.length() >= 8 && soChuHoa > 0 && soChuSo > 0 ? "Mat khau Manh (Hop le)" : "Mat khau Yeu") << endl;
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
            description: "Biểu diễn bảng tính, bản đồ tọa độ, ảnh kỹ thuật số và sơ đồ ghế ngồi bằng Mảng hai chiều (Ma trận 2D).",
            level: "Trung bình",
            duration: "35 phút",
            content: `
<h3>1. Mảng hai chiều (2D Array / Matrix) là gì?</h3>
<p>Nếu mảng 1 chiều là một hàng ghế thẳng tắp, thì <strong>Mảng 2 chiều</strong> chính là một <strong>bảng lưới gồm nhiều Hàng (Rows) và nhiều Cột (Columns)</strong>. Cú pháp khai báo:</p>
<pre>kiểu_dữ_liệu tên_mảng[SỐ_HÀNG][SỐ_CỘT];</pre>
<p>Để xác định một ô trong bảng, ta luôn chỉ định <strong>toạ độ Hàng trước, Cột sau</strong>: <code>a[hang][cot]</code> (hàng chạy từ <code>0</code> đến <code>SO_HANG - 1</code>, cột chạy từ <code>0</code> đến <code>SO_COT - 1</code>).</p>

<h3>2. Kỹ thuật duyệt Ma trận bằng 2 vòng lặp <code>for</code> lồng nhau</h3>
<ul>
    <li><strong>Vòng lặp ngoài (<code>i</code>):</strong> Di chuyển qua từng hàng từ trên xuống dưới.</li>
    <li><strong>Vòng lặp trong (<code>j</code>):</strong> Tại mỗi hàng <code>i</code>, quét qua từng cột <code>j</code> từ trái sang phải để xử lý ô <code>a[i][j]</code>.</li>
    <li><strong>Đường chéo chính của ma trận vuông (<code>N × N</code>):</strong> Gồm các phần tử có chỉ số hàng bằng chỉ số cột (<code>a[i][i]</code>).</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Sơ đồ đặt ghế Rạp chiếu phim CGV &amp; Bảng tính Excel / Điểm ảnh màn hình</h4>
    </div>
    <p>Mảng hai chiều là cấu trúc dữ liệu nền tảng của rất nhiều ứng dụng trực quan:</p>
    <ul>
        <li><strong>Sơ đồ ghế ngồi rạp chiếu phim hoặc khoang máy bay:</strong> Rạp phim có các hàng ghế A, B, C, D (Hàng <code>0, 1, 2, 3</code>) và các số ghế trong mỗi hàng 1, 2, 3, 4, 5 (Cột <code>0..4</code>). Ô <code>ghe[2][3] = 1</code> nghĩa là ghế Hàng 2 - Cột 3 đã có người đặt, còn <code>= 0</code> nghĩa là ghế đang trống!</li>
        <li><strong>Màn hình Điện thoại / Tivi &amp; Ảnh kỹ thuật số:</strong> Một bức ảnh Full HD thực chất là mảng 2 chiều kích thước <code>1080 hàng × 1920 cột</code> các điểm ảnh (pixels).</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Nhầm lẫn giữa chỉ số Hàng và Cột:</strong> Khi khai báo <code>int a[3][5];</code> (3 hàng, 5 cột), vòng lặp ngoài phải chạy đến <code>&lt; 3</code> và vòng lặp trong chạy đến <code>&lt; 5</code>. Đảo ngược hai con số này sẽ gây lỗi truy cập ngoài vùng nhớ!</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong So do ghe ngoi Rap chieu phim (3 hang x 4 cot)
    // Quy uoc: 0 = Ghe trong, 1 = Ghe da dat
    int rapPhim[3][4] = {
        {1, 1, 0, 0},
        {0, 1, 1, 1},
        {0, 0, 0, 1}
    };

    int gheTrong = 0, gheDaDat = 0;

    cout << "=== SO DO GHE RAP CHIEU PHIM (1: Da dat, 0: Trong) ===" << endl;
    for (int hang = 0; hang < 3; hang++) {
        cout << "Hang " << (char)('A' + hang) << ": ";
        for (int cot = 0; cot < 4; cot++) {
            cout << "[" << rapPhim[hang][cot] << "] ";
            if (rapPhim[hang][cot] == 0) gheTrong++;
            else gheDaDat++;
        }
        cout << endl;
    }

    cout << "------------------------------------------------------" << endl;
    cout << "So ghe da ban: " << gheDaDat << " ve | So ghe con trong: " << gheTrong << " ghe" << endl;
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
            description: "Làm chủ vũ khí mạnh nhất của C++: Địa chỉ bộ nhớ RAM, toán tử lấy địa chỉ (&) và toán tử giải tham chiếu (*).",
            level: "Nâng cao",
            duration: "35 phút",
            content: `
<h3>1. Địa chỉ ô nhớ trong RAM &amp; Toán tử lấy địa chỉ <code>&amp;</code></h3>
<p>Bộ nhớ RAM của máy tính giống như một con phố dài gồm hàng tỷ căn phòng được đánh số thứ tự hệ thập lục phân (ví dụ: <code>0x7ffee3b4c8a4</code>). Khi bạn khai báo <code>int soDu = 500;</code>, biến <code>soDu</code> được cấp một căn phòng cụ thể. Để hỏi máy tính xem biến <code>soDu</code> đang nằm ở địa chỉ nào, ta đặt dấu <strong><code>&amp;</code></strong> trước tên biến: <code>&amp;soDu</code>.</p>

<h3>2. Biến Con trỏ (Pointer) &amp; Toán tử giải tham chiếu <code>*</code></h3>
<ul>
    <li><strong>Khai báo con trỏ (<code>int* ptr = &amp;soDu;</code>):</strong> Con trỏ <code>ptr</code> không lưu con số 500 trực tiếp, mà nó <strong>lưu địa chỉ căn phòng của biến <code>soDu</code></strong>.</li>
    <li><strong>Toán tử giải tham chiếu (Dereference <code>*ptr</code>):</strong> Khi đặt dấu <code>*</code> trước tên con trỏ đã khởi tạo, bạn ra lệnh cho máy tính: <em>"Hãy đi tới đúng địa chỉ ghi trong <code>ptr</code> và mở cửa lấy/sửa giá trị bên trong căn phòng đó!"</em>. Do đó, gán <code>*ptr = 900;</code> sẽ làm cho biến <code>soDu</code> đổi thành <code>900</code> ngay lập tức!</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Tờ giấy ghi Địa chỉ Kho hàng &amp; Định vị GPS trên Google Maps</h4>
    </div>
    <p>Tại sao không bê nguyên cả kho hàng đi khắp nơi mà lại dùng Con trỏ?</p>
    <ul>
        <li><strong>Biến thông thường (<code>khoHang</code>):</strong> Chính là một <em>tòa nhà kho chứa đầy hàng hóa nặng hàng chục tấn</em> nằm cố định tại một vị trí.</li>
        <li><strong>Địa chỉ (<code>&amp;khoHang</code>):</strong> Là <em>tọa độ số nhà</em> (ví dụ: Số 128 đường Cầu Giấy).</li>
        <li><strong>Biến Con trỏ (<code>ptr</code>):</strong> Chính là <em>một mảnh giấy nhỏ gọn ghi tọa độ "Số 128 đường Cầu Giấy"</em>. Thay vì phải bê cả tòa nhà đi giao dịch, bạn chỉ cần trao mảnh giấy <code>ptr</code> nhẹ tênh!</li>
        <li><strong>Giải tham chiếu (<code>*ptr</code>):</strong> Là việc tài xế <em>nhìn địa chỉ trên mảnh giấy <code>ptr</code>, lái xe đến tận kho hàng đó để bốc dỡ hoặc thêm hàng mới vào kho</em>.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Con trỏ hoang (Wild Pointer) &amp; <code>nullptr</code>:</strong> Khai báo <code>int* p;</code> mà chưa trỏ vào biến hợp lệ nào rồi dùng <code>*p = 10;</code> sẽ làm sập chương trình ngay lập tức! Nếu con trỏ chưa trỏ đi đâu, hãy luôn gán <code>int* p = nullptr;</code>.</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong Dieu khien Nhiet do Dieu hoa thong minh qua Con tro Cam bien
    int nhietDoPhong = 28;            // Nhiet do thuc te trong phong (28 do C)
    int* dieuKhienTuXa = &nhietDoPhong; // Con tro luu dia chi o nho cua cam bien phong

    cout << "=== HE THONG DIEU HOA SMART HOME C++ ===" << endl;
    cout << "Nhiet do phong ban dau      : " << nhietDoPhong << " do C" << endl;
    cout << "Dia chi o nho cam bien RAM  : " << dieuKhienTuXa << endl;
    cout << "Doc nhiet do qua dieu khien : " << *dieuKhienTuXa << " do C" << endl;

    // Bam dieu khien ha nhiet do xuong 24 do C thong qua giai tham chieu *
    *dieuKhienTuXa = 24;

    cout << "----------------------------------------" << endl;
    cout << "Sau khi chinh tren dieu khien (*dieuKhienTuXa = 24):" << endl;
    cout << "Nhiet do phong thuc te hien tai: " << nhietDoPhong << " do C" << endl;
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
            description: "Quản lý linh hoạt vùng nhớ Heap khi chương trình đang chạy bằng toán tử new và chống rò rỉ bộ nhớ với delete.",
            level: "Nâng cao",
            duration: "35 phút",
            content: `
<h3>1. Hạn chế của Mảng tĩnh (Stack) &amp; Sức mạnh của Bộ nhớ động (Heap)</h3>
<p>Với mảng tĩnh thông thường (nằm trên vùng nhớ <strong>Stack</strong>), kích thước phải cố định từ lúc viết code. Nếu bạn khai báo <code>int khachHang[10000];</code> nhưng hôm đó quán chỉ có 5 khách thì lãng phí 9.995 ô nhớ; ngược lại nếu có 10.001 khách thì chương trình bị tràn! <strong>Cấp phát động trên vùng nhớ Heap</strong> cho phép chương trình hỏi số lượng thực tế <code>n</code> từ người dùng lúc đang chạy rồi mới xin hệ điều hành cấp đúng <code>n</code> ô nhớ vừa khít.</p>

<h3>2. Cặp toán tử <code>new</code> (Xin cấp phát) và <code>delete</code> (Trả lại bộ nhớ)</h3>
<ul>
    <li><strong>Cấp phát 1 biến đơn lẻ:</strong> <code>int* p = new int(100);</code> → Giải phóng bằng: <code>delete p;</code></li>
    <li><strong>Cấp phát mảng động <code>n</code> phần tử:</strong> <code>int* arr = new int[n];</code> → Giải phóng bằng: <code>delete[] arr;</code></li>
</ul>
<p><strong>Quy tắc bất di bất dịch trong C++:</strong> Vùng nhớ Heap không tự động biến mất khi hàm kết thúc. Mọi lệnh <code>new</code> bắt buộc phải có một lệnh <code>delete</code> (hoặc <code>delete[]</code>) tương ứng khi dùng xong!</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Đặt phòng Khách sạn theo Đoàn khách thực tế &amp; Trả phòng (Check-out)</h4>
    </div>
    <p>Cơ chế cấp phát động <code>new / delete</code> giống hệt quy trình <strong>thuê và trả phòng khách sạn</strong>:</p>
    <ul>
        <li><strong>Mảng tĩnh (Stack):</strong> Giống như công ty bạn mua đứt cố định 50 căn hộ quanh năm dù có lúc chỉ có 2 nhân viên đi công tác (rất lãng phí).</li>
        <li><strong>Lệnh <code>new int[n]</code> (Check-in):</strong> Đoàn khách đến quầy lễ tân báo chính xác hôm nay có <code>n</code> người. Lễ tân cấp đúng <code>n</code> chìa khóa phòng vừa đủ nhu cầu.</li>
        <li><strong>Lệnh <code>delete[] arr</code> (Check-out trả phòng):</strong> Khi đoàn khách rời đi, bạn phải làm thủ tục trả lại <code>n</code> phòng cho khách sạn để đón đoàn khác. Nếu bỏ về mà quên trả phòng, những phòng đó bị khóa chết mãi mãi — trong lập trình gọi là <strong>Rò rỉ bộ nhớ (Memory Leak)</strong> làm máy tính ngày càng chậm và treo cứng!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Dùng nhầm <code>delete arr;</code> thay vì <code>delete[] arr;</code> cho mảng động:</strong> Với mảng cấp phát bằng <code>new[]</code>, bắt buộc phải có cặp ngoặc vuông <code>delete[]</code> để giải phóng toàn bộ dãy phần tử.</li>
        <li><strong>Sau khi <code>delete p;</code> nên gán <code>p = nullptr;</code></strong> để tránh lỗi con trỏ treo (Dangling Pointer).</li>
    </ul>
</div>`,
            example: `#include <iostream>
using namespace std;

int main() {
    // Mo phong He thong Dat ban Tiec cuoi linh hoat theo so luong khach thuc te
    int soBanTiec = 4; // So luong ban thuc te khach dat luc chay chuong trinh

    // Xin cap phat dong mang luu so khach ngoi tai moi ban tren Heap
    int* dsBan = new int[soBanTiec];

    dsBan[0] = 10;
    dsBan[1] = 8;
    dsBan[2] = 10;
    dsBan[3] = 12;

    int tongKhach = 0;
    cout << "=== QUAN LY DAT BAN TIEC NHA HANG (DYNAMIC MEMORY) ===" << endl;
    for (int i = 0; i < soBanTiec; i++) {
        cout << "Ban tiec so " << (i + 1) << ": " << dsBan[i] << " khach" << endl;
        tongKhach += dsBan[i];
    }
    cout << "Tong so suat phuc vu: " << tongKhach << " khach" << endl;

    // Thu hoi va giai phong bo nho Heap sau khi tiec ket thuc
    delete[] dsBan;
    dsBan = nullptr;
    cout << "[He thong] Da giai phong bo nho (delete[]) an toan!" << endl;
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
            description: "Đóng gói nhiều thông tin khác kiểu dữ liệu của một thực thể đời thực vào một hồ sơ thống nhất với struct.",
            level: "Trung bình",
            duration: "30 phút",
            content: `
<h3>1. Tại sao Mảng chưa đủ và chúng ta cần <code>struct</code>?</h3>
<p>Mảng chỉ lưu được các phần tử <strong>cùng một kiểu dữ liệu</strong> (toàn số nguyên, hoặc toàn chuỗi). Nhưng ngoài đời thực, một đối tượng như <em>Sản phẩm trên Shopee</em> lại bao gồm nhiều thông tin khác kiểu đi liền với nhau: Tên sản phẩm (<code>string</code>), Giá bán (<code>double</code>), Số lượng tồn kho (<code>int</code>), Còn khuyến mãi không (<code>bool</code>). Từ khóa <strong><code>struct</code> (Structure)</strong> giúp bạn tự định nghĩa một kiểu dữ liệu tổng hợp mới gom tất cả các thuộc tính đó vào chung một gói!</p>
<pre>struct SanPham {
    string tenSP;
    double giaBan;
    int tonKho;
};</pre>

<h3>2. Khởi tạo &amp; Truy xuất thành viên bằng Toán tử dấu chấm (<code>.</code>)</h3>
<ul>
    <li>Sau khi định nghĩa khuôn mẫu <code>struct SanPham</code>, bạn có thể tạo ra các biến cụ thể: <code>SanPham sp1 = {"Ban phim Co", 850000, 15};</code> hoặc tạo cả một mảng các sản phẩm <code>SanPham khoHang[100];</code>.</li>
    <li>Sử dụng dấu chấm <code>.</code> để đọc hoặc gán từng thông tin bên trong: <code>sp1.giaBan = 790000;</code>.</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Thẻ Căn cước Công dân (CCCD) &amp; Hồ sơ Bệnh án Điện tử Bệnh viện</h4>
    </div>
    <p>Một <code>struct</code> trong C++ giống hệt <strong>một biểu mẫu hồ sơ hoặc tấm thẻ Căn cước công dân</strong>:</p>
    <ul>
        <li>Nếu không có tấm thẻ CCCD (<code>struct CongDan</code>), mỗi khi đi làm thủ tục bạn phải cầm rời rạc 4 mảnh giấy: mảnh ghi Họ tên, mảnh ghi Năm sinh, mảnh ghi Quê quán, mảnh ghi Số định danh — rất dễ thất lạc và nhầm thông tin người này sang người kia!</li>
        <li>Nhờ đóng gói thành một thẻ <code>struct CongDan</code> duy nhất, khi truyền hồ sơ của một người vào hàm xử lý, bạn chỉ cần truyền đúng 1 biến <code>congDanA</code> là mang theo đầy đủ mọi thông tin của người đó.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Quên dấu chấm phẩy <code>;</code> ngay sau dấu ngoặc nhọn đóng <code>};</code> của <code>struct</code>:</strong> Đây là lỗi cú pháp phổ biến nhất khi mới học <code>struct</code> và <code>class</code> trong C++.</li>
    </ul>
</div>`,
            example: `#include <iostream>
#include <string>
using namespace std;

// Dinh nghia kieu cau truc Ho so Benh nhan tai Benh vien
struct HoSoBenhNhan {
    string maBN;
    string hoTen;
    int namSinh;
    double nhietDoCoThe;
};

int main() {
    HoSoBenhNhan bn1 = {"BN2026", "Nguyen Minh Khang", 1998, 37.8};
    int namHienTai = 2026;
    int tuoi = namHienTai - bn1.namSinh;

    cout << "=== PHIEU KHAM BENH DIEN TU (STRUCT) ===" << endl;
    cout << "Ma benh nhan : " << bn1.maBN << endl;
    cout << "Ho va ten    : " << bn1.hoTen << " (" << tuoi << " tuoi)" << endl;
    cout << "Than nhiet   : " << bn1.nhietDoCoThe << " do C" << endl;
    cout << "Chan doan so : " << (bn1.nhietDoCoThe >= 37.5 ? "Co dau hieu sot - Can theo doi" : "Binh thuong") << endl;
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
            description: "Nắm vững nền tảng Lập trình Hướng đối tượng (OOP): Lớp, Đối tượng và Tính đóng gói bảo mật dữ liệu (Encapsulation).",
            level: "Nâng cao",
            duration: "35 phút",
            content: `
<h3>1. Tư duy Lập trình Hướng đối tượng (OOP): Class vs Object</h3>
<p>Nâng cấp từ <code>struct</code>, <strong>Lớp (<code>class</code>)</strong> không chỉ gom các dữ liệu (gọi là <strong>Thuộc tính - Attributes</strong>) mà còn đóng gói cả các hàm hành động (gọi là <strong>Phương thức - Methods</strong>) và cơ chế bảo mật vào chung một khối.</p>
<ul>
    <li><strong>Class (Lớp):</strong> Là <em>bản thiết kế khuôn mẫu</em> (chưa tốn bộ nhớ lưu trữ thực thể).</li>
    <li><strong>Object (Đối tượng):</strong> Là <em>sản phẩm thực tế cụ thể</em> được đúc ra từ bản thiết kế Class đó.</li>
</ul>

<h3>2. Tính Đóng gói (Encapsulation) — Tại sao cần <code>private</code> và <code>public</code>?</h3>
<ul>
    <li><strong><code>private</code> (Riêng tư — Mặc định của Class):</strong> Dữ liệu nhạy cảm bên trong đối tượng bị khóa kín, bên ngoài <strong>không thể tự ý truy cập hay sửa trực tiếp</strong> (ngăn chặn các thao tác bất hợp lệ như gán số dư ngân hàng thành số âm <code>-999999</code>).</li>
    <li><strong><code>public</code> (Công khai):</strong> Các phương thức giao tiếp hợp lệ (<code>napTien()</code>, <code>rutTien()</code>, <code>xemSoDu()</code> — hay các hàm Getter/Setter) được mở ra để bên ngoài tương tác có kiểm soát.</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Bản vẽ Thiết kế Ô tô (Class) vs Chiếc xe ngoài đời &amp; Két sắt Ngân hàng (private/public)</h4>
    </div>
    <p>Hai khái niệm cốt lõi của bài học này cực kỳ dễ hiểu khi nhìn ra thế giới xung quanh:</p>
    <ul>
        <li><strong>Class vs Object:</strong> Bản vẽ kỹ thuật dòng xe <em>VinFast VF8</em> trên máy tính của kỹ sư chính là <strong><code>class Oto</code></strong>. Từ 1 bản vẽ đó, nhà máy sản xuất ra 10.000 chiếc xe thực tế lăn bánh ngoài đường mang biển số khác nhau — mỗi chiếc xe đó là một <strong><code>Object</code> (Đối tượng)</strong>!</li>
        <li><strong>Tính Đóng gói (<code>private</code> vs <code>public</code>):</strong> Giống như <strong>Tài khoản Ngân hàng của bạn</strong>: Biến <code>soDu</code> bắt buộc phải để ở chế độ <strong><code>private</code></strong> (nằm sâu trong két sắt máy chủ ngân hàng, không ai được thò tay vào sửa số trực tiếp). Muốn thay đổi số dư, bạn bắt buộc phải đi qua giao diện <strong><code>public</code></strong> là hàm <code>rutTien(soTien)</code> — nơi ngân hàng kiểm tra xem bạn nhập đúng PIN và đủ số dư hay không rồi mới trừ tiền!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Mặc định trong <code>class</code> là <code>private</code> (ngược với <code>struct</code> mặc định là <code>public</code>):</strong> Nếu bạn quên viết nhãn <code>public:</code> trước các phương thức trong <code>class</code>, hàm <code>main()</code> sẽ bị báo lỗi <code>is private within this context</code> khi gọi!</li>
    </ul>
</div>`,
            example: `#include <iostream>
#include <string>
using namespace std;

// Ban thiet ke Lop Tai Khoan Ngan Hang co Tinh Dong Goi (Encapsulation)
class TaiKhoanNganHang {
private:
    string chuTaiKhoan;
    long long soDu; // Bao mat tuyet doi (private), khong cho sua truc tiep tu ben ngoai

public:
    void moTaiKhoan(string ten, long long soDuBanDau) {
        chuTaiKhoan = ten;
        soDu = (soDuBanDau >= 0) ? soDuBanDau : 0;
    }

    void rutTien(long long soTien) {
        if (soTien > 0 && soTien <= soDu) {
            soDu -= soTien;
            cout << "[Giao dich] Rut thanh cong " << soTien << " VND." << endl;
        } else {
            cout << "[Tu choi] So du khong du hoac so tien khong hop le!" << endl;
        }
    }

    void inSaoKe() {
        cout << "Chu TK: " << chuTaiKhoan << " | So du bao mat: " << soDu << " VND" << endl;
    }
};

int main() {
    TaiKhoanNganHang tkVietcombank;
    tkVietcombank.moTaiKhoan("Le Trung Hau", 5000000);
    tkVietcombank.inSaoKe();

    tkVietcombank.rutTien(1500000);
    tkVietcombank.inSaoKe();
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
            description: "Hoàn thiện tư duy OOP hiện đại với Hàm khởi tạo tự động (Constructor), Hàm hủy (Destructor) và Tính Kế thừa (Inheritance).",
            level: "Nâng cao",
            duration: "40 phút",
            content: `
<h3>1. Vòng đời Đối tượng: Constructor (Hàm khởi tạo) &amp; Destructor (Hàm hủy)</h3>
<ul>
    <li><strong>Constructor (Hàm khởi tạo):</strong> Là một phương thức đặc biệt có <strong>tên trùng khít với tên Class</strong> và <strong>không có kiểu trả về</strong>. Nó được <strong>tự động gọi ngay khoảnh khắc đối tượng vừa được tạo ra</strong> để thiết lập các giá trị ban đầu (không lo đối tượng chứa dữ liệu rác).</li>
    <li><strong>Destructor (Hàm hủy):</strong> Có tên trùng tên Class nhưng thêm dấu ngã <code>~</code> ở đầu (ví dụ <code>~TaiKhoan()</code>). Tự động chạy khi đối tượng kết thúc vòng đời để dọn dẹp tài nguyên, đóng file hoặc giải phóng bộ nhớ động.</li>
</ul>

<h3>2. Tính Kế thừa (Inheritance) — Tái sử dụng &amp; Mở rộng quy mô lớn</h3>
<p>Trong thực tế, nhiều đối tượng có chung một nhóm đặc điểm gốc (ví dụ: <em>Lập trình viên</em>, <em>Kế toán</em>, <em>Quản lý</em> đều là <strong>Nhân viên công ty</strong> — đều có Mã NV, Họ tên, Lương cơ bản). Thay vì viết lại code trùng lặp ở cả 3 lớp, C++ cho phép tạo một <strong>Lớp cha (Base Class)</strong> chứa phần chung, và cho các <strong>Lớp con (Derived Class)</strong> kế thừa lại:</p>
<pre>class LapTrinhVien : public NhanVien {
    // Tự động thừa hưởng các thuộc tính/phương thức của NhanVien
    // và bổ sung thêm thuộc tính riêng (ví dụ: tienThuongDuAn)
};</pre>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Cài đặt gốc xuất xưởng Điện thoại (Constructor) &amp; Hệ thống Nhân sự Tập đoàn (Kế thừa)</h4>
    </div>
    <p>Hãy quan sát cách các tập đoàn công nghệ ứng dụng Constructor và Kế thừa:</p>
    <ul>
        <li><strong>Constructor (Hàm khởi tạo tự động):</strong> Giống như khi một chiếc <em>iPhone vừa xuất xưởng</em> khỏi dây chuyền lắp ráp, hệ thống tự động nạp sẵn hệ điều hành iOS mặc định, ngôn ngữ và mức pin an toàn ngay từ giây đầu tiên mà người mua không cần tự lắp mạch!</li>
        <li><strong>Tính Kế thừa (Inheritance):</strong> Trong phần mềm Quản lý Nhân sự (HRM) của công ty: Lớp cha <strong><code>NhanVien</code></strong> định nghĩa sẵn <code>hoTen</code>, <code>luongCoBan</code>. Lớp con <strong><code>LapTrinhVien : public NhanVien</code></strong> thừa hưởng toàn bộ thông tin đó và chỉ cần cộng thêm <code>thuongCode</code>; còn lớp con <strong><code>NhanVienKinhDoanh : public NhanVien</code></strong> cộng thêm <code>hoaHongDoanhSo</code>. Khi công ty đổi quy định bảo hiểm chung, kỹ sư chỉ cần sửa đúng 1 chỗ ở lớp cha <code>NhanVien</code>!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Thứ tự gọi Constructor trong Kế thừa:</strong> Khi khởi tạo một đối tượng Lớp con, <strong>Constructor của Lớp cha luôn chạy trước</strong> để xây xong phần móng, rồi mới đến Constructor của Lớp con hoàn thiện phần riêng! (Khi hủy bằng Destructor thì ngược lại: Con hủy trước, Cha hủy sau).</li>
    </ul>
</div>`,
            example: `#include <iostream>
#include <string>
using namespace std;

// Lop Cha (Base Class): Nhan vien chung trong Cong ty
class NhanVien {
protected:
    string hoTen;
    long long luongCoBan;

public:
    // Constructor khoi tao tu dong khi tao doi tuong
    NhanVien(string ten, long long luongCB) : hoTen(ten), luongCoBan(luongCB) {}

    void inHoSoCoBan() {
        cout << "Nhan vien: " << hoTen << " | Luong co ban: " << luongCoBan << " VND" << endl;
    }
};

// Lop Con (Derived Class): Lap trinh vien ke thua tu NhanVien
class LapTrinhVien : public NhanVien {
private:
    string ngonNguChinh;
    long long thuongDuAn;

public:
    LapTrinhVien(string ten, long long luongCB, string nn, long long thuong)
        : NhanVien(ten, luongCB), ngonNguChinh(nn), thuongDuAn(thuong) {}

    void inBangLuongChiTiet() {
        inHoSoCoBan();
        cout << "Chuyen mon : " << ngonNguChinh << " | Thuong du an: " << thuongDuAn << " VND" << endl;
        cout << "=> TONG THU NHAP THUC LINH: " << (luongCoBan + thuongDuAn) << " VND" << endl;
    }
};

int main() {
    cout << "=== HE THONG QUAN LY NHAN SU CONG TY CONG NGHE (OOP) ===" << endl;
    LapTrinhVien dev("Le Trung Hau", 18000000, "C++ / Backend", 5000000);
    dev.inBangLuongChiTiet();
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
            setCurrentUser(current);
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

        const savedVersion = getItem("cpp_lessons_version", "");

        if (!Array.isArray(lessons) || lessons.length === 0) {

            setItem(
                STORAGE_KEYS.LESSONS,
                DEFAULT_LESSONS
            );
            setItem("cpp_lessons_version", LESSONS_CONTENT_VERSION);

            return;
        }

        const defaultMap = new Map(DEFAULT_LESSONS.map(l => [String(l.id), l]));

        if (savedVersion !== LESSONS_CONTENT_VERSION) {
            const upgraded = lessons.map(item => {
                const def = defaultMap.get(String(item.id));
                if (def) {
                    return {
                        ...item,
                        ...def,
                        content: def.content,
                        theory: def.content,
                        example: def.example,
                        exampleCode: def.example,
                        description: def.description,
                        duration: def.duration
                    };
                }
                return item;
            });

            const existingIds = new Set(upgraded.map(l => String(l.id)));
            const missing = DEFAULT_LESSONS.filter(l => !existingIds.has(String(l.id)));
            const finalLessons = [...upgraded, ...missing].sort(
                (a, b) => Number(a.order || 0) - Number(b.order || 0)
            );

            setItem(STORAGE_KEYS.LESSONS, finalLessons);
            setItem("cpp_lessons_version", LESSONS_CONTENT_VERSION);
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

        if (Array.isArray(lessons)) {
            lessons = lessons.filter(l => l && (l.id || l.title));
        }

        if (!Array.isArray(lessons) || lessons.length === 0) {
            lessons = Array.isArray(DEFAULT_LESSONS) && DEFAULT_LESSONS.length > 0
                ? DEFAULT_LESSONS
                : [];
            if (lessons.length > 0) {
                setItem(STORAGE_KEYS.LESSONS, lessons);
            }
        }

        const defaultMap = new Map(DEFAULT_LESSONS.map(l => [String(l.id), l]));

        return lessons
            .map((lesson, idx) => {
                let id = lesson.id;
                if (typeof id === "string" && /^lesson-\d$/.test(id)) {
                    id = `lesson-0${id.slice(7)}`;
                }
                if (!id) {
                    const ord = Number(lesson.order || lesson.order_num || (idx + 1));
                    id = `lesson-${String(ord).padStart(2, "0")}`;
                }
                const def = defaultMap.get(String(id));
                const rawContent = lesson.content || lesson.theory || "";
                const useDefContent = def && (!rawContent || !rawContent.includes("real-world-box"));
                const finalContent = useDefContent ? def.content : rawContent;
                const rawExample = lesson.example || lesson.exampleCode || "";
                const useDefExample = def && (!rawExample || !rawExample.includes("===") || useDefContent);
                const finalExample = useDefExample ? def.example : (rawExample || (def ? def.example : ""));

                return {
                    ...(def || {}),
                    ...lesson,
                    id: id,
                    description: (useDefContent && def) ? def.description : (lesson.description || (def ? def.description : "")),
                    duration: (useDefContent && def) ? def.duration : (lesson.duration || (def ? def.duration : "25 phút")),
                    order: Number(lesson.order || lesson.order_num || (idx + 1)),
                    theory: finalContent,
                    content: finalContent,
                    example: finalExample,
                    exampleCode: finalExample
                };
            })
            .sort(
                (a, b) =>
                    Number(a.order || 0) -
                    Number(b.order || 0)
            );
    }

    function resetLessons() {
        setItem(STORAGE_KEYS.LESSONS, DEFAULT_LESSONS);
        setItem("cpp_lessons_version", LESSONS_CONTENT_VERSION);
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

        const cleanId = String(id).trim().toLowerCase();
        const allLessons = getLessons();

        // 1. So khớp chính xác ID (không phân biệt hoa thường)
        let found = allLessons.find(
            lesson => String(lesson.id).toLowerCase() === cleanId
        );
        if (found) return found;

        // 2. So khớp theo số / thứ tự bài học (ví dụ: "2", "lesson-2", "lesson-02")
        const digits = cleanId.replace(/\D/g, "");
        if (digits) {
            const num = parseInt(digits, 10);
            found = allLessons.find(l => {
                const lDigits = String(l.id || "").replace(/\D/g, "");
                const lNum = lDigits ? parseInt(lDigits, 10) : NaN;
                const order = parseInt(l.order || l.order_num || 0, 10);
                return lNum === num || order === num;
            });
            if (found) return found;
        }

        return null;
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