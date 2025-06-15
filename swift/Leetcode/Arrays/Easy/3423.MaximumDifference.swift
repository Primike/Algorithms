// Given a circular array nums, find the maximum 
// absolute difference between adjacent elements.

// Time: O(n), Space: O(1)
func maxAdjacentDistance(_ nums: [Int]) -> Int {
    var result = 0

    for i in 1..<nums.count {
        result = max(result, abs(nums[i] - nums[i - 1]))
    }

    result = max(result, abs(nums[0] - nums[nums.count - 1]))
    return result
}

print(maxAdjacentDistance([1,2,4]))
print(maxAdjacentDistance([-5,-10,-5]))