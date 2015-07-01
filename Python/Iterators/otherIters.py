#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: otherIters.py
#
#####################

numbers = range(1,11) # 1-10, it's like list/dictionary
it = iter(numbers)
# print next(it) #1st number in range

import os #import POPEN libraries, returns sequence of data by running system command
files = os.popen("ls *.py") #gets all current .py files in current directory
fileIt = iter(files) #file iterator
print next(fileIt)

for file in files:
    print file
