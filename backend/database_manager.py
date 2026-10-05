"""
CodeLearn C++ - Complete Database Manager & Migration Utility
File: backend/database_manager.py
Cung cấp toàn bộ công cụ quản lý, sao lưu (backup), phục hồi (restore),
xuất file SQL (export SQL) và JSON (export JSON) cho cơ sở dữ liệu.
"""

import os
import sys
import sqlite3
import json
import shutil
from datetime import datetime

# Windows Console UTF-8 encoding support
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BACKEND_DIR = os.path.join(BASE_DIR, "backend")
DB_PATH = os.path.join(BACKEND_DIR, "database.db")
SCHEMA_PATH = os.path.join(BACKEND_DIR, "schema.sql")
SEED_SQL_PATH = os.path.join(BACKEND_DIR, "seed.sql")
DUMP_JSON_PATH = os.path.join(BACKEND_DIR, "database_dump.json")
BACKUP_DIR = os.path.join(BACKEND_DIR, "backups")

def get_connection():
    """Tạo kết nối SQLite với Row factory dạng dictionary và chế độ WAL."""
    conn = sqlite3.connect(DB_PATH, timeout=10.0)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON")
    conn.execute("PRAGMA journal_mode = WAL")
    conn.execute("PRAGMA busy_timeout = 5000")
    return conn

def init_schema():
    """Khởi tạo cấu trúc bảng từ schema.sql."""
    if not os.path.exists(SCHEMA_PATH):
        raise FileNotFoundError(f"Không tìm thấy file schema: {SCHEMA_PATH}")

    with open(SCHEMA_PATH, "r", encoding="utf-8") as f:
        schema_sql = f.read()

    conn = get_connection()
    conn.executescript(schema_sql)
    conn.commit()
    conn.close()
    print("✓ Đã khởi tạo cấu trúc các bảng từ schema.sql thành công.")

def get_stats():
    """Lấy thống kê tổng thể của database."""
    if not os.path.exists(DB_PATH):
        return {"exists": False}

    conn = get_connection()
    cursor = conn.cursor()

    tables = ["users", "sessions", "lessons", "exercises", "progress", "submissions", "settings"]
    table_stats = {}

    for t in tables:
        try:
            cursor.execute(f"SELECT COUNT(*) as count FROM {t}")
            table_stats[t] = cursor.fetchone()["count"]
        except Exception:
            table_stats[t] = 0

    # Lấy kích thước file
    size_bytes = os.path.getsize(DB_PATH)
    size_kb = round(size_bytes / 1024, 2)

    # Kiểm tra toàn vẹn
    cursor.execute("PRAGMA integrity_check")
    integrity = cursor.fetchone()[0]

    # Danh sách backup có sẵn
    backups = []
    if os.path.exists(BACKUP_DIR):
        for f in sorted(os.listdir(BACKUP_DIR), reverse=True):
            if f.endswith(".db") or f.endswith(".bak"):
                fp = os.path.join(BACKUP_DIR, f)
                backups.append({
                    "filename": f,
                    "size_kb": round(os.path.getsize(fp) / 1024, 2),
                    "created_at": datetime.fromtimestamp(os.path.getmtime(fp)).isoformat()
                })

    conn.close()

    return {
        "exists": True,
        "path": DB_PATH,
        "size_kb": size_kb,
        "integrity": integrity,
        "tables": table_stats,
        "backups_count": len(backups),
        "backups": backups[:5]
    }

def backup_database():
    """Tạo bản sao lưu timestamped trong thư mục backend/backups/."""
    os.makedirs(BACKUP_DIR, exist_ok=True)
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_filename = f"backup_{timestamp}.db"
    backup_filepath = os.path.join(BACKUP_DIR, backup_filename)

    # Sử dụng SQLite backup API để đảm bảo tính nhất quán (ACID transaction-safe)
    src_conn = get_connection()
    dst_conn = sqlite3.connect(backup_filepath)
    src_conn.backup(dst_conn)
    dst_conn.close()
    src_conn.close()

    size_kb = round(os.path.getsize(backup_filepath) / 1024, 2)
    print(f"✓ Đã tạo bản sao lưu thành công: {backup_filename} ({size_kb} KB)")
    return {
        "success": True,
        "filename": backup_filename,
        "filepath": backup_filepath,
        "size_kb": size_kb,
        "timestamp": timestamp
    }

def restore_database(backup_filename_or_path):
    """Phục hồi database từ bản sao lưu."""
    if os.path.isabs(backup_filename_or_path):
        target_path = backup_filename_or_path
    else:
        target_path = os.path.join(BACKUP_DIR, backup_filename_or_path)

    if not os.path.exists(target_path):
        raise FileNotFoundError(f"Không tìm thấy bản sao lưu: {target_path}")

    # Trước khi restore, tạo 1 bản backup an toàn cho hiện tại
    backup_database()

    # Restore
    shutil.copy2(target_path, DB_PATH)
    print(f"✓ Phục hồi cơ sở dữ liệu thành công từ: {os.path.basename(target_path)}")
    return True

def export_json(output_path=DUMP_JSON_PATH):
    """Xuất toàn bộ database thành cấu trúc JSON tiêu chuẩn."""
    conn = get_connection()
    cursor = conn.cursor()

    tables = ["users", "sessions", "lessons", "exercises", "progress", "submissions", "settings"]
    data = {
        "_metadata": {
            "exported_at": datetime.now().isoformat(),
            "generator": "CodeLearn C++ Database Manager 2.0",
            "version": "2.0.0"
        }
    }

    for t in tables:
        cursor.execute(f"SELECT * FROM {t}")
        rows = [dict(r) for r in cursor.fetchall()]
        data[t] = rows

    conn.close()

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f"✓ Đã xuất dữ liệu Database thành công sang JSON: {output_path}")
    return output_path

def export_sql(output_path=SEED_SQL_PATH):
    """Xuất dữ liệu thành tệp SQL chứa toàn bộ lệnh INSERT tương thích đa nền tảng."""
    conn = get_connection()
    cursor = conn.cursor()

    tables = ["users", "lessons", "exercises", "settings", "progress"]
    lines = [
        "-- ==============================================================================",
        "-- CODELEARN C++ ACADEMY - SEED DATA & DUMP",
        f"-- Tạo lúc: {datetime.now().isoformat()}",
        "-- Tương thích: SQLite 3 / MySQL / PostgreSQL",
        "-- ==============================================================================\n"
    ]

    for t in tables:
        cursor.execute(f"SELECT * FROM {t}")
        rows = cursor.fetchall()
        if not rows:
            continue

        lines.append(f"-- ------------------------------------------------------------------------------")
        lines.append(f"-- Dữ liệu bảng `{t}` ({len(rows)} bản ghi)")
        lines.append(f"-- ------------------------------------------------------------------------------")

        col_names = [d[0] for d in cursor.description]
        col_str = ", ".join(col_names)

        for row in rows:
            val_strs = []
            for v in row:
                if v is None:
                    val_strs.append("NULL")
                elif isinstance(v, (int, float)):
                    val_strs.append(str(v))
                else:
                    escaped = str(v).replace("'", "''")
                    val_strs.append(f"'{escaped}'")
            val_str = ", ".join(val_strs)
            lines.append(f"INSERT OR REPLACE INTO {t} ({col_str}) VALUES ({val_str});")
        lines.append("")

    conn.close()

    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"✓ Đã xuất dữ liệu Database thành công sang SQL: {output_path}")
    return output_path

def check_integrity():
    """Kiểm tra toàn vẹn dữ liệu và cấu trúc quan hệ khóa ngoại."""
    conn = get_connection()
    cursor = conn.cursor()

    # 1. Integrity check
    cursor.execute("PRAGMA integrity_check")
    integrity_result = cursor.fetchall()

    # 2. Foreign key check
    cursor.execute("PRAGMA foreign_key_check")
    fk_violations = cursor.fetchall()

    conn.close()

    is_ok = len(integrity_result) == 1 and integrity_result[0][0] == "ok" and len(fk_violations) == 0

    return {
        "status": "HEALTHY" if is_ok else "ERROR",
        "integrity": [r[0] for r in integrity_result],
        "foreign_key_violations": [dict(r) for r in fk_violations] if fk_violations else []
    }

def print_cli_stats():
    """In bảng thống kê chi tiết ra màn hình console."""
    stats = get_stats()
    check = check_integrity()

    print("=" * 60)
    print("📊 THỐNG KÊ CƠ SỞ DỮ LIỆU CODELEARN C++ (DATABASE DASHBOARD)")
    print("=" * 60)
    print(f"• Đường dẫn file : {stats.get('path')}")
    print(f"• Kích thước     : {stats.get('size_kb')} KB")
    print(f"• Trạng thái     : {check['status']} (Integrity: {stats.get('integrity')})")
    print(f"• Bản sao lưu    : {stats.get('backups_count')} bản lưu trong backend/backups/")
    print("-" * 60)
    print("Chi tiết các bảng dữ liệu:")
    for tbl, count in stats.get("tables", {}).items():
        print(f"  - [{tbl.upper():<12}]: {count:>4} bản ghi")
    print("=" * 60)

def main():
    """CLI dispatcher."""
    args = sys.argv[1:]
    cmd = args[0] if args else "stats"

    if cmd == "init":
        init_schema()
    elif cmd == "stats":
        print_cli_stats()
    elif cmd == "backup":
        backup_database()
    elif cmd == "export-sql":
        export_sql()
    elif cmd == "export-json":
        export_json()
    elif cmd == "export":
        export_sql()
        export_json()
    elif cmd == "check":
        res = check_integrity()
        print("Trạng thái toàn vẹn Database:", res)
    elif cmd == "restore":
        if len(args) < 2:
            print("Cách dùng: python backend/database_manager.py restore <ten_file_backup>")
            sys.exit(1)
        restore_database(args[1])
    else:
        print("Cách sử dụng: python backend/database_manager.py [command]")
        print("Commands: stats | backup | export | export-sql | export-json | check | init | restore")

if __name__ == "__main__":
    main()
