# Given an integer array nums of length n, 
# you want to create an array ans of length 2n where ans[i] == nums[i] and 
# ans[i + n] == nums[i] for 0 <= i < n (0-indexed).

def getConcatenation(nums):
    array =  []
    
    for i in range(2):
        for number in nums:
            array.append(number)

    return array

print(getConcatenation([1,2,1]))
print(getConcatenation([1,3,2,1]))