#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: recursion.py
#
#####################



def explode(word):
    if len(word) <= 1:
        return word
    else:
        return word[0] + " " + explode(word[1:]) #recurse through rest of word -> 1:

print(explode("hello"))


def removeDups(word):
    if len(word) <= 1:
        return word
    elif word[0] == word[1]:
        return removeDups(word[1:]) #recursive call by taking slice of word starting at next letter
    else:
        return word[0] + removeDups(word[1:])


word = "aabbbcccdddd"
print removeDups(word)
