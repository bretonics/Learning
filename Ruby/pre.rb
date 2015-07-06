cont = 'y'
while (cont == 'y')
	print("Enter a numerator: ")
	num = Integer(gets)
	print("Enter a denominator: ")
	denom = Integer(gets)
	if denom == 0
		next
	end
	puts(num/denom)
	print("More? (y/n) ")
	cont = gets
#	puts("Cont before chomp =" + cont)
	cont = cont.chomp
#	puts("Cont after chomp =" + cont)
end
