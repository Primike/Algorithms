// An obstacle and space are marked as 1 or 0 respectively in grid. 
// A path that the robot takes cannot include any square that is an obstacle.
// Return the number of possible unique paths that the robot can take to
// reach the bottom-right corner.

// Time: O(m * n), Space: O(m * n)
func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count, n = obstacleGrid[0].count
    if obstacleGrid[m - 1][n - 1] == 1 { return 0 }

    var tab = Array(repeating: Array(repeating: 0, count: n), count: m)
    tab[0][0] = 1

    for i in 0..<m {
        for j in 0..<n {
            if obstacleGrid[i][j] == 1 { continue }
            if i < m - 1 { tab[i + 1][j] += tab[i][j] }
            if j < n - 1 { tab[i][j + 1] += tab[i][j] } 
        }
    }

    return tab[m - 1][n - 1]
}

print(uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]]))
print(uniquePathsWithObstacles([[0,1],[0,0]]))


func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count, n = obstacleGrid[0].count
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i >= m || j >= n || obstacleGrid[i][j] == 1 { return 0 }
        if i == m - 1, j == n - 1 { return 1 }
        if let value = memo[key] { return value }

        var result = dp(i + 1, j) + dp(i, j + 1)
        memo[key] = result
        return result
    }

    return dp(0, 0)
}