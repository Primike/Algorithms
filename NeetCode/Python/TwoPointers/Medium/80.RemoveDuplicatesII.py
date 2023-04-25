# Given an integer array nums sorted in non-decreasing order, 
# remove some duplicates in-place such that each unique element appears at most twice.
# The relative order of the elements should be kept the same.

def removeDuplicates(nums):
    left, right = 0, 0

    while right < len(nums):
        count = 1

        while right + 1 < len(nums) and nums[right] == nums[right + 1]:
            right += 1 
            count += 1

        for i in range(min(2, count)):
            nums[left] = nums[right]
            left += 1
        
        right += 1

    return left

print(removeDuplicates([1,1,1,2,2,3]))
print(removeDuplicates([0,0,1,1,1,1,2,3,3]))