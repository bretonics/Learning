def tipCalc(amount)
   return amount * 0.15
end

print("Enter the amount of the bill: ")
bill = Float(gets)
tip = tipCalc(bill)
total = bill + tip
puts("Your total is " + total.to_s)