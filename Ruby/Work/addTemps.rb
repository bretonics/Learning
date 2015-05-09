#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: addTemps.rb
#
#####################

tempfile = File.open("temps.txt", "a+")     #append to file with "a+"
day = 1
while day < 8
    print("Enter temperature: ")
    temp = gets
    tempfile.puts(temp)
    day += 1
end
tempfile.close