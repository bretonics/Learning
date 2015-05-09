#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: tempAvg.rb
#
#####################

count = 0
total = 0
while temp = gets
    total += Integer(temp)      #convert temp to numbers b/c coming from text file
    count += 1
end
puts total/count