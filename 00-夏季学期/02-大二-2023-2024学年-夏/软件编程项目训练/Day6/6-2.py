class Course:
    def __init__(self, name):
        self.name = name
        self.teachers = []
        self.students = []
        self.scores = {}

    def add_student(self, student):
        self.students.append(student)

    def drop_student(self, student):
        if student in self.students:
            self.students.remove(student)

    def add_teacher(self, teacher):
        self.teachers.append(teacher)

    def drop_teacher(self, teacher):
        if teacher in self.teachers:
            self.teachers.remove(teacher)

    def set_score(self, student, score):
        self.scores[student] = score

    def get_score(self, student):
        return self.scores.get(student)


class Student:
    def __init__(self, name, sex, student_id):
        self.name = name
        self.sex = sex
        self.student_id = student_id
        self.courses = []

    def select_course(self, course):
        self.courses.append(course)
        course.add_student(self)

    def drop_course(self, course):
        if course in self.courses:
            self.courses.remove(course)
            course.drop_student(self)

    def get_score(self, course):
        return course.get_score(self)


class Teacher:
    def __init__(self, name, sex):
        self.name = name
        self.sex = sex
        self.courses = []

    def select_course(self, course):
        self.courses.append(course)
        course.add_teacher(self)

    def drop_course(self, course):
        if course in self.courses:
            self.courses.remove(course)
            course.drop_teacher(self)

    def set_score(self, course, student, score):
        if course in self.courses and student in course.students:
            course.set_score(student, score)


# 课程
course1 = Course("數學")
course2 = Course("英文")
course3 = Course("中文")
course4 = Course("體育")
course5 = Course("物理")

# 学生
student1 = Student("A", "Female", 1)
student2 = Student("B", "Male", 2)
student3 = Student("C", "Male", 3)
student4 = Student("D", "Male", 4)
student5 = Student("E", "Female", 5)
student6 = Student("F", "Male", 6)
student7 = Student("G", "Female", 7)
student8 = Student("H", "Male", 8)
student9 = Student("I", "Female", 9)
student10 = Student("J", "Male", 10)

# 创建教师对象
teacher1 = Teacher("李老師", "Male")
teacher2 = Teacher("陳老師", "Female")
teacher3 = Teacher("王老師", "Male")

# 教师选择课程
teacher1.select_course(course1)
teacher2.select_course(course2)
teacher3.select_course(course3)

# 学生选择课程
student1.select_course(course1)
student2.select_course(course2)
student3.select_course(course3)
student4.select_course(course4)
student5.select_course(course5)

# 打分
teacher1.set_score(course1, student1, 45)
teacher2.set_score(course2, student2, 99)
teacher3.set_score(course3, student3, 60)

# 查分
print(student1.name, "在", course1.name, "课程中的成绩是：", student1.get_score(course1))
print(student2.name, "在", course2.name, "课程中的成绩是：", student2.get_score(course2))
print(student3.name, "在", course3.name, "课程中的成绩是：", student3.get_score(course3))
