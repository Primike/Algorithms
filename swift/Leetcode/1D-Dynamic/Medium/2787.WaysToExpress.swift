class Solution {
    func numberOfWays(_ n: Int, _ x: Int) -> Int {
        let MOD = 1_000_000_007
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1

        var i = 1
        while true {
            let val = Int(pow(Double(i), Double(x)))
            
            if val > n {
                break
            }
            
            for j in stride(from: n, through: val, by: -1) {
                dp[j] = (dp[j] + dp[j - val]) % MOD
            }
            
            i += 1
        }

        return dp[n]
    }
}