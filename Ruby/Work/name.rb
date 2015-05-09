#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: name.rb
#
#####################

class Name
    def initialize(first, middle, last)
        @first = first
        @middle = middle
        @last = last
        @@count += 1
    end
    
    attr_reader :first, :middle, :last
    attr_writer :first, :middle, :last
    
    def to_s
        print (@first + " " + @middle + " " + @last)
    end
end

#objects
aName = Name.new("Andres", "", "Breton")
aName.first = "Joan"    #replaces attribute
aName.middle = "Barbara"
aName.last = "Smith"
print aName.to_s, "\n"

#print from readable attributes
print aName.first
print aName.middle
print aName.last

