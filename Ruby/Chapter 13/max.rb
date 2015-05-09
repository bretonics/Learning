nums = [1,3,4,6,2,5]
max = 0
pos = 1
while pos < nums.length
   if nums[pos] > nums[max]
      max = pos
   end
   pos += 1
end
print(nums[max])