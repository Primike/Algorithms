# Given an array of integers nums, calculate the pivot index of this array.
# The pivot index is the index where the sum of all the numbers 
# strictly to the left of the index is equal to 
# he sum of all the numbers strictly to the index's right.

def pivotIndex(nums):
    total_sum = sum(nums)
    current_sum = 0

    for i, number in enumerate(nums):
        if (current_sum * 2) + number == total_sum:
            return i

        current_sum += number

    return -1

print(pivotIndex([1,7,3,6,5,6]))
print(pivotIndex([1,2,3]))
print(pivotIndex([2,1,-1]))