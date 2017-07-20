file = open('example.txt', 'w')
# file = open('example.txt', 'r')
for i in range(1,5):
    file.write('Line' + str(i) + '\n')
file.close()

file = open('example.txt', 'a')
file.write('Line6')
file.close()
