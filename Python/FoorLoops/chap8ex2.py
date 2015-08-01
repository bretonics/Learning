#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: chap8ex2.py
#
#####################


# loop through grades file -> create histogram
bar = "" #holds asterix
for grade in open("../grades.txt"):
    for i in range(1, int(grade)+1): #go through all numbers up until grade value
        if i % 5 == 0: #if i is evenly diveded by 5
            bar = bar+"*"
    print(bar, i)
    bar = ""