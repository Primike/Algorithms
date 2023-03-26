# Given an integer array nums, 
# return all the triplets [nums[i], nums[j], nums[k]] 
# such that i != j, i != k, and j != k, 
# and nums[i] + nums[j] + nums[k] == 0.

def threeSum(nums):
    nums.sort()
    result = []

    for i, number in enumerate(nums):
        if i != 0 and number == nums[i - 1]:
            continue

        left, right = i + 1, len(nums) - 1

        while left < right:
            total_sum = number + nums[left] + nums[right]

            if total_sum > 0:
                right -= 1
            elif total_sum < 0:
                left += 1
            else:
                result.append([number, nums[left], nums[right]])
                left += 1
                
                while nums[left] == nums[left - 1] and left < right:
                    left += 1

    return result

print(threeSum([-1,0,1,2,-1,-4]))
print(threeSum([0,1,1]))
print(threeSum([0,0,0]))