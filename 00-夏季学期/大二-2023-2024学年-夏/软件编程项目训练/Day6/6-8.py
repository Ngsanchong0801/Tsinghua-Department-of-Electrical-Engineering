class File:
    def __init__(self, filename, mode):
        self.filename = filename
        self.mode = mode
        self.file = None

    def __enter__(self):
        try:
            self.file = open(self.filename, self.mode)
            return self.file
        except IOError as e:
            print("Error opening file:", str(e))
            return None

    def __exit__(self, exc_type, exc_val, exc_tb):
        if self.file:
            try:
                self.file.close()
            except IOError as e:
                print("Error closing file:", str(e))

    def open(self):
        try:
            self.file = open(self.filename, self.mode)
        except IOError as e:
            print("Error opening file:", str(e))

    def close(self):
        if self.file:
            try:
                self.file.close()
            except IOError as e:
                print("Error closing file:", str(e))

    def read(self):
        if self.file:
            try:
                return self.file.read()
            except IOError as e:
                print("Error reading file:", str(e))
                return None

    def readline(self):
        if self.file:
            try:
                return self.file.readline()
            except IOError as e:
                print("Error reading file:", str(e))
                return None

    def readlines(self):
        if self.file:
            try:
                return self.file.readlines()
            except IOError as e:
                print("Error reading file:", str(e))
                return []

    def write(self, content):
        if self.file:
            try:
                self.file.write(content)
            except IOError as e:
                print("Error writing to file:", str(e))

    def writeline(self, line):
        if self.file:
            try:
                self.file.write(line + "\n")
            except IOError as e:
                print("Error writing to file:", str(e))

    def writelines(self, lines):
        if self.file:
            try:
                self.file.writelines(lines)
            except IOError as e:
                print("Error writing to file:", str(e))


# 示例用法
with File("test.txt", "w") as file:
    file.write("Line 1\n")
    file.write("Line 2\n")
    file.write("Line 3\n")

with File("test.txt", "r") as file:
    content = file.read()
    print(content)

    file.close()

with File("test.txt", "r") as file:
    lines = file.readlines()
    print(lines)