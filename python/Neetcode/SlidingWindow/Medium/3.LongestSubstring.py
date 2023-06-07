# Given a string s, find the length of the longest substring
# without repeating characters.

def lengthOfLongestSubstring(s):
    window = set()
    left = 0
    result = 0

    for i in range(len(s)):
        while s[i] in window:
            window.remove(s[left])
            left += 1

        window.add(s[i])
        result = max(result, i - left + 1)

    return result

print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))