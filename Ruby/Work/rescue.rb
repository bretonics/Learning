#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: rescue.rb
#
#####################

begin
    puts(3/0)
    File.open("myfile.txt")
rescue ZeroDivisionError => oops        #ZeroDivisionError is error name thrown by compiler
    puts(oops)      #puts erro in variable 'oops'
    #enter denominator other than zero
    puts("Tried to divide by 0")
    rescue SystemCallError      #System dependen exception- file not present
    puts("File not found")
    #enter file
end