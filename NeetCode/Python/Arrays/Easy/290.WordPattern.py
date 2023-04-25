# Given a pattern and a string s, find if s follows the same pattern.
# Here follow means a full match, such that there is 
# a bijection between a letter in pattern and a non-empty word in s.

def wordPattern(pattern, s):
    s_array = s.split(' ')
    pattern_dict, s_dict = {}, {}

    if len(pattern) != len(s_array):
        return False

    for i, j in zip(pattern, s_array):
        if (i in pattern_dict and pattern_dict[i] != j) or (j in s_dict and s_dict[j] != i):
            return False

        pattern_dict[i] = j
        s_dict[j] = i

    return True

print(wordPattern("abba", "dog cat cat dog"))
print(wordPattern("abba", "dog cat cat fish"))
print(wordPattern("aaaa", "dog cat cat dog"))