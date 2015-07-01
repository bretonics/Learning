#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: functions1.py
#
#####################


# Define function
def square(number): #with paratameter (number)
    return number*number #value returning function

def numVowels(string):
    string = string.lower() #lower case entire string
    count = 0 #count to store number of vowels
    for i in range(len(string)):
        if string[i] == "a" or string[i] == "e" or string[i] == "i" or \
        string[i] == "o" or string[i] == "u":
            count += 1 #composite assignment operators
    return count


# Calling Functions
print "Enter a number: "
num = int(input())
numSquared = square(num) #call function with argument (num)
print str(num) + " squared = " + str(numSquared)

print "Enter a string: "
strng = raw_input()
print "There are " + str(numVowels(strng)) + " vowels in the string."