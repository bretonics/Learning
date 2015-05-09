class Name
   def initialize(first, middle, last)
      @first = first
      @middle = middle
      @last = last
   end
   
   attr_reader :first, :middle, :last
   attr_writer :first, :middle, :last

   def to_s
      print(@last + ", " + @first + " " + @middle)
   end
end

aName = Name.new("Jane","Elizabeth","Brown")
aName.first = "Joan"
aName.middle = "Barbara"
aName.last = "Smith"
print aName.first + " "
print aName.middle + " "
print aName.last
