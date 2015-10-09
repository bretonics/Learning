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

    def __str__(self):
        return "Name: " + self.name + "\nID: " + str(self.id) + "\nGrades: " + str(self.showGrades())

    def average(self):
        total = 0
        for grade in self.grades:
                total += grade
        return total/len(self.grades)


studentObject = Student("Jones", 123) #object

studentObject.addGrade(88)
studentObject.addGrade(84)
studentObject.addGrade(91)

print(studentObject.showGrades())
print(studentObject)
print("Average: " + str(studentObject.average()))
