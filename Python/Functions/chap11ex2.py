#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: chap11ex2.py
#
#####################


#Factorial
def factorial(number):
    product = 1 
    for i in range(1,number+1): #iterate 1-number entered
        product *= i #multiple number by product, store in product variable
    return product

print "Enter a number: "
num = int(raw_input())
print str(num) + "! equals " + str(factorial(num))