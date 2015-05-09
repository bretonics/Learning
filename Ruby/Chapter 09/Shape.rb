class Shape
   def initialize(x,y)
      @x = x
      @y = y
   end

   attr_reader :x, :y
   attr_writer :x, :y

   def to_s
      print("x: ", x, "y: ", y)
      puts
   end

   def move(x,y)
      @x += x
      @y += y
   end
end

s1 = Shape.new(12,10)
print s1.to_s
s1.move(3,5)
print s1.to_s
