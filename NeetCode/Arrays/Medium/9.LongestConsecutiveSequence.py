# Given an unsorted array of integers nums, 
# return the length of the longest consecutive elements sequence.
# You must write an algorithm that runs in O(n) time.

def longestConsecutive(array):
    numSet = set(array)
    longest = 0

    for i in array:
        if (i - 1) not in numSet:
            length = 0
            while (i + length) in numSet:
                length += 1
            
            longest = max(length, longest)

    return longest

print(longestConsecutive([100,4,200,1,3,2]))