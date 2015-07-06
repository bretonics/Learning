print("Please enter your name: ")
name = gets
puts("Hello "+ name)
print("Enter a number to add: ")
num1 = gets
print("Enter another number: ")
num2 =gets
result = Integer(num1) + Integer(num2)
print("The results of adding " + num1.chomp + " plus " + num2.chomp + " is: ",result)
