#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: cahp9ex1.py
#
#####################


#Tuple data structures
square = ((10,8), (10,23), (25,23), (25,8)) #define square - 4 touples inside touple
for points in square:
    print points

print "Using iterator..."
squareIt = iter(square) #iterator object
print next(squareIt)
print next(squareIt)
print next(squareIt)
print next(squareIt)
