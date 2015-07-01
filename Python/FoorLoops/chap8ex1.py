#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: chap8ex1.py
#
#####################


# Factorial Computation iteratively
# 5! = 5*4*3*2*1 = 120

print("Enter a number: ")
num = int(input()) # input() works just like raw_input()
fact = 1 #stores successive products

for i in range(1, num+1): # need +1 to get range to multiply to num
    fact = fact*i
print(str(num) + "! = " + str(fact))
