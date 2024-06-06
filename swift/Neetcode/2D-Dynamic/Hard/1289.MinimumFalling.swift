// Given an n x n integer matrix grid, 
// return the minimum sum of a falling path with non-zero shifts.

// Time: O(n^2), Space: O(n)
func minFallingPathSum(_ grid: [[Int]]) -> Int {
    if grid.count == 1 { return grid[0].min() ?? 0 } 

    let rows = grid.count
    var tab = grid[0]

    for i in 1..<rows {
        var currentRow = Array(repeating: Int.max, count: rows)

        for j in 0..<rows {
            for k in 0..<rows { 
                if k == j { continue }

                currentRow[j] = min(currentRow[j], tab[k] + grid[i][j])
            }
        }

        tab = currentRow 
    }

    return tab.min() ?? 0
}

print(minFallingPathSum([[1,2,3],[4,5,6],[7,8,9]]))
print(minFallingPathSum([[7]]))