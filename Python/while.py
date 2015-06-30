#!/usr/bin/python

import sys

# - - - - - - - - - - - - - - 
#
# 	Created by: breton
#	File: while.py
#
# - - - - - - - - - - - - - - 


# COUNT-CONTROLLED
number = 1
while number <= 10:
    print(number)
    number = number + 1


number = 1
sum = 0
while number <= 10:
    sum = sum + number
    number = number + 1
print("The sum is " + str(sum))

balance = 5000
rate = 1.02
year = 1
while year <= 10:
    balance = balance *rate
    print("Year " + str(year) + ": " + str(balance))
    year = year + 1



# EVENT CONTROLLED

average = 0.0
total = 0
count = 0
print("Enter a grade (-1 to quit): ")
grade = int(raw_input())

while grade != -1:
    total = total + grade
    count = count +1
    print("Enter a grade (-1 to quit): ")
    grade = int(raw_input())
average = total/count
print("Average grade: " + str(average))
