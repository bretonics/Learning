class Employee
   def initialize(name, payrate) 
      @name = name
      @payrate = payrate
   end

   def name
      return @name
   end

   def pay(hours)
      return @payrate * hours
   end
end

class Manager < Employee
   def initialize(name, payrate, salaried)
      super(name, payrate)
      @salaried = salaried
   end

   def pay(hours)
      if @salaried
         return @payrate
      else
         return @payrate * hours
      end
   end
end

e1 = Employee.new("Brown", 20)
print(e1.name, " pay: ", e1.pay(40),"\n")
m1 = Manager.new("Smith", 1200, true)
print(m1.name, " pay: ", m1.pay(0), "\n")
m2 = Manager.new("Jones", 40, false)
print(m2.name, " pay: ", m2.pay(40))