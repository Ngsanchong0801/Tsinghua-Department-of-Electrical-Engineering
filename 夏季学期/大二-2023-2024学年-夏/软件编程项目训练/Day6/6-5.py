class MyDict:
    def __init__(self):
        self._data = {}

    def __iter__(self):
        return iter(self._data)

    def __getitem__(self, key):
        return self._data[key]

    def __setitem__(self, key, value):
        self._validate_key(key)
        self._data[key] = value

    def __getattr__(self, key):
        return self._data[key]

    def __setattr__(self, key, value):
        if key == "_data":
            super().__setattr__(key, value)
        else:
            self._validate_key(key)
            self._data[key] = value

    def get(self, key, default=None):
        return self._data.get(key, default)

    def __len__(self):
        return len(self._data)

    def _validate_key(self, key):
        if not isinstance(key, str) or not key.isalnum():
            raise ValueError("Key must be a string consisting of alphanumeric characters or underscores.")


my_dict = MyDict()

my_dict["name"] = "吴晨聪"
my_dict["age"] = 19

my_dict.city = "澳門"
my_dict.country = "中國"

print("Keys:")
for key in my_dict:
    print(key)

print("\nValues:")
print(my_dict["name"])
print(my_dict["age"])

print(my_dict.city)
print(my_dict.country)

print("\nLength:", len(my_dict))