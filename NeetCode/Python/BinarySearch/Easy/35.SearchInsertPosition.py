# Given a sorted array of distinct integers and a target value, 
# return the index if the target is found. If not, 
# return the index where it would be if it were inserted in order.

def searchInsert(nums, target):
    left, right = 0, len(nums) - 1

    while left <= right:
        mid = (right + left)//2

        if nums[mid] == target:
            return mid
        elif nums[mid] > target:
            right = mid - 1
        else:
            left = mid + 1

    return left

print(searchInsert([1,3,5,6], 0))
print(searchInsert([1,3,5,6], 2))
print(searchInsert([1,3,5,6], 7))