import math


class Shape:
    def perimeter(self):
        pass

    def area(self):
        pass


class Rect(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def perimeter(self):
        return 2 * (self.width + self.height)

    def area(self):
        return self.width * self.height


class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def perimeter(self):
        return 2 * math.pi * self.radius

    def area(self):
        return math.pi * self.radius ** 2


class Square(Rect):
    def __init__(self, side):
        super().__init__(side, side)


# 静态方式生成对象
rect = Rect(4, 5)
circle = Circle(3)
square = Square(6)

print("静态生成对象：")
print(f"矩形的周长：{rect.perimeter()}")
print(f"矩形的面积：{rect.area()}")
print(f"圆形的周长：{circle.perimeter()}")
print(f"圆形的面积：{circle.area()}")
print(f"正方形的周长：{square.perimeter()}")
print(f"正方形的面积：{square.area()}")

# 动态方式生成对象
shapes = [Rect(4, 5), Circle(3), Square(6)]

print("\n动态生成对象：")
for shape in shapes:
    print(f"形状的周长：{shape.perimeter()}")
    print(f"形状的面积：{shape.area()}")
    print()

class Person:
    def __init__(self, name, age, weight, height):
        self._name = name
        self._age = age
        self._weight = weight
        self._height = height
        self._salary = []

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, value):
        if not isinstance(value, str):
            raise ValueError("姓名必须是字符串")
        self._name = value

    @property
    def salary(self):
        return self._salary

    @salary.setter
    def salary(self, value):
        if not isinstance(value, (int, float)):
            raise ValueError("薪水必须是数字")
        self._salary.append(value)

    @property
    def height(self):
        return self._height

    @height.setter
    def height(self, value):
        if not isinstance(value, (int, float)):
            raise ValueError("身高必须是数字")
        self._height = value

    @property
    def age(self):
        return self._age

    @age.setter
    def age(self, value):
        if not isinstance(value, int):
            raise ValueError("年龄必须是整数")
        self._age = value

    @property
    def bmi(self):
        return self._weight / (self._height ** 2)

    @property
    def avg_monthly_salary(self):
        if len(self._salary) == 0:
            return 0
        return sum(self._salary) / len(self._salary)

    @property
    def total_annual_salary(self):
        return sum(self._salary)


person = Person("张三", 25, 70, 1.75)

try:
    person.name = 123
except ValueError as e:
    print(e)

try:
    person.salary = "abc"
except ValueError as e:
    print(e)

try:
    person.height = "abc"
except ValueError as e:
    print(e)

try:
    person.age = 25.5
except ValueError as e:
    print(e)

person.salary = 5000
person.salary = 6000
person.salary = 7000

# 输出属性值
print(f"姓名：{person.name}")
print(f"BMI：{person.bmi}")
print(f"平均月工资：{person.avg_monthly_salary}")
print(f"年工资总和：{person.total_annual_salary}")