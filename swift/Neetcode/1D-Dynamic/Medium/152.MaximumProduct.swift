// Given an integer array nums, find a subarray
// that has the largest product, and return the product.

// For both at every number streak will continue or end
// currentMax: continuation, use left negative, start new
// [...] + [n], -[...] + [-n], [N]
// currentMin: continuation, use left negative, start new
// [...] + [-n], -[...] + [-n], [-N]

// Time: O(n), Space: O(1)
func maxProduct(_ nums: [Int]) -> Int {
    let nums = nums.map { Double($0) }
    var result = nums[0]
    var currentMin = 1.0, currentMax = 1.0

    for n in nums {
        let currentLargestSubarray = max(n, n * currentMax, n * currentMin)
        let currentSmallestSubarray = min(n, n * currentMax, n * currentMin)

        currentMax = currentLargestSubarray
        currentMin = currentSmallestSubarray

        result = max(result, currentMax)
    }

    return Int(result)
}

print(maxProduct([2,3,-2,4]))
print(maxProduct([-2,0,-1]))