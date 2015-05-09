#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: student.rb
#
#####################

class Student
    def initialize(name,id)
        @name = name
        @id = id
        @grades = []
    end
    
    def to_s
        puts("Name: " + @name)
        puts("ID: " +@id)
        print(@grades)
    end
    
    def addGrade(grade)
        @grades.push(grade)
    end
        
    def gradeAvg
        total = 0
        for grade in @grades
            total += grade
        end
        return total/@grades.count
    end
end


s1 = Student.new("Mary Smith", "123")
s1.addGrade(90)
s1.addGrade(80)
puts s1.to_s
puts (s1.gradeAvg)