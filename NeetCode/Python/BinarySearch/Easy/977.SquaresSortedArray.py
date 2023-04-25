# Given an integer array nums sorted in non-decreasing order, 
# return an array of the squares of each number sorted in non-decreasing order.

def sortedSquares(nums):
    left, right = 0, len(nums) - 1
    result = []

    while left <= right:
        if nums[left]**2 >= nums[right]**2:
            result.append(nums[left]**2)
            left += 1
        else:
            result.append(nums[right]**2)
            right -= 1

    return result[::-1]

print(sortedSquares([-4,-1,0,3,10]))
print(sortedSquares([-7,-3,2,3,11]))