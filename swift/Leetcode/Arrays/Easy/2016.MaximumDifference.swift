// Given a 0-indexed integer array nums of size n, 
// find the maximum difference between nums[i] and nums[j] 
// (i.e., nums[j] - nums[i]), such that 0 <= i < j < n and nums[i] < nums[j].
// Return the maximum difference. If no such i and j exists, return -1.

// Time: O(n), Space: O(1)
func maximumDifference(_ nums: [Int]) -> Int {
    var result = -1
    var minimum = nums[0]

    for i in 1..<nums.count {
        if nums[i] > minimum { result = max(result, nums[i] - minimum) }
        minimum = min(minimum, nums[i])
    }

    return result
}

print(maximumDifference([7,1,5,4]))
print(maximumDifference([9,4,3,2]))
print(maximumDifference([1,5,2,10]))