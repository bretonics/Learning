#!/usr/bin/python


# Functions
def take(num, lyst):
    rlist = []
    for i in range(0, num):
        rlist.append(lyst[i])
    return rlist

def drop(num, lyst):
    rlist = []
    for i in range(num, len(lyst)):
        rlist.append(lyst[i])
    return rlist

names = ['Raymond','Cynthia','David','Jennifer','Clayton'] #List

print(names)

somenames = take(3,names)
print(somenames)

nameDrop = drop(3, names)
print(nameDrop)
