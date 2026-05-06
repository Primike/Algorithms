class Solution {
    func maxPathScore(_ grid: [[Int]], _ k: Int) -> Int {
        let m = grid.count
        let n = grid[0].count
        let INF = Int.min

        // 3D DP array: dp[row][column][remaining_k]
        var dp = Array(repeating: Array(repeating: Array(repeating: INF, count: k + 1), count: n), count: m)
        
        // Starting point
        dp[0][0][0] = 0

        for i in 0..<m {
            for j in 0..<n {
                for c in 0...k {
                    let currentScore = dp[i][j][c]
                    if currentScore == INF { continue }

                    // Move Down
                    if i + 1 < m {
                        let val = grid[i + 1][j]
                        let cost = (val == 0) ? 0 : 1
                        if c + cost <= k {
                            dp[i + 1][j][c + cost] = max(dp[i + 1][j][c + cost], currentScore + val)
                        }
                    }

                    // Move Right
                    if j + 1 < n {
                        let val = grid[i][j + 1]
                        let cost = (val == 0) ? 0 : 1
                        if c + cost <= k {
                            dp[i][j + 1][c + cost] = max(dp[i][j + 1][c + cost], currentScore + val)
                        }
                    }
                }
            }
        }

        if let maxScore = dp[m - 1][n - 1].max(), maxScore >= 0 {
            return maxScore
        }
        
        return -1
    }
}