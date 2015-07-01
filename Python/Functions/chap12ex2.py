#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: chap12ex2.py
#
#####################


# Turn list into accronym
# in my humble opinion = IMHO

def first(word): return word[0] #function returning first letter of word passed
words = ['in', 'my', 'humble','opinion'] #list of words
# acro = list(map(first,words)) #in list format

def acronym(words):
    # Turn list into -> string format
    acro = '' #empty variable to use with join
    acro = acro.join(map(first,words)).upper() #turns into string with uppercase letters
    return acro

acro = acronym(words)
print acro