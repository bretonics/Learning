#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: chap7ex1.py
#
#####################

tries = 0
answer = "Andres"

while(tries <3):
    print("What is my name?")
    response = raw_input()
    tries = tries + 1
    if(response == "Andres"):
        print("That is correct!!")
        break
    elif (tries == 3):
        print("Sorry: The answer is Andres")
    else:
        print("Sorry, try again.")