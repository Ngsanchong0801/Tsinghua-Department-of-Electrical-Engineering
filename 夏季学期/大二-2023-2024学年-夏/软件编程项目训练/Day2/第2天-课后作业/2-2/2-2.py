import json
import os
import hashlib
import datetime

# 创建空的 account.json 文件
def create_account_file():
    if not os.path.exists("account.json"):
        with open("account.json", "w") as file:
            json.dump({}, file)

create_account_file()

def register():
    username = input("请输入用户名: ")

    if check_username_exists(username):
        print("该用户名已被注册，请选择其他用户名。")
        return
    password = input("请输入密码: ")
    confirm_password = input("请再次输入密码: ")
    if password != confirm_password:
        print("两次输入的密码不一致，请重新注册。")
        return
    if not check_password_requirements(password):
        print("密码需至少包含 6 位，并且包含数字、字母和下划线，请重新注册。")
        return

    expire_date = input("请输入有效期（格式：YYYY-MM-DD）: ")

    account = {
        "expire_date": expire_date,
        "status": 0,
        "password": password
    }
    save_account(username, account)
    print("注册成功！")

def login():
    username = input("请输入用户名: ")
    password = get_hashed_password(input("请输入密码: "))

    if check_credentials(username, password):
        print("登录成功！")
    else:
        print("用户名或密码错误。")

def check_username_exists(username):
    with open("account.json", "r") as file:
        data = json.load(file)
        return username in data

def check_password_requirements(password):
    return len(password) >= 6 and any(char.isalpha() or char.isdigit() or char == "_" for char in password)

def save_account(username, account):
    with open("account.json", "r+") as file:
        data = json.load(file)
        data[username] = account
        file.seek(0)
        json.dump(data, file, indent=4)
        file.truncate()

def get_hashed_password(password):
    # 使用哈希函数对密码进行加密
    hashed_password = hashlib.sha256(password.encode()).hexdigest()
    return hashed_password

def check_date_expired(expire_date):
    # 检查日期是否过期
    # 获取当前日期
    current_date = datetime.date.today()

    # 将过期日期转换为 datetime.date 对象
    expire_date = datetime.datetime.strptime(expire_date, "%Y-%m-%d").date()

    # 检查当前日期是否大于过期日期
    if current_date > expire_date:
        return True
    return False

def check_credentials(username, password):
    with open("account.json", "r") as file:
        data = json.load(file)
        if username in data:
            account = data[username]
            if account["status"] == 1:
                print("账号已被锁定")
                return False
            if account["password"] == password:
                expire_date = account["expire_date"]
                if check_date_expired(expire_date):
                    print("账号已过期")
                    return False
                return True
        return False

register()
login()