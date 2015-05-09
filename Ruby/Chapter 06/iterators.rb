#5.times do
#   print "Hello, world\n"
#end

#sum = 0
#1.upto(10) do |x|
#  sum += x
#end
#print sum

sum = 0
1.step(10,2) {|x| sum += x}
print sum