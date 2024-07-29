// Given an integer array nums, find the subarray
// with the largest sum, and return its sum.

// Time: O(n), Space: O(1)
func maxSubArray(_ nums: [Int]) -> Int {
    var result = Int.min
    var current = 0

    for number in nums {
        current = max(current + number, number)
        result = max(result, current)
    }

    return result
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
print(maxSubArray([1]))
print(maxSubArray([5,4,-1,7,8]))