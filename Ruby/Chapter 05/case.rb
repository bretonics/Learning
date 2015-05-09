#case expression
#  when expression1
#     statement
#  when expression2
#     statement
#  when expression3
#     statement
#  else
#     statement
#end
puts("Enter a grade: ")
grade = gets
grade = Integer(grade)
case grade
   when 90..100
      letterGrade = "A"
   when 80..89
      letterGrade = "B"
   when 70..79
      letterGrade = "C"
   when 60..69
      letterGrade = "D"
   else 
      letterGrade = "F"
end
puts("The letter grade is " + letterGrade)