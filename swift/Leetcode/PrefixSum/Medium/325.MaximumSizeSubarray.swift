// Given an integer array nums and an integer k, 
// return the maximum length of a subarray that sums to k. 
// If there is not one, return 0 instead.

// Time: O(n), Space: O(n)
func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
    var prefixSum = [0: -1]
    var result = 0
    var sum = 0

    for i in 0..<nums.count {
        sum += nums[i]

        if let index = prefixSum[sum - k] { result = max(result, i - index) }
        if prefixSum[sum] == nil { prefixSum[sum] = i }
    }
    
    return result
}

print(maxSubArrayLen([1,-1,5,-2,3], 3))
print(maxSubArrayLen([-2,-1,2,1], 1))