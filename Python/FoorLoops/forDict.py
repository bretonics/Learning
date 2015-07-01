#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: forDict.py
#
#####################

extension = {"Maggy":"2356", "Andres":"1122", "Bobby":"1245"} #dictionary
print extension.keys() #print dictionary keys
print extension.values() #print dictionary values
print extension["Andres"] #index value with key

for key in extension.keys():
    print key + " extension is: " + extension[key]