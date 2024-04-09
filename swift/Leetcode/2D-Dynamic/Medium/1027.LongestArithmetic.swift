// Given an array nums of integers, return the length of the 
// longest arithmetic subsequence in nums.

// Time: O(n^2), Space: O(n^2)
func longestArithSeqLength(_ nums: [Int]) -> Int {
    var dp = Array(repeating: [Int: Int](), count: nums.count)
    var result = 0

    for i in 1..<nums.count {
        for j in 0..<i {
            let difference = nums[i] - nums[j]
            dp[i][difference] = dp[j][difference, default: 1] + 1
            result = max(result, dp[i][difference]!)
        }
    }

    return result
}

print(longestArithSeqLength([3,6,9,12]))
print(longestArithSeqLength([9,4,7,2,10]))
print(longestArithSeqLength([20,1,15,3,10,5,8]))