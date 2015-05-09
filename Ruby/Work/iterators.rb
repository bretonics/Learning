5.times do
	print "Hello World!\n"
end

1.upto(10) do |x|
	print x, " "
end
puts

0.step(100,2) {|x| print x, " "}

puts
sum = 0
1.step(10,2) {|x| sum +=x}
print("Sum is " + sum.to_s + "\n")
