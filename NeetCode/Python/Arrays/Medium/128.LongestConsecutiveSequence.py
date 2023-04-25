# Given an unsorted array of integers nums, 
# return the length of the longest consecutive elements sequence.
# You must write an algorithm that runs in O(n) time.

def longestConsecutive(nums):
    nums_set = set(nums)
    result = 0

    for number in nums:
        if (number - 1) not in nums_set:
            count = 0
            
            while (number + count) in nums_set :
                count += 1

            result = max(result, count)

    return result

print(longestConsecutive([100,4,200,1,3,2]))
print(longestConsecutive([0,3,7,2,5,8,4,6,0,1]))