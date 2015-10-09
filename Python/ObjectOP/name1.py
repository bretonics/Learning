#!/usr/bin/python

#Declare class
class Name:
    #constructor methods ("function")- instantiation => create instances in class
    def __init__(self, first, middle, last): #self parameter refers to current instance in class, always needed
        self.first = first #self.first is 1st field
        self.middle = middle #self.middle is 2nd field
        self.last = last #self.last is 3rd field

    # to-string methods
    #Allows examine/display current state of class object
    def __str__(self):
        return self.first + " " + self.middle + " " + self.last #return fields that make class


    def lastFirst(self):
        return self.last + ", " + self.first + " " + self.middle

    def initials(self):
            return self.first[0] + self.middle[0] + self.last[0]

aName = Name("Mary", "Liz", "Smith") #create instance of class (object)
yourName = Name("Andres", "", "Breton") #another instance

print("aName is " + str(aName))
print(aName.lastFirst()) #call method
print(aName.initials())
