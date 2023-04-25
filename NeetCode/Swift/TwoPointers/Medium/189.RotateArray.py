# Given an integer array nums, rotate the array to the right by k steps, 
# where k is non-negative.

def rotate(nums, k):
    k = k % len(nums)

    reverse_array(nums, 0, len(nums) - 1)
    reverse_array(nums, 0, k - 1)
    reverse_array(nums, k, len(nums) - 1)

    return nums

def reverse_array(nums, left, right):
    while left < right:
        nums[left], nums[right] = nums[right], nums[left]
        left, right = left + 1, right - 1

print(rotate([1,2,3,4,5,6,7], 3))
print(rotate([-1,-100,3,99], 2))