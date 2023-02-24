#Given two strings s and t, return true if s is a subsequence of t, 
#or false otherwise.


def isSubsequence(s, t):
    if s == '':
        return True

    count = 0 

    for letter in t:
        if len(s) == count:
            return True
        if s[count] == letter:
            count += 1

    return True if len(s) == count else False

print(isSubsequence("abc", "ahbgdc"))
print(isSubsequence("axc", "ahbgdc"))