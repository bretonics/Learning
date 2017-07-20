import datetime


"""
This script creates an empty file.
"""

filename = datetime.datetime.now()

def create_file():
    """This function creates an empty file"""
    with open(filename.strftime("%Y-%m-%d-%H-%M-%S-%f") + ".txt", 'w') as file:
            file.write("") #writting empty string

create_file()
