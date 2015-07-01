#!/usr/bin/python

import sys

#####################
#
# 	Created by: breton
#	File: chap11ex1.py
#
#####################


# Tax rates
#0-240 0%
#241-480 15%
#481- 28%

def tax(amount):
    if amount <= 240:
        return 0
    elif amount > 240 and amount <= 480:
        return amount*.15
    else:
        return amount*.28

print "Enter amount: "
amount = int(raw_input())
print "The tax is " + str(tax(amount))


def netpay(grosspay):
    return grosspay - tax(grosspay)

print "Enter gross pay: "
gp = int(raw_input())
print "Net pay is " + str(netpay(gp))