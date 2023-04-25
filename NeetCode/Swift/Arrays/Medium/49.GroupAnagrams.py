# Given an array of strings strs, group the anagrams together. 
# You can return the answer in any order.

from collections import defaultdict

def groupAnagrams(strs):
    result = defaultdict(list)

    for string in strs:
        count = [0] * 26

        for letter in string:
            count[ord(letter) - ord("a")] += 1

        result[tuple(count)].append(string)

    return result.values()
    

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))