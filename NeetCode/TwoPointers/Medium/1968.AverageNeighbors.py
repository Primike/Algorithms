# You are given a 0-indexed array nums of distinct integers. 
# You want to rearrange the elements in the array such that every element 
# in the rearranged array is not equal to the average of its neighbors.

def rearrangeArray(nums):

    for i in range(1, len(nums) - 1):
        current = nums[i]
        before, after = nums[i - 1], nums[i + 1]

        if before < current < after or before > current > after:
            nums[i], nums[i + 1] = nums[i + 1], nums[i]

    return nums

print(rearrangeArray([1,2,3,4,5]))
print(rearrangeArray([6,2,0,9,7]))