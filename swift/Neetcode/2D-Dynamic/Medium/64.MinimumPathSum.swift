// Given a m x n grid filled with non-negative numbers, find a path from 
// top left to bottom right, which minimizes the sum of all numbers along its path.

func minPathSum(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count 
    var tab = Array(repeating: Array(repeating: 0, count: cols), count: rows)

    for i in 0..<rows {
        for j in 0..<cols {
            if i > 0, j > 0 {
                tab[i][j] = min(tab[i - 1][j], tab[i][j - 1])
            } else {
                if i > 0 { tab[i][j] = tab[i - 1][j] }
                if j > 0 { tab[i][j] = tab[i][j - 1] }
            }

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
    var tab = Array(repeating: Array(repeating: Int.max, count: cols), count: rows)
    tab[0][0] = grid[0][0]

    for i in 0..<rows {
        for j in 0..<cols {
            if j < cols - 1 {
                tab[i][j + 1] = min(tab[i][j + 1], tab[i][j] + grid[i][j + 1])
            }

            if i < rows - 1 {
                tab[i + 1][j] = min(tab[i + 1][j], tab[i][j] + grid[i + 1][j])
            }
        }
    }

    return tab[rows - 1][cols - 1]
}