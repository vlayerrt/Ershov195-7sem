import datetime as DT


def str_to_date(self_date, other_date):
    dt1 = self_date.split(".")
    dt2 = other_date.split(".")
    self_bdate = DT.date(int(dt1[2]), int(dt1[1]), int(dt1[0]))
    other_bdate = DT.date(int(dt2[2]), int(dt2[1]), int(dt2[0]))
    return self_bdate, other_bdate


class Student:
    def __init__(self, number, fio, bdate, stud, on_leave=False):
        self.number = number
        self.fio = fio
        self.bdate = bdate
        self.salary = stud
        self.on_leave = on_leave

    # Изменяем оклад
    def increase_salary(self, summa):
        self.salary += summa

    # Перехват функции print, когда она преобразует свое значение в строку
    def __str__(self):
        return f"Студент {self.number} {self.fio}, {self.bdate}," \
               f" СтудБилет: {self.salary}, на больничном: {'да' if self.on_leave else 'нет'}"

    # Здесь и ниже операции сравнения >, >=, <, <=, ==, !=
    def __lt__(self, other):  # <
        self_bdate, other_bdate = str_to_date(self.bdate, other.bdate)
        return self_bdate < other_bdate

    def __eq__(self, other):  # ==
        self_bdate, other_bdate = str_to_date(self.bdate, other.bdate)
        return self_bdate == other_bdate

    def __le__(self, other):  # <=
        if self.__eq__(other):
            return True

        if self.__lt__(other):
            return True
        else:
            return False


class Department:
    def __init__(self, title, chief=None, students=None):
        self.title = title
        if students is None:
            students = list()
        self.students = students
        self.chief = chief

    # Добавляем студента в группу отдел
    def append(self, emp):
        self.students.append(emp)

    # Перехват функции print, когда она преобразует свое значение в строку
    # Возврат информации об отделе
    def __str__(self):
        return f"Группа: {self.title}, Куратор: {self.chief.fio}, Количество сотрудников: {len(self.students)} "

    # Вывод сотрудников отдела
    def print_students(self):
        for emp in self.students:
            print(emp)

    # Вывод сотрудников отдела в отпуске/не в отпуске
    def print_students_on_leave(self, status=True):
        for emp in self.students:
            if emp.on_leave == status:
                print(emp.number, emp.fio)


std_1 = Student(1, 'Ершов Владислав Владимирович', '27.02.2003', 1951)
std_2 = Student(2, 'Дьяков Артем Сергеевич', '10.01.2002', 1952)
std_3 = Student(3, 'Савицкий Даниил Валентинович', '12.08.2003', 1953)
std_4 = Student(4, 'Гришакова Татьяна Николаевна', '12.08.2003', 1)


# Сравним по датам рождения
print(std_1 < std_2)
print(std_1 > std_2)
print(std_1 == std_2)
print(std_1 <= std_2)
print(std_1 >= std_2)

depart_1 = Department('195', std_4)
depart_1.append(std_1)
depart_1.append(std_2)
depart_1.append(std_3)

print(depart_1)
depart_1.print_students()
depart_1.print_students_on_leave()
