#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: iterNext.py
#
#####################


#List
numbers = [1,2,3] #list
it = iter(numbers) #explicit iterator
print(next(it)) #display 1st element in iterator
print(next(it))
print(next(it))


# Files
fileIt = open("../grades.txt", "r") #file object is iterator itself
print(next(fileIt), end="")