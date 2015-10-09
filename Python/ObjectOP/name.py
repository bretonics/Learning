#!/usr/bin/python

#Declare class
class Name:
    #constructor methods ("function")- instantiation => create instances in class
    def __init__(self, first, middle, last): #self parameter refers to current instance in class, always needed
        self.first = first #self.first is 1st field
        self.middle = middle #self.middle is 2nd field
        self.last = last #self.last is 3rd field


aName = Name("Mary", "Liz", "Smith") #create instance of class (object)
yourName = Name("Andres", "Breton") #another instance
