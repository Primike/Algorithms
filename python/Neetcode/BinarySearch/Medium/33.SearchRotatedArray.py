# Given the array nums after the possible rotation and an integer target, 
# return the index of target if it is in nums, or -1 if it is not in nums.

def search(nums, target):
    left, right = 0, len(nums) - 1

    while left <= right:
        mid = (right + left)//2

        if nums[mid] == target:
            return mid

        if nums[mid] >= nums[left]:
            if nums[mid] < target or target < nums[left]:
                left = mid + 1
            else:
                right = mid - 1
        else:
            if target < nums[mid] or target > nums[right]:
                right = mid - 1
            else:
                left = mid + 1

    return -1

print(search([4,5,6,7,0,1,2], 0))
print(search([4,5,6,7,0,1,2], 3))
print(search([1], 0))