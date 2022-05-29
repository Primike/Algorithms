# Given two strings s and t, 
# return true if t is an anagram of s, and false otherwise.

def isAnagram(string1, string2):
    if len(string1) != len(string2):
        return False
    
    x = {}

    for i in string1:
        if x.get(i) == None:
            x[i] = 1
        else:
            x[i] += 1

    for i in string2:
        if x.get(i) == None:
            return False
        elif x.get(i) == 0:
            return False
        else:
            x[i] -= 1

    return True

print(isAnagram("anagram", "nagaram"))
print(isAnagram("rat", "car"))
print(isAnagram("aacc", "ccac"))