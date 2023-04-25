# Pick the scores of any k students from the array so that the difference 
# between the highest and the lowest of the k scores is minimized.

def minimumDifference(self, nums, k):
    nums.sort()

    left, right = 0, k - 1
    result = float('inf')

    while right < len(nums):
        result = min(result, nums[right] - nums[left])

        left, right = left + 1, right + 1

    return result

print(minimumDifference([90], 1))
print(minimumDifference([9,4,1,7], 2))