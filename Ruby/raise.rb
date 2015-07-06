#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: raise.rb
#
#####################

#puts("In program")
#raise "exception raised"    #raises expcetion, terminating program and printing message
#puts("Back in program")

def ctof(temp)
    raise ArgumentError, "argument is not numeric" unless temp.is_a? Numeric    #raises exception when error thrown
    return (9.0/5.0) * temp + 32.0
end

begin
    puts("Enter a temperature to convert: ")
    t = Integer(gets)
    puts(ctof(t))
rescue
    puts("Argument was not a number")
end