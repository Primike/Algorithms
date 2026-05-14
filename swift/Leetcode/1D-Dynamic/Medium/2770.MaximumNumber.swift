class Solution {
    func maximumJumps(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        var dp = Array(repeating: Int.min, count: n)
        dp[0] = 0

        for i in 1..<n {
            for j in 0..<i {
                if dp[j] != Int.min && abs(nums[j] - nums[i]) <= target {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }

        return dp[n - 1] < 0 ? -1 : dp[n - 1]
    }
}