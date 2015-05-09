#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: divByZero.rb
#
#####################

begin
    puts("Enter numerator: ")
    num = Integer(gets)
    puts("Enter denominator: ")
    denom = Integer(gets)
    ratio = num/denom
    puts(ratio)
rescue
    print $!
    puts
    puts("Enter a denominator other than 0: ")
    denom = Integer(gets)
    ratio = num/denom
    puts(ratio)
end