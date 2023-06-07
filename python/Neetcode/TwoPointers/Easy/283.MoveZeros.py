# Given an integer array nums, 
# move all 0's to the end of it while maintaining the 
# relative order of the non-zero elements.

def moveZeroes(nums):
    left = 0

    for i in range(len(nums)):
        if nums[i]:
            nums[left], nums[i] = nums[i], nums[left]
            left += 1

    return nums

print(moveZeroes([0,1,0,3,12]))
print(moveZeroes([0]))