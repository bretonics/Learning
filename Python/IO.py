#!/usr/bin/python

#Input/Output
word ="hello"
number = 100

print word, number

name = "John"
grade = 89
string = "%s: %.2f" %(name, grade) #format string, %s (string) %f(floating point # 2 decimals)
print string


import sys
# sys.stdout.write("hello\n")

# sys.stdout = open("text.txt", "w") #write to file
# print "Inside file?" #print inside file
# exit() #exit redirect to file

# sys.stdout = sys.__stdout__   #reset sys.stdout


fileName = open("text.txt", "a") #file object, append "a"
print >> fileName, "printing inside file with print redirection"
fileName.close()
