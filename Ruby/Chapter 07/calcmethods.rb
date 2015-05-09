def add(n1, n2) 
   return n1 + n2
end

def subtract(n1, n2)
   return n1 - n2
end

def mult(n1, n2)
   return n1 * n2
end

def div(n1, n2) 
   return n1 / n2
end

print("Enter first number: ")
num1 = Float(gets)
print("Enter second number: ")
num2 = Float(gets)
print("Enter operator: ")
op = gets
op = op.chomp
if op == "+"
   puts(add(num1, num2))
elsif op == "-"
   puts(subtract(num1, num2))
elsif op == "*"
   puts(mult(num1, num2))
elsif op == "/"
   puts(div(num1, num2))
else
   puts("Bad operator")
end