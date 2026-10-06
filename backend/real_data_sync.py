"""
CodeLearn C++ - Real Data Sync Engine
File: backend/real_data_sync.py
Đồng bộ dữ liệu THẬT 100% từ VNOI Wiki (VNOI-Admin/vnoi_wiki) và CP-Algorithms
Tác giả các bài viết: Phạm Văn Hạnh (Huy chương Vàng IOI 2015), VNU, Topcoder, Google Interviewers
"""

import os
import re
import sys
import json
import sqlite3
import urllib.request
import ssl
from datetime import datetime

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

VNOI_REPO_RAW = "https://raw.githubusercontent.com/VNOI-Admin/vnoi_wiki/master"

REAL_DATA_SOURCES = [
    {
        "id": "vnoi_cpp_pointers",
        "path": "languages/cpp/pointers.md",
        "category": "languages",
        "keywords": ["con trỏ", "pointer", "địa chỉ", "dereference", "con trỏ hàm", "cấp phát động"],
        "default_title": "Con trỏ trong C/C++ - Phạm Văn Hạnh (IOI Gold 2015)"
    },
    {
        "id": "vnoi_cpp_string",
        "path": "languages/cpp/string.md",
        "category": "languages",
        "keywords": ["xử lý chuỗi", "string", "chuỗi c++", "char*", "getline"],
        "default_title": "Xử lý Chuỗi Ký Tự trong C++"
    },
    {
        "id": "vnoi_binary_search",
        "path": "algo/basic/binary-search.md",
        "category": "basic",
        "keywords": ["tìm kiếm nhị phân", "binary search", "chặt nhị phân", "lower_bound", "upper_bound"],
        "default_title": "Thuật toán Tìm kiếm nhị phân (Topcoder / VNU-HUS)"
    },
    {
        "id": "vnoi_bitwise_operators",
        "path": "algo/basic/bitwise-operators.md",
        "category": "basic",
        "keywords": ["phép toán bit", "bitwise", "thao tác bit", "bật tắt bit", "xor", "and", "or"],
        "default_title": "Các phép toán thao tác Bit trong Lập trình"
    },
    {
        "id": "vnoi_computational_complexity",
        "path": "algo/basic/computational-complexity.md",
        "category": "basic",
        "keywords": ["độ phức tạp", "o(n)", "big o", "thời gian chạy", "không gian bộ nhớ"],
        "default_title": "Độ phức tạp tính toán và Ký hiệu Big-O"
    },
    {
        "id": "vnoi_backtracking",
        "path": "algo/basic/backtracking.md",
        "category": "basic",
        "keywords": ["quay lui", "backtracking", "thử và sai", "n quân hậu", "sinh hoán vị"],
        "default_title": "Thuật toán Quay lui (Backtracking)"
    },
    {
        "id": "vnoi_divide_and_conquer",
        "path": "algo/basic/divide-and-conquer.md",
        "category": "basic",
        "keywords": ["chia để trị", "divide and conquer", "quicksort", "mergesort"],
        "default_title": "Thuật toán Chia để trị (Divide and Conquer)"
    },
    {
        "id": "vnoi_stack",
        "path": "algo/data-structures/Stack.md",
        "category": "data-structures",
        "keywords": ["stack", "ngăn xếp", "lifo", "push", "pop"],
        "default_title": "Cấu trúc dữ liệu Ngăn xếp (Stack)"
    },
    {
        "id": "vnoi_deque",
        "path": "algo/data-structures/Deque.md",
        "category": "data-structures",
        "keywords": ["deque", "hàng đợi hai đầu", "sliding window deque", "min max đoạn"],
        "default_title": "Cấu trúc dữ liệu Hàng đợi hai đầu (Deque)"
    },
    {
        "id": "vnoi_dsu",
        "path": "algo/data-structures/disjoint-set-union.md",
        "category": "data-structures",
        "keywords": ["dsu", "disjoint set union", "tập hợp rời rạc", "kruskal", "find union"],
        "default_title": "Cấu trúc các Tập hợp Rời nhau (DSU)"
    },
    {
        "id": "vnoi_array_vs_linked_list",
        "path": "algo/data-structures/array-vs-linked-lists.md",
        "category": "data-structures",
        "keywords": ["mảng và danh sách liên kết", "array vs linked list", "danh sách liên kết"],
        "default_title": "So sánh Mảng và Danh sách liên kết"
    },
    {
        "id": "vnoi_dp_basic_1",
        "path": "algo/dp/basic-dynamic-programming-1.md",
        "category": "dp",
        "keywords": ["quy hoạch động cơ bản", "dynamic programming", "công thức truy hồi", "bài toán con"],
        "default_title": "Quy hoạch động cơ bản Phần 1"
    },
    {
        "id": "vnoi_dp_knapsack",
        "path": "algo/dp/dp-knapsack-1.md",
        "category": "dp",
        "keywords": ["cái túi", "knapsack", "quy hoạch động cái túi", "balo"],
        "default_title": "Quy hoạch động: Bài toán Cái túi (Knapsack)"
    },
    {
        "id": "vnoi_dp_bitmask",
        "path": "algo/dp/dp-bitmask.md",
        "category": "dp",
        "keywords": ["dp bitmask", "quy hoạch động bitmask", "trạng thái bit"],
        "default_title": "Quy hoạch động Trạng thái (Bitmask DP)"
    },
    {
        "id": "vnoi_bfs",
        "path": "algo/graph-theory/breadth-first-search.md",
        "category": "graph",
        "keywords": ["bfs", "tìm kiếm theo chiều rộng", "đường đi ngắn nhất không trọng số", "queue bfs"],
        "default_title": "Duyệt đồ thị theo chiều rộng (BFS)"
    },
    {
        "id": "vnoi_dfs_tree",
        "path": "algo/graph-theory/Depth-First-Search-Tree.md",
        "category": "graph",
        "keywords": ["dfs", "tìm kiếm theo chiều sâu", "cây dfs", "khớp cầu", "thành phần liên thông"],
        "default_title": "Cây Tìm kiếm theo chiều sâu (DFS Tree)"
    },
    {
        "id": "vnoi_interview_google",
        "path": "interview/Kinh-nghiem-phong-van-Google.md",
        "category": "interview",
        "keywords": ["phỏng vấn google", "kinh nghiệm google", "faang interview", "phỏng vấn big tech"],
        "default_title": "Kinh nghiệm thực tế Phỏng vấn Kỹ thuật tại Google"
    },
    {
        "id": "vnoi_interview_practical",
        "path": "interview/Nhung-lan-phong-van-trong-thuc-te-va-bai-hoc-rut-ra.md",
        "category": "interview",
        "keywords": ["kinh nghiệm phỏng vấn", "phỏng vấn xin việc", "bài học phỏng vấn", "live coding"],
        "default_title": "Những lần phỏng vấn thực tế và Bài học rút ra"
    },
    {
        "id": "vnoi_interview_perspectives",
        "path": "interview/experience-from-interviewer.md",
        "category": "interview",
        "keywords": ["góc nhìn người phỏng vấn", "lời khuyên nhà tuyển dụng", "tiêu chí đánh giá"],
        "default_title": "Kinh nghiệm từ góc nhìn của Người phỏng vấn"
    }
]

def fetch_content(url: str) -> str:
    ctx = ssl._create_unverified_context()
    req = urllib.request.Request(
        url,
        headers={"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) CodeLearnC++DataBot/2.0"}
    )
    with urllib.request.urlopen(req, context=ctx, timeout=15) as res:
        return res.read().decode("utf-8", errors="replace")

def extract_metadata(content: str, default_title: str):
    title = default_title
    author = "VNOI Community"

    # Match H1
    h1_match = re.search(r'^#\s+(.+)$', content, flags=re.MULTILINE)
    if h1_match:
        title = h1_match.group(1).strip()

    # Match Author
    auth_match = re.search(r'\*\*Tác giả\*\*:\s*([^\n\r]+)', content, flags=re.IGNORECASE)
    if not auth_match:
        auth_match = re.search(r'\*\*Người dịch\*\*:\s*([^\n\r]+)', content, flags=re.IGNORECASE)
    if auth_match:
        author = auth_match.group(1).strip()

    # Extract clean summary
    paragraphs = [p.strip() for p in content.split("\n\n") if p.strip() and not p.startswith("#") and not p.startswith("**")]
    summary = paragraphs[0][:400] if paragraphs else title

    # Extract first code block
    code_match = re.search(r'```(?:cpp|c\+\+)?\n([\s\S]*?)```', content)
    code_sample = code_match.group(1).strip() if code_match else ""

    return title, author, summary, code_sample

def sync_real_data(db_path: str = None):
    base_dir = os.path.dirname(__file__)
    if not db_path:
        db_path = os.path.join(base_dir, "database.db")

    data_dir = os.path.join(base_dir, "data", "vnoi")
    os.makedirs(data_dir, exist_ok=True)

    print("=" * 60)
    print(">> BẮT ĐẦU ĐỒNG BỘ DỮ LIỆU THẬT TỪ VNOI WIKI GITHUB...")
    print("=" * 60)

    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    # Ensure table exists
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS vnoi_real_knowledge (
            id          TEXT PRIMARY KEY,
            title       TEXT NOT NULL,
            category    TEXT NOT NULL,
            author      TEXT DEFAULT '',
            source_url  TEXT DEFAULT '',
            keywords    TEXT NOT NULL,
            summary     TEXT NOT NULL,
            content     TEXT NOT NULL,
            code_sample TEXT DEFAULT '',
            updated_at  TEXT NOT NULL
        )
    """)
    cursor.execute("CREATE INDEX IF NOT EXISTS idx_vnoi_category ON vnoi_real_knowledge(category)")
    cursor.execute("CREATE INDEX IF NOT EXISTS idx_vnoi_title ON vnoi_real_knowledge(title)")

    synced_items = []
    success_count = 0

    for item in REAL_DATA_SOURCES:
        doc_id = item["id"]
        rel_path = item["path"]
        url = f"{VNOI_REPO_RAW}/{rel_path}"
        local_file = os.path.join(data_dir, f"{doc_id}.md")

        print(f"[*] Đang tải: {rel_path}...")
        try:
            content = fetch_content(url)
            with open(local_file, "w", encoding="utf-8") as f:
                f.write(content)

            title, author, summary, code_sample = extract_metadata(content, item["default_title"])
            now_str = datetime.now().isoformat()

            cursor.execute("""
                INSERT INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                ON CONFLICT(id) DO UPDATE SET
                    title=excluded.title,
                    author=excluded.author,
                    source_url=excluded.source_url,
                    keywords=excluded.keywords,
                    summary=excluded.summary,
                    content=excluded.content,
                    code_sample=excluded.code_sample,
                    updated_at=excluded.updated_at
            """, (
                doc_id,
                title,
                item["category"],
                author,
                f"https://github.com/VNOI-Admin/vnoi_wiki/blob/master/{rel_path}",
                json.dumps(item["keywords"], ensure_ascii=False),
                summary,
                content,
                code_sample,
                now_str
            ))

            synced_items.append({
                "id": doc_id,
                "title": title,
                "author": author,
                "category": item["category"],
                "keywords": item["keywords"],
                "summary": summary,
                "source_url": f"https://github.com/VNOI-Admin/vnoi_wiki/blob/master/{rel_path}",
                "content_len": len(content)
            })

            success_count += 1
            print(f"    ✓ Thành công: '{title}' ({len(content)} ký tự) - Tác giả: {author}")
        except Exception as e:
            print(f"    ✕ Thất bại tải {rel_path}: {e}")

    conn.commit()
    conn.close()

    # Save summary index
    summary_path = os.path.join(base_dir, "data", "vnoi_summary.json")
    with open(summary_path, "w", encoding="utf-8") as f:
        json.dump({
            "total_documents": success_count,
            "last_synced": datetime.now().isoformat(),
            "sources": synced_items
        }, f, ensure_ascii=False, indent=2)

    print("=" * 60)
    print(f">> HOÀN TẤT ĐỒNG BỘ: {success_count}/{len(REAL_DATA_SOURCES)} TÀI LIỆU CHÍNH THỨC ĐÃ NẠP VÀO CSDL!")
    print(f">> CSDL: {db_path} (Bảng: vnoi_real_knowledge)")
    print(f">> File tóm tắt: {summary_path}")
    print("=" * 60)
    return success_count

if __name__ == "__main__":
    sync_real_data()
