#!/usr/bin/python

def calc(op1, op2, op):
    if op == "+":
        return op1 + op2
    elif op == "-":
        return op1 - op2
    elif op == "*":
        return op1 * op2
    elif op == "/":
        return op1 / op2


# Example 2
import os

print("Enter file name to open: ")
name = raw_input()
while not os.path.isfile(name): #check if file exists
    print("File does not exist")
    print("Enter a new file: ")
    name = raw_input()
file = open(name, "r")
for line in file:
    print(line)

# Example 1
# Continue to ask number if divide by zero
cont = "y"
while cont != "n":
    print("Enter the first number: ")
    num1 = int(input())
    print("Enter the second number: ")
    num2 = int(input())
    print("Enter operation: ")
    op = raw_input()
    if op == "/" and num2 == 0:
        print("cannot divide by zero")
        continue
    else:
        print(calc(num1, num2, op))
