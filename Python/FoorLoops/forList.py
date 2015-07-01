#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: forList.py
#
#####################

numbers = [1,2,3,4,5,6,7,8,9,10]
for i in range(0,len(numbers),2): #increment by 2, skips 1 element each time
    print(numbers[i])