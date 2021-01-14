import random

#A function do shuffle all the characters of a string
def shuffle(string):
  tempList = list(string)
  random.shuffle(tempList)
  return ''.join(tempList)

#Main program starts here
uppercaseLetter1 = chr(random.randint(65,90)) #Generate a random Uppercase letter (based on ASCII code)
uppercaseLetter2 = chr(random.randint(65,90))
lowercaseLetter1 = chr(random.randint(97,122))
lowercaseLetter2 = chr(random.randint(97,122))
digit1 = random.randint(0,9)
digit2 = random.randint(0,9)
punctuationSign1 = chr(random.randint(33,47))
punctuationSign2 = chr(random.randint(33,47))

#Generate a password using the characters and shuffle
password = uppercaseLetter1 + uppercaseLetter2 + lowercaseLetter1 + lowercaseLetter2 + str(digit1) + str(digit2) + punctuationSign1 + punctuationSign2
password = shuffle(password)

#Output
print(password)
