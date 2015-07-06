#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: debug2.rb
#
#####################

nums = [5,2,8,3,1,6]
min = 5

for i in nums
    if i > min
        min = i
    end
end
print("The minimum value is ", min)