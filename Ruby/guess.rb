answer = "Watson\n"

puts("Let's play a guessing game. You get three tries.")
print("What is the name of the computer that played on Jeopardy?")
response = gets
if response == answer
	puts("That is correct!")
else
	print("Sorry. Guess again: ")
	response = gets
	if response == answer
		puts("That is correct!")
	else
		print("sorry. Guess again: ")
		response = gets
		if response == answer
			puts("Tha is correct!")
		else
			puts("Sorry. The answer is " + answer)
		end
	end
end
