#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: continue.py
#
#####################

# Continue, takes back to next iteration in loop
numer = 0
denom = 0
while denom != -1:
    print("Enter a numerator: ")
    numer = float(raw_input())
    print("Enter a denominator: ")
    denom = float(raw_input())
    if denom == 0:
        continue
    print(numer/denom)


# Break, exits loop
number = 0
total = 0
average = 0.0
count = 0
while True:
    print("Enter a number: ")
    number = float(raw_input())
    if number == -1:
        break
    total = total + number
    count = count + 1
average = total/count
print("Average: " + str(average))