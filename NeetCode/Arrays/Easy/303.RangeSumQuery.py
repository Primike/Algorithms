# Given an integer array nums, handle multiple queries of the following type:
# Calculate the sum of the elements of nums between indices left and 
# right inclusive where left <= right.

class NumArray(object):
    def __init__(self, nums):
        self.nums = nums
        """
        :type nums: List[int]
        """
        

    def sumRange(self, left, right):
        sum = 0

        for i in range(left, right + 1):
            sum += self.nums[i]

        return sum

num_array = NumArray([-2, 0, 3, -5, 2, -1])
array = [[0, 2], [2, 5], [0, 5]]

for i in array:
    print(num_array.sumRange(i[0], i[1]))