nums = [1,2,3,4,5,6,7,8,9,10]
nums.each do |x|
	print x, "\n"
end

for number in nums
	print number, "\n"
end
puts

sum = 0
for num in nums
	sum += num
end
print sum, "\n"
