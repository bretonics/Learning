#!/usr/bin/python

# Base class
class Account:
    def __init__(self, acctNumber, balance):
        self.acctNumber = acctNumber
        self.balance = balance

    def __str__(self):
        return "Account number: " + str(self.acctNumber) + "\nBalance: " + str(self.balance)

    def deposit(self, amount):
        self.balance += amount

# Drive class
class Checking(Account):
    def __init__(self, acctNumber, balance, fee):
        Account.__init__(self, acctNumber, balance)
        self.fee = fee

    def __str__(self):
        retStr = "Account type: Checking\n"
        retStr += Account.__str__(self)
        retStr += "\nFee: " + str(self.fee)
        return retStr

    def getFee(self):
        return self.fee

    # Define in base class because identical in all accounts
    # def deposit(self, amount):
    #     self.balance += amount

    def withdraw(self, amount):
        if amount > self.balance:
            print "insufficient funds"
        else:
            self.balance = self.balance - amount - self.fee


class Savings(Account):
    def __init__(self, acctNumber, balance):
        Account.__init__(self, acctNumber, balance)

    def __str__(self):
        retStr = "Account type: Savings\n"
        retStr += Account.__str__(self)
        return retStr

    # Define in base class
    # def deposit(self, amount):
    #     self.balance += amount

    def withdraw(self, amount):
        if amount > self.balance:
            print "insufficient funds"
        else:
            self.balance = self.balance - amount


ca = Checking("123", 500, .50)
print(ca)
ca.withdraw(100)
print(ca)
ca.deposit(200)
print(ca)

sa = Savings("456", 1000)
print(sa)
sa.withdraw(250)
print(sa)
sa.deposit(125)
print(sa)

# Store all objects in 1 data structure => create list
accounts = [ca, sa]
print("\nDisplay all accounts: ")
for i in range(0, len(accounts)):
    print accounts[i]
