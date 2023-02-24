# Given two strings s and t, 
# return true if t is an anagram of s, and false otherwise.

def isAnagram(s, t):
    if len(s) != len(t):
        return False
    
    dict = {}

    for letter in s:
        dict[letter] = dict.get(letter, 0) + 1

    for letter in t:
        if dict.get(letter, 0) == 0:
            return False
        else:
            dict[letter] -= 1

    return True

print(isAnagram("anagram", "nagaram"))
print(isAnagram("rat", "car"))
print(isAnagram("aacc", "ccac"))