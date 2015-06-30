#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: readFile.py
#
#####################

inFile = open("text.txt", "r") #open file
line = inFile.readline() #read line - reads 1 line
print(line)


count = 0
total = 0
inFile = open('grades.txt', "r")
grade = inFile.readline() #read first grade as string

while(grade): #loop while not empty string
    print(grade)
    count = count+1
    total = total + int(grade)
    grade = inFile.readline()
average = total/count
print ("Average: " + str(average))