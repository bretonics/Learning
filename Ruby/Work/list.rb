#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: list.rb
#
#####################

begin
puts("Name of file? ")
name = gets
myFile =  File.open(name.chomp)
lines = myFile.read
puts lines
rescue
    puts("File not found, enter another name")
    retry
end