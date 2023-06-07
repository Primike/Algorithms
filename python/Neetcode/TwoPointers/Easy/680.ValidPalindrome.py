# Given a string s, return true if the s can be palindrome after 
# deleting at most one character from it.

def validPalindrome(s):
    left, right = 0, len(s) - 1

    while left < right:
        if s[left] != s[right]:
            l_remove, r_remove = s[left + 1:right + 1], s[left:right]
            return l_remove == l_remove[::-1] or r_remove == r_remove[::-1]
        
        left, right = left + 1, right - 1

    return True

print(validPalindrome("aba"))
print(validPalindrome("abca"))
print(validPalindrome("abc"))