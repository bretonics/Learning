#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: simpleIf.py
#
#####################

print("Enter hours worked: ")
hoursWorked = int((raw_input()))
rate = 25.00

if hoursWorked > 40:
    grossPay = (40 *rate) + ((hoursWorked - 40) * (rate*1.5))
else:
    grossPay = hoursWorked *rate
print("Gross pay: " + str(grossPay)) #to concatenate numeric value -> turn to string1