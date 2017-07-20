import datetime

content = []
for i in range(1,4):
    filename = "file" + str(i) + ".txt"
    with open(filename, 'r') as file:
        for line in file:
            content.append(line)
    file.close

outfile = datetime.datetime.now()
with open(outfile.strftime("%Y-%m-%d-%H-%M-%S-%f") + '.txt', 'w') as file:
    for i in content:
        file.write(i + '\n')
    file.close

# -----
import glob2
import datetime

filenames =  mglob2.glob("*.txt")

with open(datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S-%f")+".txt", 'w') as file:
    for filename in filenames:
        with open(filename,"r") as f:
            file.write(f.read()+"\n")
