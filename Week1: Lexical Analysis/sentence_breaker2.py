# Approach2: Using regular expressions

import re

# Get input 
input_text = input("Enter one or more English sentences: ")

# Use RE to split the input text into words while preserving special characters
words = re.findall(r'\w+|\S', input_text)

# Process each word
for word in words:
    print(word)
