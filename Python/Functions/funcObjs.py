#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: funcObjs.py
#
#####################


# Function Objects, function is an object

def square(number): return number* number

num = 2
sqnum = square(num)
print sqnum

#assign function to variable
sqnumber = square 
sqnum = sqnumber(2)
print sqnum


# Higher-order function:
# Pass function as argument to other function
numbers = [1,2,3,4]

# Map function takes 2 arguments (function, sequence data) 
# and applies function to each element in data
numbersSq = list(map(square, numbers)) #make list with map function
print numbersSq