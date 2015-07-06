#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: name.rb
#
#####################

class Name
    @@count = 0 #class variable, accessible everywhere in class
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
    
    def self.count      #internal class method
    return @@count  #return class variable
    end
end

#objects
aName = Name.new("Andres", "", "Breton")
print Name.count        #call class method "count"
anotherName = Name.new("Catalina", "Maria", "Breton")
puts
print Name.count
