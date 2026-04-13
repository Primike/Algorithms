class Solution {
    func maximumAmount(_ coins: [[Int]]) -> Int {
        let n = coins[0].count
        let minVal = Int.min / 4
        var dp = Array(repeating: [minVal, minVal, minVal], count: n + 1)

        dp[1] = [0, 0, 0]

        for row in coins {
            for j in 0..<n {
                let x = row[j]
                
                dp[j + 1][2] = max(
                    max(dp[j][2], dp[j + 1][2]) + x, 
                    max(dp[j][1], dp[j + 1][1])
                )
                
                dp[j + 1][1] = max(
                    max(dp[j][1], dp[j + 1][1]) + x, 
                    max(dp[j][0], dp[j + 1][0])
                )
                
                dp[j + 1][0] = max(dp[j][0], dp[j + 1][0]) + x
            }
        }

        return dp[n][2]
    }
}