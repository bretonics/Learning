#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: cahp12ex2.py
#
#####################


# Recursive function
def countLetters(words):
    if len(words) < 1:
        return 0
    else:
        print len(words)
        return len(words[0]) + countLetters(words[1:]) 
        #return length of 1st word in list, then recursive call to fucntion, take slice from 2nd word

sentence = ["now","is",'the', "time"]
print sentence
print countLetters(sentence)