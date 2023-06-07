#Given a string s consisting of words and spaces, 
#return the length of the last word in the string.


def lengthOfLastWord(s):

    i, word_length = len(s) - 1, 0

    while s[i] == ' ':
        i -= 1
    while s[i] != ' ' and i >= 0:
        word_length += 1
        i -= 1

    return word_length

print(lengthOfLastWord("Hello World"))
print(lengthOfLastWord("   fly me   to   the moon  "))
print(lengthOfLastWord("luffy is still joyboy"))