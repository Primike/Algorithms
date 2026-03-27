class Solution {
    func numberOfStableArrays(_ zero: Int, _ one: Int, _ limit: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: Array(repeating: [0, 0], count: one + 1), count: zero + 1)
        
        for i in 0...min(zero, limit) {
            dp[i][0][0] = 1
        }
        for j in 0...min(one, limit) {
            dp[0][j][1] = 1
        }
        
        if zero > 0 && one > 0 {
            for i in 1...zero {
                for j in 1...one {
                    var val0 = (dp[i - 1][j][0] + dp[i - 1][j][1]) % mod
                    if i > limit {
                        val0 = (val0 - dp[i - limit - 1][j][1] + mod) % mod
                    }
                    dp[i][j][0] = val0
                    
                    var val1 = (dp[i][j - 1][1] + dp[i][j - 1][0]) % mod
                    if j > limit {
                        val1 = (val1 - dp[i][j - limit - 1][0] + mod) % mod
                    }
                    dp[i][j][1] = val1
                }
            }
        }
        
        return (dp[zero][one][0] + dp[zero][one][1]) % mod
    }
}