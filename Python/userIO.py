#!/usr/bin/python

# name = raw_input() #collect user input until return in stream type
# print name

# number = int(raw_input())
# # number = float(raw_input())
# print number*2


print "Enter a number: "
number1 = int(raw_input())
print "Enter another number: "
number2 = int(raw_input())
print "The sum is: " + str(number1+number2) #need str() conversion function

print "Name of giver?"
name = raw_input()
print("What is the present given?")
present = raw_input()
print "Your age?"
age = raw_input()
print"What is your name?"
yourName = raw_input()

print("Dear" + name + ",")
print("")
print("Thanks for the " + present)
print "Sincerely, \n\n" + yourName
