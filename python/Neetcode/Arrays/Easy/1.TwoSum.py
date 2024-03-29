# Given an array of integers nums and an integer target, 
# return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, 
# and you may not use the same element twice.

# You can return the answer in any order.

def twoSum(nums, target):
    dict = {}

    for i, number in enumerate(nums):
        if number in dict:
            return [dict[number], i]
        
        dict[target - number] = i

    return
    
print(twoSum([1, 2, 7, 11, 15], 9))
print(twoSum([3, 3], 6))
