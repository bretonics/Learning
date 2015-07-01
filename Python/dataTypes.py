#!/usr/bin/python


str = " hello world "
print(str.split(" "))
print(str.strip())
print(str.rstrip())


#DATA TYPES

#Lists
numbers = [1,2,3,4,5]
print(numbers[0:2])
len(numbers)

words = ["the", "time", "is", "now"]
print words[3]*3

names = ["Joe", "Mary", ["Billie Joe"], "Andres"]


#Dictionary -> like hashes in perl
phoneList = {"Jane":"233", "Bob":"177"}
print "This is Jane's number:", phoneList["Jane"]

print phoneList.keys() #retrive dictionary keys
print phoneList.values() #retrive dictionary values


#Tuple - like a list, but immutable object
#every time it changes, new copy created
# *** can be used as key in dictionary ***
numbers = (1,2,3,4)
print numbers[1]
print len(numbers)
sentence = ("now", "is", "never")
print sentence*2


