# Given a 1-indexed array of integers 
# numbers that is already sorted in non-decreasing order, 
# find two numbers such that they add up to a specific target number.

def twoSum(array, x):
    i = 0
    j = len(array) - 1

    while i != j:
        if array[i] + array[j] == x:
            return [i + 1, j + 1]
        elif array[i] + array[j] > x:
            j -= 1
        else:
            i += 1

print(twoSum([2,7,11,15], 9))
print(twoSum([1,2,4,5,6,7,10,11,12], 9))
print(twoSum([-1, 0], -1))