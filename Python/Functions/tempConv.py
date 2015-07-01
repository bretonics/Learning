#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: tempConv.py
#
#####################

def ftoc(temp):
    return (temp - 32.0) * (5.0/9.0)

def ctof(temp):
    return temp * (5.0/9.0) + 32.0

def convert(temp, toScale):
    if toScale.lower() == "c":
        return ftoc(temp)
    else:
        return ctof(temp)

print "Enter a temperature: "
temp = int(raw_input())
print "Enter the scale to convert to: "
scale = raw_input()
convertedTemp = convert(temp,scale)
print temp, convertedTemp, scale