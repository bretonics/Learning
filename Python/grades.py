#!/usr/bin/python

grades = ["Andres", 92, "Cati", 83, "Bobby", 64, "Jennifer", 75, "Clayton", 88] #list
print grades[0] + " " + str(grades[1])

#Dictionary
gradesDic = {"Andres":92, "Cati":83, "Bobby":64, "Jennifer":75, "Clayton":88}
print gradesDic
print gradesDic["Andres"]
print gradesDic.keys(), "-->", gradesDic.values()