#!/usr/bin/python

#Nested (lexical) scope
import math
def hypotenus(s1, s2):
    def square(num):
     return num * num
    return math.sqrt(square(s1) + square(s2))

print "Enter length of side 1: "
side1 = int(input())
print  "Enter length of side 2: "
side2 = int(input())
hyp = hypotenus(side1, side2)

print "The hypotenus is " + str(hyp)
