"""
CodeLearn C++ - Authentication & Session Management
File: backend/auth.py
"""
import uuid
from datetime import datetime, timedelta
from backend.database import get_connection, hash_password, verify_password

SESSION_EXPIRY_DAYS = 30

def create_session(user_id: str) -> str:
    """Generates a secure session token and stores it in the database."""
    token = str(uuid.uuid4())
    now = datetime.now()
    expires_at = (now + timedelta(days=SESSION_EXPIRY_DAYS)).isoformat()
    
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO sessions (token, user_id, created_at, expires_at)
        VALUES (?, ?, ?, ?)
    """, (token, user_id, now.isoformat(), expires_at))
    conn.commit()
    conn.close()
    return token

def get_user_from_token(token: str) -> dict | None:
    """Retrieves user object if token is valid and unexpired."""
    if not token:
        return None
        
    conn = get_connection()
    cursor = conn.cursor()
    now = datetime.now().isoformat()
    
    cursor.execute("""
        SELECT u.id, u.username, u.email, u.full_name, u.role, u.avatar, u.created_at
        FROM sessions s
        JOIN users u ON s.user_id = u.id
        WHERE s.token = ? AND s.expires_at > ?
    """, (token, now))
    
    row = cursor.fetchone()
    conn.close()
    
    if row:
        return {
            "id": row["id"],
            "username": row["username"],
            "email": row["email"],
            "fullName": row["full_name"],
            "role": row["role"],
            "avatar": row["avatar"] or "",
            "createdAt": row["created_at"]
        }
    return None

def delete_session(token: str) -> bool:
    """Removes session token upon logout."""
    if not token:
        return False
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM sessions WHERE token = ?", (token,))
    conn.commit()
    deleted = cursor.rowcount > 0
    conn.close()
    return deleted

def register_user(username: str, email: str, password: str, full_name: str = "") -> tuple[bool, str, dict | None]:
    """Registers a new user."""
    username = (username or "").strip().lower()
    email = (email or "").strip().lower()
    
    if len(username) < 3:
        return False, "Tên đăng nhập phải có ít nhất 3 ký tự.", None
    if "@" not in email:
        return False, "Địa chỉ email không hợp lệ.", None
    if len(password) < 6:
        return False, "Mật khẩu phải có ít nhất 6 ký tự.", None
        
    conn = get_connection()
    cursor = conn.cursor()
    
    cursor.execute("SELECT id FROM users WHERE username = ?", (username,))
    if cursor.fetchone():
        conn.close()
        return False, "Tên đăng nhập này đã tồn tại.", None
        
    cursor.execute("SELECT id FROM users WHERE email = ?", (email,))
    if cursor.fetchone():
        conn.close()
        return False, "Địa chỉ email này đã được sử dụng.", None
        
    user_id = "user-" + str(uuid.uuid4())[:8]
    pwd_hash = hash_password(password)
    now = datetime.now().isoformat()
    display_name = full_name.strip() if full_name else username
    
    cursor.execute("""
        INSERT INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at)
        VALUES (?, ?, ?, ?, ?, 'student', '', ?, ?)
    """, (user_id, username, email, pwd_hash, display_name, now, now))
    conn.commit()
    conn.close()
    
    token = create_session(user_id)
    user_data = {
        "id": user_id,
        "username": username,
        "email": email,
        "fullName": display_name,
        "role": "student",
        "avatar": "",
        "createdAt": now
    }
    return True, token, user_data

def authenticate_user(login_identity: str, password: str) -> tuple[bool, str, dict | None]:
    """Authenticates by username or email."""
    identity = (login_identity or "").strip().lower()
    if not identity or not password:
        return False, "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.", None
        
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        SELECT id, username, email, password_hash, full_name, role, avatar, created_at
        FROM users
        WHERE username = ? OR email = ?
    """, (identity, identity))
    
    user = cursor.fetchone()
    conn.close()
    
    if not user:
        return False, "Tài khoản hoặc mật khẩu không chính xác.", None
        
    if not verify_password(password, user["password_hash"]):
        return False, "Tài khoản hoặc mật khẩu không chính xác.", None
        
    token = create_session(user["id"])
    user_data = {
        "id": user["id"],
        "username": user["username"],
        "email": user["email"],
        "fullName": user["full_name"],
        "role": user["role"],
        "avatar": user["avatar"] or "",
        "createdAt": user["created_at"]
    }
    return True, token, user_data
