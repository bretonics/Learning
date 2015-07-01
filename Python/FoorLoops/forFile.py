#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: forFile.py
#
#####################

# while style
inFile = open("../text.txt", 'r')
line = inFile.readline()
while line:
    print(line)  # end="" supresses line feed added by print function => no new line
    line = inFile.readline()

# for style
for line in open("../text.txt"):
    print line


sum = 0
count = 0

for grade in open("../grades.txt"):
    print(grade, end="")
    sum = sum + int(grade)
    count = count + 1
average = sum/count
print "Average: " + str(average)