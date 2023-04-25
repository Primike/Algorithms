# Given an array nums with n objects colored red, white, or blue, 
# sort them in-place so that objects of the same color are adjacent, 
# with the colors in the order red, white, and blue.
# We will use the integers 0, 1, and 2 to represent the color red,
# white, and blue, respectively.

def sortColors(nums):
    left, right = 0, len(nums) - 1
    index = 0

    while index <= right:
        if nums[index] == 0:
            nums[left], nums[index] = nums[index], nums[left]
            left += 1
            index += 1
        elif nums[index] == 1:
            index += 1
        else:
            nums[right], nums[index] = nums[index], nums[right]
            right -= 1

    return nums

print(sortColors([2,0,2,1,1,0]))
print(sortColors([2,0,1]))