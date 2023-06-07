#Given an integer array nums and an integer val,
#remove all occurrences of val in nums in-place. 
#The relative order of the elements may be changed.


def removeElement(nums, val):
    index = len(nums) - 1 
    count = 0

    for i in range(len(nums) - 1, -1, -1):
        if nums[i] == val:
            nums[i] = nums[index]
            index -= 1
            count += 1

    return len(nums) - count

print(removeElement([3,2,2,3], 3))
print(removeElement([0,1,2,2,3,0,4,2], 2))