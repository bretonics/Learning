#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: listComp1.py
#
#####################

# List comprehension is a backwards for loop

grades = [71,81,77,84]
print grades

# for i in range(len(grades)):
#     grades[i] = grades[i] +5
# print grades

grades = [grade + 5 for grade in grades] #list comprehension -> shortcut in for loops
print grades


words = ["NOW","IS","THE","TIME"] #list
print words
words = [word.lower() for word in words] #make each word lowercase
print words
