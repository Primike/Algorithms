# Given an integer array nums and an integer k, 
# return true if nums has a good subarray or false otherwise.
# A good subarray is a subarray where:
# its length is at least two, and
# the sum of the elements of the subarray is a multiple of k.

def checkSubarraySum(nums, k):
    dict = { 0: -1 }
    count = 0

    for i, number in enumerate(nums):
        count += number
        remainder = count % k

        if remainder not in dict:
            dict[remainder] = i
        elif i - dict[remainder] >= 2:
            return True

    return False

print(checkSubarraySum([23,2,4,6,7], 6))
print(checkSubarraySum([23,2,6,4,7], 6))
print(checkSubarraySum([23,2,6,4,7], 13))