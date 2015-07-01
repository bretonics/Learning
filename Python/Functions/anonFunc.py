#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: anonFunc.py
#
#####################


# Anonymous Function
# lambda form
square = lambda x: x*x #Function consists of expression
print square(2)

numbers = [1,2,3,4]
numbersSq = list(map(lambda x: x*x, numbers))
print numbersSq