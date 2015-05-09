def prompt(message)
   print message
end

def curve(arr, points)
   arr.map! {|grade| grade += points}
end

#prompt("Hello, world")
#print("\n")
#prompt("Enter a value: ")
#value = gets
#print value
grades = [60,70,80,90]
curve(grades, 5)
grades.each {|grade| print grade, " "}
