# Given the sorted rotated array nums of unique elements, 
# return the minimum element of this array.

def findMin(nums):
    left, right = 0, len(nums) - 1
    result = float('inf')

    while left < right:
        mid = (right + left)//2
        result = min(result, nums[mid])

        if nums[mid] > nums[-1]:
            left = mid + 1
        else:
            right = mid - 1
        
    return min(result, nums[left])

print(findMin([3,4,5,1,2]))
print(findMin([4,5,6,7,0,1,2]))
print(findMin([11,13,15,17]))