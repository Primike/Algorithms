class Solution {
    func maxA(_ n: Int) -> Int {
        var dp = Array(0...n)
        
        if n < 3 { return n }
        
        for i in 0..<(n - 2) {
            let limit = min(n, i + 6)
            for j in (i + 3)...limit {
                dp[j] = max(dp[j], (j - i - 1) * dp[i])
            }
        }
        
        return dp[n]
    }
}