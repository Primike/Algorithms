class Solution {
    func maximumLength(_ nums: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: k), count: k)
        var res = 0
        
        for n in nums {
            let num = n % k
            for prev in 0..<k {
                dp[prev][num] = dp[num][prev] + 1
                res = max(res, dp[prev][num])
            }
        }
        
        return res
    }
}