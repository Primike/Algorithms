// Given an array nums of even length n, pair up the elements of 
// nums into n / 2 pairs such that:
// Each element of nums is in exactly one pair, and
// The maximum pair sum is minimized.
// Return the minimized maximum pair sum after optimally pairing up the elements.

// Time: O(n * log(n)), Space: O(1)
func minPairSum(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    var left = 0, right = nums.count - 1
    var result = 0

    while left < right {
        result = max(result, nums[left] + nums[right])
        left += 1
        right -= 1
    }

    return result
}

print(minPairSum([3,5,2,3]))
print(minPairSum([3,5,4,2,4,6]))