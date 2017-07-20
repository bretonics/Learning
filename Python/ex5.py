def c2f(c):
    if c < -273.15:
        return('That is lower than the lowest possible temperature!')
    else:
        f = c * (9/5) + 32
        return(f)


temperatures=[10,-20,-289,100]

with open('temps.txt','w') as file:
    for temp in temperatures:
        celcius = c2f(temp)
        if type(celcius) == float:
            line = str(celcius) + '\n'
            file.write(line)
file.close()
