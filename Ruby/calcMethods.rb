def add(n1, n2)
	return n1 + n2
end

def sub(n1, n2)
	return n1 - n2
end

def mult(n1, n2)
	return n1 * n2
end

def div(n1, n2)
	return n1 / n2
end

def calc(n1, n2, op)
    if op == "+"
        add(n1,n2)
    elsif op == "-"
        sub(n1,n2)
    elsif op == "*"
        mult(n1,n2)
    elsif op == "/"
        div(n1,n2)
    else
        print("Bad operator")
    end
end

print("Enter first number: ")
num1 = Float(gets)
print("Enter second number: ")
num2 = Float(gets)
print("Enter operation (+,-,*,/): ")
op = gets
op = op.chomp

puts calc(num1,num2,op)
