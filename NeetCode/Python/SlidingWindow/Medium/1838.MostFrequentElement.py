# You are given an integer array nums and an integer k. 
# In one operation, you can choose an index of nums and 
# increment the element at that index by 1.
# Return the maximum possible frequency of an element after performing at most k operations.


def maxFrequency(nums, k):
    nums.sort()
    
    left, right = 0, 0
    total = 0
    result = 0

    while right < len(nums):
        total += nums[right]
        
        while nums[right] * (right - left + 1) > total + k:
            total -= nums[left]
            left += 1

        result = max(result, right - left + 1)
        right += 1

    return result

print(maxFrequency([1,2,4], 5))
print(maxFrequency([1,4,8,13], 5))
print(maxFrequency([3,9,6], 2))