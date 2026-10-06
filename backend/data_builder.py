import json
import os

kb_path = os.path.join(os.path.dirname(__file__), "knowledge_base.json")
with open(kb_path, "r", encoding="utf-8") as f:
    data = json.load(f)

# 1. Kịch bản trò chuyện & so sánh mới
new_scenarios = [
    {
        "id": "python_vs_cpp",
        "keywords": ["so sánh c++ và python", "c++ khác python", "nên học c++ hay python", "python hay c++", "c++ vs python"],
        "reply": """⚖️ **So sánh C++ vs Python — Lựa chọn vũ khí phù hợp:**

| Tiêu chí | C++ | Python |
| :--- | :--- | :--- |
| **Tốc độ thực thi** | ⚡ Cực nhanh (biên dịch trực tiếp sang mã máy Assembly) | 🐢 Chậm hơn (thông dịch bytecode qua PVM, chậm hơn C++ 10-50 lần) |
| **Quản lý bộ nhớ** | 🧠 Thủ công (con trỏ, RAM, Stack, Heap, RAII) | 🤖 Tự động (Garbage Collector gom rác) |
| **Mục đích sử dụng** | Game AAA, Hệ thống nhúng, OS, HFT, Lõi AI Engine | Data Science, Web (Django/FastAPI), Scripting, AI Prototyping |
| **Độ khó học** | 🧗 Cao, đòi hỏi hiểu sâu kiến trúc máy tính | 🚶 Dễ tiếp cận, cú pháp như tiếng Anh |

💡 *Lời khuyên:* Học C++ để xây dựng tư duy nền tảng kiến trúc máy tính vững như bàn thạch. Sau khi đã giỏi C++, bạn học Python chỉ mất đúng 3 ngày!"""
    },
    {
        "id": "rust_vs_cpp",
        "keywords": ["c++ hay rust", "so sánh c++ và rust", "rust có thay thế c++", "rust vs c++"],
        "reply": """🦀 **C++ vs Rust — Cuộc đối đầu của hai gã khổng lồ hiệu năng:**

1. 🛡️ **An toàn bộ nhớ (Memory Safety):** Rust sở hữu trình kiểm tra quyền sở hữu (*Borrow Checker*) ngăn chặn 100% lỗi Data Race và Dangling Pointer ngay tại thời điểm biên dịch mà không cần Garbage Collector.
2. 🏛️ **Hệ sinh thái & Di sản:** C++ có hơn 40 năm phát triển, hàng tỉ dòng mã nguồn trong Windows, Linux kernel, Chrome, Unreal Engine, các thư viện tỉ đô không thể viết lại một sớm một chiều.
3. ⚡ **Tốc độ:** Cả hai đều đạt mức hiệu năng ngang ngửa (*Zero-cost abstractions*).

💡 *Lời khuyên:* C++ vẫn là vua của ngành Game và Nhúng. Rust đang vươn lên mạnh mẽ ở mảng Cloud Infrastructure và WebAssembly. Nắm vững Modern C++ sẽ giúp bạn học Rust cực kỳ dễ dàng!"""
    },
    {
        "id": "icpc_olympiad_tips",
        "keywords": ["thi học sinh giỏi", "icpc", "lập trình thi đấu", "competitive programming", "mẹo thi"],
        "reply": """🏆 **Bí kíp Lập trình thi đấu (ICPC / HSG Tin học) với C++:**

1. ⚡ **Bật Fast I/O đầu hàm main:**
   ```cpp
   ios_base::sync_with_stdio(false);
   cin.tie(NULL);
   ```
2. 🛑 **Tránh tràn số (TLE & Overflow):**
   - Dùng `long long` khi tính tổng hoặc tích vượt 2*10^9.
   - Dùng mảng cố định toàn cục (`global array`) thay vì cấp phát lại vector trong vòng lặp testcase để tránh TLE.
3. 🎯 **Chiến thuật phòng thi:**
   - Đọc hết tất cả đề bài trước, làm bài dễ nhất trước để lấy tâm lý hưng phấn.
   - Luôn test trường hợp biên: N=0, N=1, giá trị âm, giá trị lớn nhất trước khi Submit!"""
    },
    {
        "id": "interview_tips",
        "keywords": ["phỏng vấn c++", "xin việc c++", "intern c++", "junior c++", "câu hỏi phỏng vấn"],
        "reply": """💼 **Top 5 chủ đề 'sống còn' trong phỏng vấn C++:**

1. **Virtual Destructor:** Tại sao lớp cha có hàm ảo thì Destructor PHẢI là `virtual`? (Trả lời: Tránh rò rỉ bộ nhớ lớp con khi delete qua con trỏ cha).
2. **Smart Pointers:** Sự khác nhau giữa `unique_ptr` và `shared_ptr`, và tại sao `shared_ptr` cần `weak_ptr` để chống Circular Dependency.
3. **Move Semantics:** Phân biệt Lvalue vs Rvalue và cách `std::move` giúp tránh Deep Copy.
4. **Vtable & Vptr:** Cách trình biên dịch C++ hiện thực hóa tính đa hình động ở runtime.
5. **Memory Layout:** Sự khác biệt giữa Stack (nhanh, tự hủy) và Heap (linh hoạt, cấp phát động)."""
    },
    {
        "id": "segfault_deep_dive",
        "keywords": ["segmentation fault", "segfault", "core dumped", "lỗi segfault", "crash"],
        "reply": """💥 **Cứu hộ lỗi Segmentation Fault (Core Dumped):**

Lỗi này xảy ra khi chương trình của bạn cố gắng truy cập vào một **vùng nhớ mà hệ điều hành không cho phép**.

🔍 **4 Thủ phạm phổ biến nhất:**
1. **Truy cập ngoài mảng:** `int a[5]; a[10] = 99;` hoặc duyệt vòng lặp `for (int i=0; i<=n; i++)` thay vì `i<n`.
2. **Dereference con trỏ NULL:** `int* p = nullptr; *p = 10;`
3. **Con trỏ lơ lửng (Dangling Pointer):** Truy cập vào vùng nhớ đã bị `delete`.
4. **Tràn ngăn xếp (Stack Overflow):** Đệ quy vô tận hoặc khai báo mảng cục bộ quá lớn trong hàm `int a[1000000];` (hãy chuyển ra biến toàn cục!).

💡 *Mẹo:* Thêm cờ `-g -fsanitize=address` khi compile g++, trình biên dịch sẽ chỉ đích danh dòng nào gây tràn bộ nhớ!"""
    }
]

for sc in new_scenarios:
    if not any(s["id"] == sc["id"] for s in data.get("conversational_scenarios", [])):
        data["conversational_scenarios"].append(sc)

# 2. 15 Chuyên đề C++ chuyên sâu mới
new_topics = [
    {
        "id": "string_view_c17",
        "title": "std::string_view (C++17): Tham chiếu Chuỗi Siêu Tốc",
        "keywords": ["string_view", "std::string_view", "chuỗi c++17", "tối ưu chuỗi", "zero allocation string"],
        "summary": "Quan sát và thao tác chuỗi ký tự mà không tốn chi phí cấp phát bộ nhớ (Zero allocation).",
        "explanation": "Trước C++17, khi truyền chuỗi vào hàm bằng const std::string&, nếu truyền một chuỗi hằng (const char*), C++ bắt buộc phải cấp phát bộ nhớ heap để tạo đối tượng tạm. std::string_view chỉ gồm 2 con số: một con trỏ trỏ vào đầu chuỗi và độ dài chuỗi (size). Việc truyền string_view nhẹ như truyền một số int và hoàn toàn không tốn cấp phát RAM.",
        "common_mistakes": "Dùng string_view trỏ tới chuỗi tạm thời đã bị hủy khỏi bộ nhớ (Dangling string_view).",
        "best_practices": "Dùng std::string_view làm tham số hàm chỉ đọc cho chuỗi văn bản.",
        "code_example": "#include <iostream>\n#include <string_view>\nusing namespace std;\n\nvoid printPrefix(string_view sv, size_t n) {\n    cout << sv.substr(0, n) << endl;\n}\n\nint main() {\n    printPrefix(\"Hello World\", 5); // Khong ton bat ky cap phat heap nao!\n    return 0;\n}"
    },
    {
        "id": "bit_manipulation",
        "title": "Thao tác Bit (Bit Manipulation) & Các Hàm Tối Ưu GCC",
        "keywords": ["thao tác bit", "bit manipulation", "bật tắt bit", "__builtin_popcount", "toán tử bit", "xor", "and", "or"],
        "summary": "Tương tác trực tiếp trên các bit nhị phân để đạt tốc độ xử lý phần cứng 1 chu kỳ máy.",
        "explanation": "Các toán tử bit: & (AND), | (OR), ^ (XOR), ~ (NOT), << (dịch trái), >> (dịch phải).\n- Kiểm tra bit thứ k: (n >> k) & 1\n- Bật bit thứ k: n |= (1 << k)\n- Tắt bit thứ k: n &= ~(1 << k)\n- Đảo bit thứ k: n ^= (1 << k)\n- Đếm số lượng bit 1: __builtin_popcount(n) (hàm nội tại CPU cực nhanh).",
        "common_mistakes": "Nhầm lẫn toán tử logic &&, || với toán tử bit &, |.",
        "best_practices": "Toán tử 1 << k bị tràn số nếu k >= 31, hãy dùng 1LL << k cho số 64-bit.",
        "code_example": "#include <iostream>\nusing namespace std;\n\nint main() {\n    int n = 29; // Nhi phan: 11101\n    cout << \"So bit 1: \" << __builtin_popcount(n) << endl; // In ra: 4\n    // Kiem tra n co phai luy thua cua 2: n > 0 && (n & (n - 1)) == 0\n    cout << \"Kiem tra luy thua 2: \" << ((n & (n - 1)) == 0) << endl;\n    return 0;\n}"
    },
    {
        "id": "sieve_of_eratosthenes",
        "title": "Sàng Nguyên Tố Eratosthenes O(N log log N)",
        "keywords": ["sàng nguyên tố", "eratosthenes", "số nguyên tố", "sieve", "kiểm tra nguyên tố"],
        "summary": "Thuật toán tìm tất cả các số nguyên tố từ 2 đến N cực nhanh với độ phức tạp gần như tuyến tính.",
        "explanation": "Khởi tạo mảng boolean isPrime kích thước N+1 gán giá trị true. Duyệt từ i = 2 đến căn bậc hai của N, nếu isPrime[i] là true, ta đánh dấu toàn bộ bội số của nó i^2, i^2+i, i^2+2i, ... là false. Sau khi kết thúc, các chỉ số còn true chính là số nguyên tố.",
        "common_mistakes": "Duyệt mảng đến N thay vì căn bậc hai của N hoặc duyệt bội số từ 2*i thay vì i*i gây lãng phí thời gian.",
        "best_practices": "Dùng std::vector<bool> trong C++ vì nó được tối ưu hóa nén 1 bit cho mỗi boolean, tiết kiệm RAM gấp 8 lần.",
        "code_example": "#include <iostream>\n#include <vector>\nusing namespace std;\n\nvoid sieve(int n) {\n    vector<bool> isPrime(n + 1, true);\n    isPrime[0] = isPrime[1] = false;\n    for (int p = 2; p * p <= n; p++) {\n        if (isPrime[p]) {\n            for (int i = p * p; i <= n; i += p) isPrime[i] = false;\n        }\n    }\n    for (int p = 2; p <= n; p++) if (isPrime[p]) cout << p << \" \";\n    cout << endl;\n}\n\nint main() {\n    sieve(30); // 2 3 5 7 11 13 17 19 23 29\n    return 0;\n}"
    },
    {
        "id": "binary_exponentiation",
        "title": "Lũy Thừa Nhị Phân (Binary Exponentiation) O(log N)",
        "keywords": ["lũy thừa nhị phân", "binary exponentiation", "tính a^b", "lũy thừa modulo", "fast power"],
        "summary": "Tính toán a^b mod M trong thời gian O(log b) thay vì O(b).",
        "explanation": "Dựa trên ý tưởng: nếu b chẵn, a^b = (a^2)^(b/2). Nếu b lẻ, a^b = a * a^(b-1). Giúp chia đôi số mũ sau mỗi bước lặp, cho phép tính a^(10^18) chỉ trong khoảng 60 phép tính.",
        "common_mistakes": "Không ép kiểu long long khi nhân hai số (res * base) gây tràn số trước khi kịp chia lấy dư mod.",
        "best_practices": "Luôn viết vòng lặp khử đệ quy để đạt tốc độ tối đa.",
        "code_example": "#include <iostream>\nusing namespace std;\n\nlong long powerMod(long long base, long long exp, long long mod) {\n    long long res = 1;\n    base %= mod;\n    while (exp > 0) {\n        if (exp % 2 == 1) res = (res * base) % mod;\n        base = (base * base) % mod;\n        exp /= 2;\n    }\n    return res;\n}\n\nint main() {\n    cout << \"3^13 mod 1000 = \" << powerMod(3, 13, 1000) << endl; // In ra: 403\n    return 0;\n}"
    },
    {
        "id": "binary_search_tree",
        "title": "Cây Nhị Phân Tìm Kiếm (Binary Search Tree - BST)",
        "keywords": ["cây nhị phân", "binary search tree", "bst", "cây nhị phân tìm kiếm", "duyệt cây", "inorder"],
        "summary": "Cấu trúc dữ liệu dạng cây phân cấp: cây con trái < gốc < cây con phải.",
        "explanation": "Đặc tính cốt lõi: Với mọi nút, tất cả phần tử bên cây con trái đều nhỏ hơn giá trị nút gốc, và tất cả phần tử bên cây con phải đều lớn hơn. Duyệt cây theo thứ tự giữa (In-order: Trái -> Gốc -> Phải) sẽ tự động sinh ra dãy số đã được sắp xếp tăng dần! Thời gian tìm kiếm trung bình: O(log N).",
        "common_mistakes": "Cây bị thoái hóa thành danh sách liên kết khi chèn các số đã sắp xếp sẵn khiến độ phức tạp giảm về O(N) (giải pháp: dùng AVL Tree hoặc Red-Black Tree).",
        "best_practices": "Trong C++, std::set và std::map chính là biến thể cân bằng (Red-Black Tree) của BST.",
        "code_example": "#include <iostream>\nusing namespace std;\n\nstruct Node {\n    int data;\n    Node* left;\n    Node* right;\n    Node(int val) : data(val), left(nullptr), right(nullptr) {}\n};\n\nNode* insert(Node* root, int val) {\n    if (!root) return new Node(val);\n    if (val < root->data) root->left = insert(root->left, val);\n    else root->right = insert(root->right, val);\n    return root;\n}\n\nvoid inorder(Node* root) {\n    if (!root) return;\n    inorder(root->left);\n    cout << root->data << \" \";\n    inorder(root->right);\n}\n\nint main() {\n    Node* root = nullptr;\n    for (int x : {50, 30, 70, 20, 40}) root = insert(root, x);\n    inorder(root); // 20 30 40 50 70\n    cout << endl;\n    return 0;\n}"
    },
    {
        "id": "graph_bfs_dfs",
        "title": "Đồ Thị: Biểu diễn Danh sách kề, Duyệt BFS & DFS",
        "keywords": ["đồ thị", "graph", "bfs", "dfs", "danh sách kề", "duyệt đồ thị"],
        "summary": "Mô hình hóa các mối quan hệ mạng lưới và hai giải thuật duyệt đồ thị kinh điển.",
        "explanation": "- Biểu diễn: Dùng vector<vector<int>> adj(N) để lưu danh sách đỉnh kề.\n- BFS (Breadth-First Search): Duyệt theo chiều rộng dùng std::queue. Ứng dụng: Tìm đường đi ngắn nhất trên đồ thị không có trọng số.\n- DFS (Depth-First Search): Duyệt theo chiều sâu dùng đệ quy hoặc std::stack. Ứng dụng: Tìm thành phần liên thông, sắp xếp topo, phát hiện chu trình.",
        "common_mistakes": "Quên đánh dấu mảng visited[u] = true dẫn đến thuật toán bị lặp vô tận khi gặp chu trình.",
        "best_practices": "Đánh dấu visited ngay khi đẩy phần tử vào hàng đợi queue trong BFS.",
        "code_example": "#include <iostream>\n#include <vector>\n#include <queue>\nusing namespace std;\n\nvoid bfs(int start, const vector<vector<int>>& adj) {\n    vector<bool> visited(adj.size(), false);\n    queue<int> q;\n    q.push(start); visited[start] = true;\n    while (!q.empty()) {\n        int u = q.front(); q.pop();\n        cout << u << \" \";\n        for (int v : adj[u]) {\n            if (!visited[v]) { visited[v] = true; q.push(v); }\n        }\n    }\n    cout << endl;\n}\n\nint main() {\n    vector<vector<int>> adj(4);\n    adj[0] = {1, 2}; adj[1] = {2}; adj[2] = {0, 3}; adj[3] = {3};\n    bfs(2, adj); // Duyet BFS bat dau tu dinh 2\n    return 0;\n}"
    },
    {
        "id": "dijkstra_algorithm",
        "title": "Thuật toán Dijkstra Tìm Đường Đi Ngắn Nhất O((V+E) log V)",
        "keywords": ["dijkstra", "đường đi ngắn nhất", "shortest path", "đồ thị có trọng số"],
        "summary": "Tìm đường đi ngắn nhất từ 1 đỉnh nguồn đến tất cả các đỉnh còn lại trên đồ thị trọng số không âm.",
        "explanation": "Sử dụng kỹ thuật Tham lam (Greedy) kết hợp Hàng đợi ưu tiên Min-Heap (priority_queue). Tại mỗi bước, ta luôn chọn đỉnh có khoảng cách nhỏ nhất chưa xét để tối ưu hóa khoảng cách tới các đỉnh kề.",
        "common_mistakes": "Áp dụng Dijkstra cho đồ thị có trọng số âm (dẫn đến kết quả sai, cần dùng Bellman-Ford).",
        "best_practices": "Lưu cặp (khoảng_cách, đỉnh) trong priority_queue để tự động so sánh khoảng cách trước.",
        "code_example": "#include <iostream>\n#include <vector>\n#include <queue>\nusing namespace std;\n\nconst int INF = 1e9;\nvoid dijkstra(int src, int n, const vector<vector<pair<int,int>>>& adj) {\n    vector<int> dist(n, INF);\n    priority_queue<pair<int,int>, vector<pair<int,int>>, greater<pair<int,int>>> pq;\n    dist[src] = 0; pq.push({0, src});\n    while (!pq.empty()) {\n        auto [d, u] = pq.top(); pq.pop();\n        if (d > dist[u]) continue;\n        for (auto [v, w] : adj[u]) {\n            if (dist[u] + w < dist[v]) { dist[v] = dist[u] + w; pq.push({dist[v], v}); }\n        }\n    }\n    for(int i = 0; i < n; i++) cout << \"Dinh \" << i << \": \" << dist[i] << endl;\n}\n\nint main() {\n    int n = 3;\n    vector<vector<pair<int,int>>> adj(n);\n    adj[0].push_back({1, 4}); adj[0].push_back({2, 1}); adj[2].push_back({1, 2});\n    dijkstra(0, n, adj);\n    return 0;\n}"
    },
    {
        "id": "disjoint_set_union",
        "title": "Cấu trúc Disjoint Set Union (DSU / Hợp Nhất Tập Hợp Rời Rạc)",
        "keywords": ["dsu", "disjoint set union", "find union", "kruskal", "tập hợp rời rạc"],
        "summary": "Quản lý các tập hợp rời rạc với thao tác Find và Union đạt thời gian gần như hằng số O(alpha(N)).",
        "explanation": "DSU giải quyết bài toán: Cho N phần tử, kiểm tra 2 phần tử có thuộc cùng một nhóm hay không và gộp 2 nhóm lại với nhau. Nhờ 2 kỹ thuật tối ưu hóa:\n1. Nén đường đi (Path Compression): Khi tìm đại diện find(u), gán trực tiếp cha của u lên gốc.\n2. Gộp theo hạng (Union by Rank): Luôn gộp cây nhỏ hơn vào cây lớn hơn.",
        "common_mistakes": "Quên nén đường đi khiến cây bị kéo dài, suy giảm tốc độ.",
        "best_practices": "Áp dụng DSU để giải thuật toán Kruskal tìm Cây khung nhỏ nhất (MST) và kiểm tra đồ thị liên thông.",
        "code_example": "#include <iostream>\n#include <vector>\nusing namespace std;\n\nstruct DSU {\n    vector<int> parent;\n    DSU(int n) : parent(n) { for (int i = 0; i < n; i++) parent[i] = i; }\n    int find(int u) {\n        return (parent[u] == u) ? u : (parent[u] = find(parent[u])); // Nen duong di\n    }\n    void unite(int u, int v) {\n        u = find(u); v = find(v);\n        if (u != v) parent[u] = v;\n    }\n};\n\nint main() {\n    DSU dsu(5);\n    dsu.unite(0, 1); dsu.unite(1, 2);\n    cout << (dsu.find(0) == dsu.find(2) ? \"Cung nhom\" : \"Khac nhom\") << endl;\n    return 0;\n}"
    },
    {
        "id": "segment_tree",
        "title": "Cây Phân Đoạn (Segment Tree) Cho Truy Vấn Đoạn O(log N)",
        "keywords": ["segment tree", "cây phân đoạn", "it", "truy vấn đoạn", "rmq", "cập nhật điểm"],
        "summary": "Cấu trúc dữ liệu siêu việt để cập nhật giá trị và truy vấn tổng/min/max trên đoạn [L, R].",
        "explanation": "Segment tree là cây nhị phân hoàn hảo trong đó mỗi nút quản lý một khoảng [L, R]. Nút lá quản lý 1 phần tử. Mọi truy vấn trên đoạn hoặc cập nhật một phần tử đều chỉ đi qua tối đa 4*log N nút, đạt thời gian O(log N) thay vì duyệt O(N) thông thường.",
        "common_mistakes": "Khai báo mảng cây kích thước 2*N thay vì 4*N dẫn đến tràn chỉ số (Out of bounds).",
        "best_practices": "Khai báo kích thước mảng cây tối thiểu bằng 4*N.",
        "code_example": "#include <iostream>\n#include <vector>\nusing namespace std;\n\nstruct SegTree {\n    int n; vector<int> tree;\n    SegTree(int n) : n(n), tree(4 * n, 0) {}\n    void update(int node, int start, int end, int idx, int val) {\n        if (start == end) { tree[node] = val; return; }\n        int mid = (start + end) / 2;\n        if (idx <= mid) update(2 * node, start, mid, idx, val);\n        else update(2 * node + 1, mid + 1, end, idx, val);\n        tree[node] = tree[2 * node] + tree[2 * node + 1];\n    }\n    int query(int node, int start, int end, int l, int r) {\n        if (r < start || end < l) return 0;\n        if (l <= start && end <= r) return tree[node];\n        int mid = (start + end) / 2;\n        return query(2 * node, start, mid, l, r) + query(2 * node + 1, mid + 1, end, l, r);\n    }\n};\n\nint main() {\n    SegTree st(4);\n    st.update(1, 0, 3, 0, 10); st.update(1, 0, 3, 1, 20); st.update(1, 0, 3, 2, 30);\n    cout << \"Tong doan [0, 2]: \" << st.query(1, 0, 3, 0, 2) << endl; // In ra: 60\n    return 0;\n}"
    },
    {
        "id": "backtracking_n_queens",
        "title": "Kỹ Thuật Quay Lui (Backtracking) & Bài Toán N Quân Hậu",
        "keywords": ["quay lui", "backtracking", "n quân hậu", "n queens", "sinh hoán vị"],
        "summary": "Thử mọi khả năng có thể, nếu gặp ngõ cụt thì lùi lại bước trước để thử hướng đi khác.",
        "explanation": "Khung thuật toán chuẩn của Backtracking:\n1. Chọn một khả năng hợp lệ cho bước hiện tại.\n2. Gọi đệ quy bước kế tiếp.\n3. Hủy bỏ trạng thái vừa chọn (Undo/Backtrack) để vòng lặp thử nhánh khác.",
        "common_mistakes": "Quên thao tác hủy trạng thái (Undo State) sau lời gọi đệ quy.",
        "best_practices": "Cắt tỉa nhánh cận (Branch and Bound) sớm nhất có thể để tránh bùng nổ tổ hợp.",
        "code_example": "#include <iostream>\n#include <vector>\nusing namespace std;\n\nint countQueens = 0;\nbool cols[20], diag1[40], diag2[40];\n\nvoid solve(int row, int n) {\n    if (row == n) { countQueens++; return; }\n    for (int col = 0; col < n; col++) {\n        if (!cols[col] && !diag1[row - col + n] && !diag2[row + col]) {\n            cols[col] = diag1[row - col + n] = diag2[row + col] = true;\n            solve(row + 1, n);\n            cols[col] = diag1[row - col + n] = diag2[row + col] = false; // Backtrack\n        }\n    }\n}\n\nint main() {\n    solve(0, 8);\n    cout << \"So cach xep 8 quan hau: \" << countQueens << endl; // In ra: 92\n    return 0;\n}"
    },
    {
        "id": "longest_increasing_subsequence",
        "title": "Dãy Con Tăng Dài Nhất (LIS) O(N log N)",
        "keywords": ["lis", "dãy con tăng dài nhất", "longest increasing subsequence", "lower_bound lis"],
        "summary": "Tìm độ dài dãy con tăng dài nhất trong mảng bằng Quy hoạch động kết hợp Tìm kiếm nhị phân.",
        "explanation": "Quy hoạch động truyền thống mất O(N^2). Khi tối ưu bằng mảng phụ tail: tail[len] lưu giá trị phần tử kết thúc nhỏ nhất của một dãy con tăng có độ dài len. Duyệt từng phần tử x, dùng std::lower_bound tìm vị trí thay thế trong tail. Độ phức tạp giảm xuống mức O(N log N).",
        "common_mistakes": "Nhầm lẫn lower_bound (dãy tăng nghiêm ngặt) với upper_bound (dãy không giảm).",
        "best_practices": "Áp dụng cho các bài toán xếp hộp, tìm chuỗi tăng trưởng kinh tế.",
        "code_example": "#include <iostream>\n#include <vector>\n#include <algorithm>\nusing namespace std;\n\nint lengthOfLIS(const vector<int>& nums) {\n    vector<int> tail;\n    for (int x : nums) {\n        auto it = lower_bound(tail.begin(), tail.end(), x);\n        if (it == tail.end()) tail.push_back(x);\n        else *it = x;\n    }\n    return tail.size();\n}\n\nint main() {\n    vector<int> a = {10, 9, 2, 5, 3, 7, 101, 18};\n    cout << \"Do dai LIS: \" << lengthOfLIS(a) << endl; // In ra: 4 (2, 3, 7, 101)\n    return 0;\n}"
    },
    {
        "id": "multithreading_basics",
        "title": "Lập trình Đa Luồng (Multithreading): std::thread & std::mutex",
        "keywords": ["đa luồng", "multithreading", "std::thread", "mutex", "lock_guard", "deadlock", "data race"],
        "summary": "Tận dụng toàn bộ các nhân của CPU để thực thi nhiều tác vụ song song.",
        "explanation": "C++11 đưa đa luồng vào thư viện chuẩn <thread>.\n- std::thread: Tạo và khởi chạy một luồng độc lập.\n- std::mutex: Khóa loại trừ lẫn nhau, bảo vệ vùng nhớ dùng chung khỏi xung đột dữ liệu (Data Race).\n- std::lock_guard: Tự động khóa khi tạo và tự động mở khóa khi ra khỏi phạm vi theo nguyên lý RAII, chống Deadlock.",
        "common_mistakes": "Quên gọi t.join() hoặc t.detach() trước khi đối tượng thread bị hủy dẫn đến chương trình bị std::terminate().",
        "best_practices": "Luôn dùng std::lock_guard<std::mutex> thay vì gọi mtx.lock() và mtx.unlock() thủ công.",
        "code_example": "#include <iostream>\n#include <thread>\n#include <mutex>\nusing namespace std;\n\nint counter = 0;\nmutex mtx;\n\nvoid work() {\n    for (int i = 0; i < 10000; i++) {\n        lock_guard<mutex> lock(mtx); // Khoa an toan RAII\n        counter++;\n    }\n}\n\nint main() {\n    thread t1(work), t2(work);\n    t1.join(); t2.join();\n    cout << \"Counter: \" << counter << endl; // 20000 (khong bi data race)\n    return 0;\n}"
    },
    {
        "id": "filesystem_c17",
        "title": "std::filesystem (C++17): Quản Lý Tập Tin & Thư Mục",
        "keywords": ["std::filesystem", "filesystem", "quản lý file", "đọc ghi thư mục", "c++17 filesystem"],
        "summary": "Thao tác đường dẫn, tạo thư mục, duyệt file đa nền tảng (Windows/Linux/macOS).",
        "explanation": "Cung cấp không gian tên std::filesystem giúp kiểm tra file tồn tại exists(), kích thước file file_size(), tạo thư mục create_directories(), duyệt file đệ quy recursive_directory_iterator mà không cần gọi API riêng của từng hệ điều hành.",
        "common_mistakes": "Dùng dấu gạch chéo ngược thủ công của Windows thay vì đối tượng std::filesystem::path.",
        "best_practices": "Bí danh namespace fs = std::filesystem; để viết ngắn gọn.",
        "code_example": "#include <iostream>\n#include <filesystem>\nnamespace fs = std::filesystem;\nusing namespace std;\n\nint main() {\n    fs::path p = \"test_dir\";\n    if (!fs::exists(p)) fs::create_directories(p);\n    cout << \"Thu muc ton tai: \" << fs::exists(p) << endl;\n    fs::remove(p);\n    return 0;\n}"
    },
    {
        "id": "singleton_pattern",
        "title": "Design Pattern: Meyers' Singleton Chuẩn Thread-Safe",
        "keywords": ["singleton", "design pattern", "meyers singleton", "mẫu thiết kế"],
        "summary": "Đảm bảo một lớp chỉ có duy nhất một thể hiện (Instance) trong toàn bộ vòng đời chương trình.",
        "explanation": "Trong Modern C++, cách cài đặt Singleton thanh lịch và an toàn đa luồng nhất là Meyers' Singleton. Tận dụng tính năng của C++11: Biến tĩnh cục bộ (static) được đảm bảo khởi tạo an toàn trong môi trường đa luồng (Magic Statics). Private hóa Constructor, Destructor và xóa bỏ Copy Constructor / Copy Assignment bằng = delete.",
        "common_mistakes": "Lạm dụng Singleton làm biến toàn cục trá hình, gây khó khăn cho việc viết Unit Test.",
        "best_practices": "Chỉ dùng Singleton cho các dịch vụ tài nguyên duy nhất: Logger, Database Connection Pool, Audio Engine.",
        "code_example": "#include <iostream>\nusing namespace std;\n\nclass AppConfig {\nprivate:\n    AppConfig() { cout << \"Khoi tao Config!\\n\"; }\npublic:\n    AppConfig(const AppConfig&) = delete;\n    AppConfig& operator=(const AppConfig&) = delete;\n    static AppConfig& getInstance() {\n        static AppConfig instance; // Thread-safe tu C++11\n        return instance;\n    }\n    void show() { cout << \"Dang chay phien ban 2.0\\n\"; }\n};\n\nint main() {\n    AppConfig::getInstance().show();\n    return 0;\n}"
    },
    {
        "id": "factory_pattern",
        "title": "Design Pattern: Factory Pattern (Xưởng Sản Xuất Đối Tượng)",
        "keywords": ["factory pattern", "factory", "mẫu factory", "khởi tạo đối tượng đa hình"],
        "summary": "Tách biệt việc tạo lập đối tượng khỏi việc sử dụng đối tượng, tuân thủ nguyên lý Đóng/Mở (Open/Closed Principle).",
        "explanation": "Thay vì gọi trực tiếp new Dog() hoặc new Cat(), hàm Factory nhận vào một định danh (hoặc chuỗi) và trả về con trỏ thông minh std::unique_ptr<Animal> đến lớp cha. Khi muốn thêm con vật mới (ví dụ Bird), bạn không cần sửa đổi logic ở những nơi đang sử dụng Animal.",
        "common_mistakes": "Trả về con trỏ thô trần trụi Animal* dẫn đến nguy cơ quên delete.",
        "best_practices": "Luôn trả về std::unique_ptr<Base> từ hàm Factory.",
        "code_example": "#include <iostream>\n#include <memory>\nusing namespace std;\n\nclass Button { public: virtual void render() = 0; virtual ~Button() = default; };\nclass WinButton : public Button { public: void render() override { cout << \"Ve nut Windows\\n\"; } };\nclass MacButton : public Button { public: void render() override { cout << \"Ve nut macOS\\n\"; } };\n\nunique_ptr<Button> createButton(string os) {\n    if (os == \"win\") return make_unique<WinButton>();\n    return make_unique<MacButton>();\n}\n\nint main() {\n    auto btn = createButton(\"win\");\n    btn->render(); // In ra: Ve nut Windows\n    return 0;\n}"
    }
]

for tp in new_topics:
    if not any(t["id"] == tp["id"] for t in data.get("topics", [])):
        data["topics"].append(tp)

data["metadata"] = {
    "total_topics": len(data["topics"]),
    "total_scenarios": len(data["conversational_scenarios"]),
    "version": "2.1.0",
    "last_updated": "2026-10-06"
}

with open(kb_path, "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print(f"Data builder completed! Total topics: {len(data['topics'])}, Total scenarios: {len(data['conversational_scenarios'])}")
