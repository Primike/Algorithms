// An obstacle and space are marked as 1 or 0 respectively in grid. 
// A path that the robot takes cannot include any square that is an obstacle.
// Return the number of possible unique paths that the robot can take to
// reach the bottom-right corner.

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let rows = obstacleGrid.count, cols = obstacleGrid[0].count
    if obstacleGrid[0][0] == 1  || obstacleGrid[rows - 1][cols - 1] == 1 { return 0 }

    var tab = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    tab[0][0] = 1
    
    for i in 0..<rows {
        for j in 0..<cols {
            if obstacleGrid[i][j] == 1 { continue }
            if j < cols - 1 { tab[i][j + 1] += tab[i][j] }
            if i < rows - 1 { tab[i + 1][j] += tab[i][j] }
        }
    }

    return tab[rows - 1][cols - 1]
}

print(uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]]))
print(uniquePathsWithObstacles([[0,1],[0,0]]))