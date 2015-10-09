#!/usr/bin/python

import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), './lib'))

import newton
print(newton.sqrt(9))

def square(number):
    print("Not from the newton module:")
    return number * number


num = 12
print("Square from newton.py")
print(newton.square(num))
print("Square from main program:")
print square(num)
