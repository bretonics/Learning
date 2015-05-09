#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: writeFile.rb
#
#####################

outfile = File.new("myFile.txt", "w")
outfile.print("Hello world!\n")
outfile.puts("Goodbye, world!")
outfile.print(100, "\n")
outfile.print(2*2)
outfile.close
