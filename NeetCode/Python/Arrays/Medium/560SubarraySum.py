# Given an array of integers nums and an integer k, 
# return the total number of subarrays whose sum equals to k.

def subarraySum(nums, k):
    prefix_dict = {0: 1}
    count = 0
    result = 0

    for number in nums:
        count += number
        difference = count - k

        result += prefix_dict.get(difference, 0)
        prefix_dict[count] = prefix_dict.get(count, 0) + 1

    return result

print(subarraySum([1,1,1], 2))
print(subarraySum([1,2,3], 3))