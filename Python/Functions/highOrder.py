#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: highOrder.py
#
#####################

## High-order Functions

# Map Function
def square(number): return number*number

numbers = [1,2,3,4]
print numbers
numbersSq = list(map(square, numbers))
print numbersSq


# Filter Function
# returns elements in sequence meeting criteria
def even(numbers):
    if numbers % 2 == 0:
        return True
    else:
        return False

numbers = list(range(1,11)) #list 1-10
print numbers
evens = list(filter(even, numbers)) #returns only those passing (T boolean) even function
print evens


# Reduce Function
def sum(x,y): return x+y
numbers = list(range(1,11))
import functools #import library
sum = functools.reduce(sum,numbers) #apply function to sequence
print "Sum of range is " + str(sum)