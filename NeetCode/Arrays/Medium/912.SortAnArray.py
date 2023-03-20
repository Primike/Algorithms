# Given an array of integers nums, sort the array in 
# ascending order and return it.

def sortArray(nums):   
    if len(nums) <= 1:
        return nums

    mid = len(nums)//2

    left, right = nums[:mid], nums[mid:]
    left = sortArray(left)
    right = sortArray(right)

    return merge(left, right)

def merge(left, right):
    result = []
    i = 0
    j = 0

    while i < len(left) and j < len(right):
        if left[i] < right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1

    while i < len(left):
        result.append(left[i])
        i += 1

    while j < len(right):
        result.append(right[j])
        j += 1

    return result

print(sortArray([5,2,3,1]))
print(sortArray([5,1,1,2,0,0]))