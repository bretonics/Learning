#!/usr/bin/python


print("Enter a numerator: ")
numer = int(input())
print("Enter a denominator: ")
denom = int(input())
try:
    quotient = numer/denom
    print(quotient)
except ZeroDivisionError: #can specify which exception to handle
    print("Cannot divide by zero")
    print("Enter a new denominator: ")
    denom = int(input())
    quotient = numer/denom
    print(quotient)
