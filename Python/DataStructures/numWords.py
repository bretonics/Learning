#!/usr/bin/python

sentence = "Now is the time for all good people to come to the aid of their party"

words = sentence.split(" ") #store each word in list with split delim
words = sorted(words)

print("Sentence in sorted order:")
print(words)

numWords = {} #initialize empty dictionary
for i in range(0, len(words)):
    if words[i] in numWords:
        numWords[words[i]] += 1 #key is word, value is number of times found
    else:
        numWords[words[i]] = 1 #store words in dictionary => value as 1

print "\nWord list and count:"
for key in numWords.keys(): #loop over dictionary keys
    print key, numWords[key] #print key value pair
