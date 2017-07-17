def currency_converter(rate, euros):
    dollars = euros * rate
    return dollars

print(currency_converter(100, 1000))


def minutes_to_hours(minutes, seconds):
    hours = minutes / 60 + seconds / 3600
    return hours

print(minutes_to_hours(70, 300))


def celcius_to_farenheit(celcius):
    if celcius < -273.15:
        print('That is lower than the lowest possible temperature!')
    else:
        fh = celcius * (9/5) + 32
        print(fh)

celcius_to_farenheit(32)
celcius_to_farenheit(-273)
celcius_to_farenheit(-274)


money={"saving_account":200, "checking_account":100, "under_bed":[500,10,100]}
print(money["under_bed"][1])


a = 5
if a < 5:
    print("less than 5")
elif a == 5:
    print("equal to 5")
else:
    print("equal or greater than 5")


def age_foo(age):
    new_age = age + 50
    return new_age

age = float(input("Enter your age: "))
if age < 150:
    age_foo(age)
else:
    print("How is that possible?!")



emails = ['me@gmail.com', 'you@hotmail.com', 'they@gmail.com']
for email in emails:
    if 'gmail' in email:
        print(email)


planet = input('What planet are you from? ')
print(planet)

password = ''
while password != 'python123':
    password = input('Enter password: ')
    if password == 'python123':
        print("You are logged in!")
    else:
        print("Sorry, try again!")


names = ['james', 'john', 'jack']
email_domains=['gmail', 'hotmail', 'yahoo']

for i,j in zip(names, email_domains):
    print(i,j)


temperatures=[10,-20,-289,100]
for t in temperatures:
    celcius_to_farenheit(t)
