class Solution {
    func maximumScore(_ grid: [[Int]]) -> Int {
        let n = grid[0].count
        if n == 1 { return 0 }

        // dp[i][curr_h][prev_h]
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1), count: n)
        var prevMax = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        var prevSuffixMax = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        var colSum = Array(repeating: Array(repeating: 0, count: n + 1), count: n)

        // Precompute prefix sums for each column
        for c in 0..<n {
            for r in 1...n {
                colSum[c][r] = colSum[c][r - 1] + grid[r - 1][c]
            }
        }

        for i in 1..<n {
            for currH in 0...n {
                for prevH in 0...n {
                    if currH <= prevH {
                        let extraScore = colSum[i][prevH] - colSum[i][currH]
                        dp[i][currH][prevH] = max(
                            dp[i][currH][prevH],
                            prevSuffixMax[prevH][0] + extraScore
                        )
                    } else {
                        let extraScore = colSum[i - 1][currH] - colSum[i - 1][prevH]
                        dp[i][currH][prevH] = max(
                            dp[i][currH][prevH],
                            prevSuffixMax[prevH][currH],
                            prevMax[prevH][currH] + extraScore
                        )
                    }
                }
            }

            // Update optimization matrices for the next column
            for currH in 0...n {
                prevMax[currH][0] = dp[i][currH][0]
                for prevH in 1...n {
                    let penalty = (prevH > currH) ? (colSum[i][prevH] - colSum[i][currH]) : 0
                    prevMax[currH][prevH] = max(
                        prevMax[currH][prevH - 1],
                        dp[i][currH][prevH] - penalty
                    )
                }

                prevSuffixMax[currH][n] = dp[i][currH][n]
                for prevH in stride(from: n - 1, through: 0, by: -1) {
                    prevSuffixMax[currH][prevH] = max(
                        prevSuffixMax[currH][prevH + 1],
                        dp[i][currH][prevH]
                    )
                }
            }
        }

        var ans = 0
        for k in 0...n {
            ans = max(ans, dp[n - 1][n][k], dp[n - 1][0][k])
        }

        return ans
    }
}