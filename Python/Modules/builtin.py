#!/usr/bin/python

import os
import math

files = os.popen("ls *.py")
for file in files:
        print file

print(math.fabs(-123.45))
