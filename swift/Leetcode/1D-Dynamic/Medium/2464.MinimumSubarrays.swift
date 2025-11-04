class Solution {
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            (a, b) = (b, a % b)
        }
        return a
    }

    func validSubarraySplit(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: Int.max, count: n + 1)
        dp[0] = 0

        for i in 1...n {
            for j in 1...i {
                if gcd(nums[i - 1], nums[j - 1]) > 1 {
                    if dp[j - 1] != Int.max {
                        dp[i] = min(dp[i], dp[j - 1] + 1)
                    }
                }
            }
        }

        return dp[n] == Int.max ? -1 : dp[n]
    }
}