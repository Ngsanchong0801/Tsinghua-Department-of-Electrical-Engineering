#将字符串 s = "amao"转换成列表
s = "amao"
s_list = list(s)
print(s_list)
print("")

#将字符串 s = "amao"转换成元組
s_tuple = tuple(s)
print(s_tuple)
print("")

#将列表 li = ["amao", "jessie"]转换成元组
li = ["amao", "jessie"]
li_tuple = tuple(li)
print(li_tuple)
print("")

#将元祖 tu = ('Amao', "jessie")转换成列表
tu = ('Amao', "jessie")
tu_list = list(tu)
print(tu_list)
print("")

#将列表 li = ["amao", "jessie"]转换成字典且字典的 key 按照 10 开始向后递增
li = ["amao", "jessie"]
li_dict = {i + 10: value for i, value in enumerate(li)}
print(li_dict)