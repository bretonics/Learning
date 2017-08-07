import sys, json
from difflib import get_close_matches

data = json.load(open("data.json"))

def translate(word):
    word = word.lower()
    if word in data:
        return data[word]
    elif len(get_close_matches(word, data.keys())) > 0:
        matches = get_close_matches(word, data.keys())
        for match in matches:
            response = input("Did you mean %s instead? " % match)
            if response in "yes y Y":
                return data[match]
        sys.exit("The word doesn't exist. Please double check it.")
    else:
        sys.exit("The word doesn't exist. Please double check it.")

word = input("Enter word: ")
output = translate(word)
for result in output:
    print(result)
