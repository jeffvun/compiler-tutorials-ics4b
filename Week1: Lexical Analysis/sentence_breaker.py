# Approach 1: Using simple split() function in python

# Get input
input_text = input("Enter one or more English sentences: ")

# Split the input into sentences
sentences = input_text.split('.')

# Process each sentence
for sentence in sentences:
    # Split the sentence into individual words
    words = sentence.strip().split()

    for word in words:
        if word:  
            # Check if the word is not empty (for cases like consecutive spaces)
            print(word)

    # Add an empty line between sentences
    print()
    