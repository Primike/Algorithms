// You can start at any cell in the first column of the matrix, 
// and traverse the grid in the following way:
// From a cell (row, col), you can move to any of the cells: 
// (row - 1, col + 1), (row, col + 1) and (row + 1, col + 1) 
// such that the value of the cell you move to, 
// should be strictly bigger than the value of the current cell.
// Return the maximum number of moves that you can perform.

// Time: O(m * n), Space: O(m * n)
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

print(maxMoves([[2,4,3,5],[5,4,9,3],[3,4,2,11],[10,9,13,15]]))
print(maxMoves([[3,2,4],[2,1,9],[1,1,7]]))


func maxMoves(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if let value = memo[key] { return value }
        if j == cols - 1 { return 0 }
        
        var maximum = 0

        if i > 0, grid[i][j] < grid[i - 1][j + 1] { 
            maximum = max(maximum, dp(i - 1, j + 1) + 1) 
        }

        if grid[i][j] < grid[i][j + 1] { 
            maximum = max(maximum, dp(i, j + 1) + 1) 
        }

        if i < rows - 1, grid[i][j] < grid[i + 1][j + 1] { 
            maximum = max(maximum, dp(i + 1, j + 1) + 1) 
        }

        memo[key] = maximum
        return maximum
    }

    var result = 0

    for i in 0..<rows {
        result =  max(result, dp(i, 0))
    }

    return result
}