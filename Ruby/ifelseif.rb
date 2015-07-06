# if comparison
#	statements
# elsif comparison
#	statements
#elsif comparison
#	statements
#else
# 	statementss
#end

puts("Enter a grade: ")
grade = Integer(gets)

if grade >=90
	letterGrade = 'A'
elsif grade >=80
	letterGrade = 'B'
elsif grade >=70
	letterGrade = 'C'
elsif grade >=60
	letterGrade = 'D'
else
	letterGrade = 'F'
end
puts("The letter grade  is " + letterGrade)
