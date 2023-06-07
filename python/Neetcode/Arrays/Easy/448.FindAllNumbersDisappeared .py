# Given an array nums of n integers where nums[i] is in the range [1, n], 
# return an array of all the integers in the range [1, n] 
# that do not appear in nums.

def findDisappearedNumbers(nums):

    for number in nums:
        index = abs(number) -1
        nums[index] = -1 * abs(nums[index])

    result = []

    for i, number in enumerate(nums):
        if number > 0:
            result.append(i + 1)

    return result

print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))
print(findDisappearedNumbers([1,1]))