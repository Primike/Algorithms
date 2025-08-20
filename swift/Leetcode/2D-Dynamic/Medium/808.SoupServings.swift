class Solution {
    func soupServings(_ n: Int) -> Double {
        guard n > 0 else { return 0.5 }
        
        if n >= 4800 {
            return 1.0
        }

        let m = Int(ceil(Double(n) / 25.0))
        var dp = Array(repeating: Array(repeating: 0.0, count: m + 1), count: m + 1)

        dp[0][0] = 0.5
        for i in 1...m {
            dp[0][i] = 1.0
            dp[i][0] = 0.0
        }

        for i in 1...m {
            for j in 1...m {
                let p1 = dp[max(0, i - 4)][j]
                let p2 = dp[max(0, i - 3)][j - 1]
                let p3 = dp[max(0, i - 2)][max(0, j - 2)]
                let p4 = dp[max(0, i - 1)][max(0, j - 3)]
                dp[i][j] = (p1 + p2 + p3 + p4) / 4.0
            }
        }

        return dp[m][m]
    }
}