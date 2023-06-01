# OOP

class Student:
    def __init__(self, name, age, grade):
        self.name = name
        self.age = age
        self.grade = grade

    def get_grade(self):
        return self.get_grade

class Course:
    def __init__(self, name, max_students):
        self.name = name
        self.max_students = max_students
        self.students = []

    def add_students(self, student):
        if len(self.students) < self.max_students:
            self.students.append(student)
            return True
        return False

    def get_average_grade(self):
        value = 0
        for student in self.students:
            value += student.get_grade()
        
        return value / self.students
    
s1 = Student("Tim", 19, 95)
s2 = Student("Bill", 19, 75)
s3 = Student("Jill", 19 , 65)

course = Course("Science", 2)
course.add_students(s1)
course.add_students(s2)
#print(course.students[0].name)
#print(course.get_average_grade())


############### Inheritance 1 ##################

class Pet:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def show(self):
        print(f"I am {self.name} and I am {self.age} years old.")
    
    def speak(self):
        print("I don't know what I say.")

class Cat(Pet):
    def __init__(self, name, age, color):
        super().__init__(name, age)
        self.color = color

    def speak(self):
        print("Meow")

    def show(self):
        print(f"I am {self.name} and I am {self.age} years old and I am {self.color}.")

class Dog(Pet):
    def speak(self):
        print("Bark")

class fish(Pet):
    pass

p = Pet("TIm", 19)
p.show
c = Cat("Bill", 34, "Orange")
c.show
d = Dog("Jill", 25)
d.show
d.speak()
f = Fish("Bubbles", 10)
f.speak()


############### Inheritance 2 ##################

class Person: 
    number_of_people = 0

    def __init__(self, name):
        self.name = name
        #Person.number_of_people += 1
        Person.add_person()

    @classmethod
    def number_of_people(cls):
        return cls.number_of_people()

    @classmethod
    def add_person(cls):
        cls.number_of_people += 1

p1 = Person("Tim")
#print(Person.number_of_people)
p2 = Person("Jill")
#print(Person.number_of_people)
(Person.number_of_people())


############### Static Method ##################

class Math:

    @staticmethod
    def add5(x):
        return x + 5
    
    @staticmethod
    def add10(x):
        return x + 10

    @staticmethod
    def pr():
        print("run")

math.pr()
