#!/usr/bin/python

import sys

from sphere import * #imports all definitons in module 'sphere'

print("Enter the radius of the sphere: ")
radius = int(input())
print("The area is " + str(area(radius)))
print("The volume is " + str(volume(radius )))
