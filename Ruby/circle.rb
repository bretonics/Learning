#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: circle.rb
#
#####################

require "./constants"

class Circle
    include Constants       #mixins, includes module "Constants" from ./constants file

    def initialize(radius)
        @radius = radius
    end

    def getArea
        return @radius * @radius * Constants::PI
    end
end

circle =  Circle.new(5)
puts(circle.getArea)