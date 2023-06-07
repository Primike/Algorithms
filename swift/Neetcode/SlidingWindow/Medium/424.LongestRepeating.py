# You are given a string s and an integer k. 
# You can choose any character of the string and 
# change it to any other uppercase English character. 
# You can perform this operation at most k times.
# Return the length of the longest substring containing the same 
# letter you can get after performing the above operations.

def characterReplacement(s, k):
    dict = {}
    result = 0
    left = 0
    most_frequent = 0

    for i, number in enumerate(s):
        dict[number] = dict.get(number, 0) + 1
        most_frequent = max(most_frequent, dict[number])

        if (i - left + 1) - most_frequent > k:
            dict[s[left]] -= 1
            left += 1

        result = max(result, i - left + 1)

    return result

print(characterReplacement("ABAB", 2))
print(characterReplacement("AABABBA", 1))