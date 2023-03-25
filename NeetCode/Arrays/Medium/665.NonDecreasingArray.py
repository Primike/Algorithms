# Given an array nums with n integers, your task is to check 
# if it could become non-decreasing by modifying at most one element.

def checkPossibility(nums):
    count = 0

    for i in range(len(nums) - 1):
        if nums[i] <= nums[i + 1]:
            continue

        if i == 0 or nums[i + 1] >= nums[i - 1]:
            nums[i] = nums[i + 1]
        else:
            nums[i + 1] = nums[i]
        
        count += 1

    return True if count < 2 else False

print(checkPossibility([4,2,3]))
print(checkPossibility([4,2,1]))