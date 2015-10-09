#!/usr/bin/python

import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), './lib'))

from newton import average, square

num1 = 199
num2 = 78

# print("The average is " + str(average(num1, num2)))

avg = average(num1, num2)
print("The average is " + str(avg))
print("The square of the average " + str(square(avg)))
