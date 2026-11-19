class MyList:
    def __init__(self):
        self._data = []

    def __iter__(self):
        return iter(self._data)

    def __getitem__(self, index):
        return self._data[index]

    def __setitem__(self, index, value):
        self._validate_value(value)
        self._data[index] = value

    def append(self, value):
        self._validate_value(value)
        self._data.append(value)

    def find(self, value):
        self._validate_value(value)
        return self._data.index(value)

    def __len__(self):
        return len(self._data)

    def _validate_value(self, value):
        if not isinstance(value, (str, int)):
            raise ValueError("錯啦")


my_list = MyList()
my_list.append("Tsinghua")
my_list.append(5)

print("ele:")
for element in my_list:
    print(element)

print("\nGet item by index:")
print(my_list[0])
print(my_list[1])

print("\nFind element:")
print(my_list.find("Tsinghua"))
print(my_list.find(5))

print("\nLength:", len(my_list))