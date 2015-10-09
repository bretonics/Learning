#!/usr/bin/python

class Student:
    #fields - name, id, grades(list)
    grades = [] #empty list initialized
    def __init__(self, name, id): #constructor
        self.name = name
        self.id = id

    def addGrade(self, grade): #add grade to list
        self.grades.append(grade)

    def showGrades(self): #dislay grades
        grds = ""
        for grade in self.grades:
            grds += str(grade) + " "
        return grds

stu1 = Student("Jones", 123)
stu1.addGrade(88)
stu1.addGrade(84)
stu1.addGrade(91)
print(stu1.showGrades())
