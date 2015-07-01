#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: predicate.py
#
#####################


#Predicate functions - returns BOOLEAN
def isVowel(letter):
        if letter == "a" or letter == "e" or letter == "i" or \
            letter == "o" or letter == "u":
                return True
        else:
            return False


def numVowels(string):
    string = string.lower() #lower case entire string
    count = 0 #count to store number of vowels
    for i in range(len(string)):
        if isVowel(string[i]):
            count += 1 #composite assignment operators
    return count


print "Enter a string: "
strng = raw_input()
print "There are " + str(numVowels(strng)) + " vowels in the string."