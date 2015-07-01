#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: listComp.py
#
#####################

N = range(1,101) #range of numbers 1-100 stored in list
EN = [x for x in N if x % 2 == 0] #get even numbers (x % 2 == 0 means if divisible by 2)
print(EN)

sent = "now is the time for all good people to come to the aid "
sent += "of their party"
words = sent.split(" ") #string into list, split by delimeter

wlen = [(word, len(word)) for word in words] #list of tuples- stores each word and it's length
for i in wlen:
    print i