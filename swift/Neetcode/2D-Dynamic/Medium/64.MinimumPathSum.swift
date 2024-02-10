// Given a m x n grid filled with non-negative numbers, find a path from 
// top left to bottom right, which minimizes the sum of all numbers along its path.

// Time: O(m * n), Space: O(m * n)
func minPathSum(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var tab = Array(repeating: Array(repeating: Int.max, count: cols), count: rows)

    for i in 0..<rows {
        for j in 0..<cols {
            if i > 0 { tab[i][j] = min(tab[i][j], tab[i - 1][j]) }
            if j > 0 { tab[i][j] = min(tab[i][j], tab[i][j - 1]) }
            if tab[i][j] == .max { tab[i][j] = 0 }
            tab[i][j] += grid[i][j]
        }
    }

    return tab[rows - 1][cols - 1]
}

print(minPathSum([
    [1,3,1],
    [1,5,1],
    [4,2,1]]))
print(minPathSum([
    [1,2,3],
    [4,5,6]]))


func minPathSum2(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i >= rows || j >= cols { return .max }
        if let value = memo[key] { return value }

        var result = min(dp(i, j + 1), dp(i + 1, j))
        result = (result == .max ? 0 : result) + grid[i][j]

        memo[key] = result
        return result
    }

    return dp(0, 0)
}