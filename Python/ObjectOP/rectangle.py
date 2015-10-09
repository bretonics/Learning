#!/usr/bin/python

class Shape:
        def __init__(self, xcor, ycor):
            self.x = xcor
            self.y = ycor

        def __str__(self):
            return "x: " + str(self.x) + " y: " + str(self.y)

        def move(self, x1, y1): #move shapes around axis
            self.x = self.x + x1 #move in x axis
            self.y = self.y + y1 #move in y axis

# Rectagle => drive class, Shape base class
# Class Rectangle inherites from class Shape
class Rectangle(Shape): #Drive class
    def __init__(self, xcor, ycor, width, height):
        Shape.__init__(self, xcor, ycor) #call to base class constructor
        self.width = width
        self.height = height

    def __str__(self):
        retStr = Shape.__str__(self) #return state of base class object
        retStr += " width: " + str(self.width) + " height: " + str(self.height)
        return retStr

rec = Rectangle(5,10,8,9)
print(rec)
rec.move(10,12)
print(rec)
