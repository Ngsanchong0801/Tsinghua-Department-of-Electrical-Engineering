text = input("請輸入一段英文:>>")
up = 0
low = 0

for check in text:
    if check.isupper():
        up = up + 1
    elif check.islower():
        low = low +1

print("大写字母", up, "个")
print("小写字母", low, "个")