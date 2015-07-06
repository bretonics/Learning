#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: readFile.rb
#
#####################

File.open("file.txt") do |file|
    while line = file.gets
        puts line
    end
end