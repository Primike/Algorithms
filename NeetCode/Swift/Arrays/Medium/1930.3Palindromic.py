# Given a string s, return the number of unique palindromes 
# of length three that are a subsequence of s.

import collections

def countPalindromicSubsequence(s):
    result = set()
    left = set()
    right = collections.Counter(s)

    for letter in s:
        right[letter] -= 1
        if right[letter] == 0:
            right.pop(letter)

        for i in range(26):
            alpha = chr(ord('a') + i)
            if alpha in left and alpha in right:
                result.add((letter, alpha))

        left.add(letter)

    return len(result)

print(countPalindromicSubsequence("aabca"))
print(countPalindromicSubsequence("abc"))
print(countPalindromicSubsequence("bbcbaba"))