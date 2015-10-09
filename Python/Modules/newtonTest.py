#!/usr/bin/python

# Use of User Defined Newton Module

import sys
import os.path

sys.path.append(os.path.join(os.path.dirname(__file__), './lib'))

from newton import * #import module

print "Enter a number: "
number = int(input())
print(sqrt(number))
print(average(144,9))
