#if comparison (relational expression)
#   statements
#end

#if comparison
#   statements
#else
#   statements
#end

grade = gets
grade = Integer(grade)
if grade >= 70
   puts("pass")
else
   puts("fail")
end