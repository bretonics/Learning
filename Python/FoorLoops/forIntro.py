#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: forIntro.py
#
#####################

for i in [1,2,3,4,5]:
    print(i)

numbers = [1,2,3,4,5]
sum = 0
for x in numbers:
    sum = sum + x
print(sum)


word = "hello"
for letter in word:
    print(letter)

sentence = "now is the time for all good people to come to the aid"
count = 0 


for letter in sentence:
    if letter == "a" or letter == "e" or letter == "i" \
    or letter == "o" or letter == "u":
        count = count +1
print("The number of vowels is " + str(count))