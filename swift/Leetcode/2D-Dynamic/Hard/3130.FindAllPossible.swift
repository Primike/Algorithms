class Solution {
    func numberOfStableArrays(_ zero: Int, _ one: Int, _ limit: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: Array(repeating: [0, 0], count: one + 1), count: zero + 1)
        
        for i in 0...zero {
            for j in 0...one {
                for lastBit in 0...1 {
                    if i == 0 {
                        if lastBit == 0 || j > limit || j == 0 {
                            dp[i][j][lastBit] = 0
                        } else {
                            dp[i][j][lastBit] = 1
                        }
                    } else if j == 0 {
                        if lastBit == 1 || i > limit || i == 0 {
                            dp[i][j][lastBit] = 0
                        } else {
                            dp[i][j][lastBit] = 1
                        }
                    } else if lastBit == 0 {
                        var val = (dp[i - 1][j][0] + dp[i - 1][j][1]) % mod
                        if i > limit {
                            val = (val - dp[i - limit - 1][j][1] + mod) % mod
                        }
                        dp[i][j][lastBit] = val
                    } else {
                        var val = (dp[i][j - 1][0] + dp[i][j - 1][1]) % mod
                        if j > limit {
                            val = (val - dp[i][j - limit - 1][0] + mod) % mod
                        }
                        dp[i][j][lastBit] = val
                    }
                }
            }
        }
        
        return (dp[zero][one][0] + dp[zero][one][1]) % mod
    }
}