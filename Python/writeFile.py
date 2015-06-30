#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: writeFile.py
#
#####################

outFile = open('text.txt', "w")
outFile.write("this is a line 1\n")
outFile.write('this is line 2\n')
outFile.close() #close file object to actually write to file rather than buffer

outFile = open("grades.txt", 'w')
grade = 0
print("Enter a grade (q to quit): ")
grade = raw_input()

while(grade !='q'):
    outFile.write(grade + "\n")
    print("Enter a grade (q to quit): ")
    grade = raw_input()
outFile.close()
