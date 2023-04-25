# Given two strings s and p, return an array of all the start indices of 
# p's anagrams in s. You may return the answer in any order.

def findAnagrams(s, p):
    if len(p) > len(s): return []
    
    s_dict, p_dict = {}, {}

    for i in range(len(p)):
        p_dict[p[i]] = p_dict.get(p[i], 0) + 1      
        s_dict[s[i]] = s_dict.get(s[i], 0) + 1

    result = [0] if s_dict == p_dict else []
    left = 0

    for right in range(len(p), len(s)):
        s_dict[s[right]] = s_dict.get(s[right], 0) + 1
        s_dict[s[left]] -= 1

        if s_dict[s[left]] == 0:
            s_dict.pop(s[left])

        left += 1
        if s_dict == p_dict:
            result.append(left)

    return result

print(findAnagrams("cbaebabacd", "abc"))
print(findAnagrams("abab", "ab"))