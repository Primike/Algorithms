class Solution {
    func maxProductPath(_ grid: [[Int]]) -> Int {
        let mod = 1_000_000_007
        let m = grid.count
        let n = grid[0].count
        
        var maxgt = Array(repeating: Array(repeating: 0, count: n), count: m)
        var minlt = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        maxgt[0][0] = grid[0][0]
        minlt[0][0] = grid[0][0]
        
        for i in 1..<n {
            maxgt[0][i] = maxgt[0][i - 1] * grid[0][i]
            minlt[0][i] = maxgt[0][i]
        }
        
        for i in 1..<m {
            maxgt[i][0] = maxgt[i - 1][0] * grid[i][0]
            minlt[i][0] = maxgt[i][0]
        }
        
        for i in 1..<m {
            for j in 1..<n {
                if grid[i][j] >= 0 {
                    maxgt[i][j] = max(maxgt[i][j - 1], maxgt[i - 1][j]) * grid[i][j]
                    minlt[i][j] = min(minlt[i][j - 1], minlt[i - 1][j]) * grid[i][j]
                } else {
                    maxgt[i][j] = min(minlt[i][j - 1], minlt[i - 1][j]) * grid[i][j]
                    minlt[i][j] = max(maxgt[i][j - 1], maxgt[i - 1][j]) * grid[i][j]
                }
            }
        }
        
        let result = maxgt[m - 1][n - 1]
        if result < 0 {
            return -1
        }
        return result % mod
    }
}