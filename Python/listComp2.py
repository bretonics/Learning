#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: listComp2.py
#
#####################


#List comprehension from files
file = open("grades.txt")
grades = file.readlines() #read ALL lines in file
print grades

for i in range(len(grades)):
    grades[i] = grades[i].rstrip() #remove new line character at end
print grades

# List comprehension -> open file, iteratare, apply stripping
grades = [grade.rstrip() for grade in open("grades.txt")] #1 liner for above
print grades