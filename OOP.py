class Student:
    def __init__(self, name, surname, gender):
        self.name = name
        self.surname = surname
        self.gender = gender
        self.finished_courses = []
        self.courses_in_progress = []
        self.grades = {}

    def rate_lectore(self, lectore, course, grade):
        if isinstance(lectore, Lectore) and course in lectore.courses_attached and course in self.courses_in_progress:
            if course in lectore.grades1:
                lectore.grades1[course] += [grade]
            else:
                lectore.grades1[course] = [grade]
        else:
            return 'Ошибка'

    def __str__(self):
        restart = f' Имя: {self.name} \n Фамилия: {self.surname} \n Средняя оценка за домашние задания: {self.grades} \n Курсы в процессе изучения: {self.courses_in_progress} \n Завершенные курсы: {self.finished_courses}'
        return restart

    def __lt__(self, other):
        if not isinstance(other, Student):
            return TypeError('Not equalse')
        else:
            self.aver_grade < other.aver_grade

    def aver_grade(self):
        self.average = round(sum(sum(self.grades.values(), [])) / len(sum(self.grades.values(), [])), 1)
        return self.average


class Mentor:
    def __init__(self, name, surname):
        self.name = name
        self.surname = surname
        self.courses_attached = []


class Lectore(Mentor):
    def __init__(self, name, surname):
        super().__init__(name, surname)
        self.grades1 = {}

    def __str__(self):
        restart = f' Имя: {self.name} \n Фамилия: {self.surname} \n Средняя оценка за лекции: {self.grades1}'
        return restart

    def __lt__(self, other):
        if not isinstance(other, Lectore):
            return TypeError('Not equalse')
        else:
            self.aver_rate < other.aver_rate

    def aver_rate(self):
        self.rate1 = round(sum(sum(self.grades1.values(), [])) / len(sum(self.grades1.values(), [])), 1)
        return self.rate1


class Reviewer(Mentor):
    def __init__(self, name, surname):
        super().__init__(name, surname)

    def rate_students(self, student, course, grade):
        if isinstance(student, Student) and course in self.courses_attached and course in student.courses_in_progress:
            if course in student.grades:
                student.grades[course] += [grade]
            else:
                student.grades[course] = [grade]
        else:
            return 'Ошибка'

    def __str__(self):
        restart = f'Имя: {self.name} \n Фамилия: {self.surname}'
        return restart


Ivan_lectore = Lectore('Ivan', 'Ivanov')
Vlad_lectore = Lectore('Vald', 'Vladov')
Ivan_lectore.courses_attached += ['python', 'Git']
Vlad_lectore.courses_attached += ['python', 'Git']

Pav_reviewer = Reviewer('Pavel', 'Pavlov')
Ant_reviewer = Reviewer('Anton', 'Antonov')
Pav_reviewer.courses_attached += ['python', 'Git']
Ant_reviewer.courses_attached += ['python', 'Git']

Tan_student = Student('Tanya', 'Tanova', 'female')
Ser_student = Student('Sergey', 'Sergeev', 'male')

Tan_student.courses_in_progress = ['python', 'Git']
Tan_student.finished_courses = ['Введение в программирование']
Ser_student.courses_in_progress = ['python', 'Git']
Ser_student.finished_courses = ['Введение в программирование']

Pav_reviewer.rate_students(Tan_student, 'python', 10)
Pav_reviewer.rate_students(Tan_student, 'Git', 9)
Ant_reviewer.rate_students(Tan_student, 'python', 10)
Ant_reviewer.rate_students(Tan_student, 'Git', 8)

Pav_reviewer.rate_students(Ser_student, 'python', 9)
Pav_reviewer.rate_students(Ser_student, 'Git', 9)
Ant_reviewer.rate_students(Ser_student, 'python', 7)
Ant_reviewer.rate_students(Ser_student, 'Git', 8)

Tan_student.rate_lectore(Ivan_lectore, 'python', 9)
Tan_student.rate_lectore(Ivan_lectore, 'Git', 10)
Tan_student.rate_lectore(Vlad_lectore, 'python', 7)
Tan_student.rate_lectore(Vlad_lectore, 'Git', 9)

Ser_student.rate_lectore(Ivan_lectore, 'python', 7)
Ser_student.rate_lectore(Ivan_lectore, 'Git', 7)
Ser_student.rate_lectore(Vlad_lectore, 'python', 10)
Ser_student.rate_lectore(Vlad_lectore, 'Git', 10)

student_list = [Tan_student, Ser_student]


def grade_av_student(student_list, course):
    sum = 0
    count = 0
    for person in student_list:
        for i in person.grades[course]:
            sum += i
            count += 1
    return round(sum / count, 1)


lectore_list = [Vlad_lectore, Vlad_lectore]


def grade_av_lectore(lectore_list, course):
    sum = 0
    count = 0
    for person in lectore_list:
        for i in person.grades1[course]:
            sum += i
            count += 1
    return round(sum / count, 1)


print(Tan_student, '\n', '\n', Ser_student, '\n')
print(Pav_reviewer, '\n', '\n', Ant_reviewer, '\n')
print(Ivan_lectore, '\n', '\n', Vlad_lectore, '\n')

print(Tan_student.aver_grade() < Ser_student.aver_grade())
print(Ivan_lectore.aver_rate() < Vlad_lectore.aver_rate())
print()

print(f'средняя оценка у лекторов за Python', (grade_av_lectore(lectore_list, 'python')))
print(f'средняя оценка у лекторов за Git', (grade_av_lectore(lectore_list, 'Git')))

print(f'средняя оценка у студентов за Python', (grade_av_student(student_list, 'python')))
print(f'средняя оценка у студентов за Git', (grade_av_student(student_list, 'Git')))
