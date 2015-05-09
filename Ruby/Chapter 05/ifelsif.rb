#if comparison
#   statements
#elsif comparison
#   statements
#elsif comparison
#   statements
#elsif comparison
#   statements
#else
#   statements
#end
puts("Enter a grade: ")
grade = gets
grade = Integer(grade)
if grade >= 90
   letterGrade = "A"
elsif grade >= 80
   letterGrade = "B"
elsif grade >= 70
   letterGrade = "C"
elsif grade >= 60
   letterGrade = "D"
else
   letterGrade = "F"
end
puts("Letter grade assigned is " + letterGrade)