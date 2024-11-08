func maxMoves(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    
    for i in 0..<rows {
        dp[i][0] = 1
    }

    var result = 0

    for j in 1..<cols {
        for i in 0..<rows {
            if grid[i][j] > grid[i][j - 1], dp[i][j - 1] > 0 {
                dp[i][j] = max(dp[i][j], dp[i][j - 1] + 1)
            }

            if i - 1 >= 0, grid[i][j] > grid[i - 1][j - 1], dp[i - 1][j - 1] > 0 {
                dp[i][j] = max(dp[i][j], dp[i - 1][j - 1] + 1)
            }

            if i + 1 < rows, grid[i][j] > grid[i + 1][j - 1], dp[i + 1][j - 1] > 0 {
                dp[i][j] = max(dp[i][j], dp[i + 1][j - 1] + 1)
            }

            result = max(result, dp[i][j] - 1)
        }
    }

    return result
}