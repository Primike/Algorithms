# Given an array of positive integers nums and a positive integer target, 
# return the minimal length of a subarray whose sum is greater than or equal to target. 
# If there is no such subarray, return 0 instead.

def minSubArrayLen(target, nums):
    left = 0
    current_sum = 0
    result = float('inf')

    for i in range(len(nums)):
        current_sum += nums[i]

        while current_sum >= target:
            result = min(result, i - left + 1)
            current_sum -= nums[left]
            left += 1

    return 0 if result == float('inf') else result

print(minSubArrayLen(7, [2,3,1,2,4,3]))
print(minSubArrayLen(4, [1,4,4]))
print(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))