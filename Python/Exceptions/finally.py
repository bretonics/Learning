#!/usr/bin/python

try:
    print("Enter a file name: ")
    name = input()
    file = open(name, "w")
    display(file)
except:
    print("Error with a file")
    print("Enter a new file name: ")
    name = input()
    file = open(name, "w")
    display(file)
finally: #used to make sure statements are executed no matter what
    file.close()
