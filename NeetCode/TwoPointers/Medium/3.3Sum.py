# Given an integer array nums, 
# return all the triplets [nums[i], nums[j], nums[k]] 
# such that i != j, i != k, and j != k, 
# and nums[i] + nums[j] + nums[k] == 0.

from operator import indexOf


def threeSum(nums):
    if len(nums) < 3:
        return []

    nums.sort()
    array = []
    i = 0
    j = 1
    k = len(nums) - 1

    while j <= k:
        if nums[i] + nums[j] + nums[k] == 0 and [nums[i], nums[j], nums[k]] in array == False:
            array.append([nums[i], nums[j], nums[k]])
            i += 1
            j += 1
            k -= 1
        elif nums[i] + nums[j] + nums[k] >= 0:
            k -= 1
        else:
            i += 1
            j += 1

    return array


print(threeSum([-1,0,1,2,-1,-4]))