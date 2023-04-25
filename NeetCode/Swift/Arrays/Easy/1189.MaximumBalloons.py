# Given a string text, you want to use the characters of text 
# to form as many instances of the word "balloon" as possible.
# You can use each character in text at most once. 

from collections import Counter

def maxNumberOfBalloons(text):
    text_dict = Counter(text)
    balloon = Counter('balloon')

    solution = float('inf')

    for letter in balloon:
        solution = min(solution, text_dict[letter]//balloon[letter])

    return solution

print(maxNumberOfBalloons("nlaebolko"))
print(maxNumberOfBalloons("loonbalxballpoon"))
print(maxNumberOfBalloons("leetcode"))