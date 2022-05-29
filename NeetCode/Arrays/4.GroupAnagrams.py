# Given an array of strings strs, group the anagrams together. 
# You can return the answer in any order.

from collections import defaultdict

def groupAnagrams(array):
    result = defaultdict(list)

    for i in array:
        count = [0] * 26

        for j in i:
            count[ord(j) - ord("a")] += 1

        result[tuple(count)].append(i)

    return result.values()
    

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))