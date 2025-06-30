tu = ("amao", [11, 22, {"k1": 'v1', "k2": ["age", "name"], "k3": (11,22,33)}, 44])

k2_plus = tu[1][2]["k2"]
k2_plus.append("Jessie")
print(tu)