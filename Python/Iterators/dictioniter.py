#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: dictioniter.py
#
#####################

grades = {"Andres":100, "Marta":98, "Paco":45} #dictionary
for key in grades.keys():
    print key, grades[key]

it = iter(grades)
print(next(it))

for key in grades:
    print key, grades[key]