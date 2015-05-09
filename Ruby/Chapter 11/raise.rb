def ctof(temp)
   raise ArgumentError, "argument is not numeric" unless temp.is_a? Numeric
   return (9.0/5.0) * temp + 32.0
end

begin
   print("Enter a temperature to convert: ")
   t = Integer(gets)
   print(ctof(t))
rescue
   print("Argument was not a number")
end