// Given an n x n integer matrix grid, 
// return the minimum sum of a falling path with non-zero shifts.

// Time: O(n^2), Space: O(n)
func minFallingPathSum(_ grid: [[Int]]) -> Int {   
    if grid.count == 1 { return grid[0].min() ?? 0 } 
    
    let rows = grid.count, cols = grid[0].count
    var tab = [(-1, 0), (-1, 0)]

    for i in 0..<rows {
        var nextRow = [(Int, Int)]()

        for j in 0..<cols {
            var result = Int.max
            
            if j != tab[0].0 { result = min(result, tab[0].1) }
            if j != tab[1].0 { result = min(result, tab[1].1) }

            result += grid[i][j]
            nextRow.append((j, result))
        }

        var minimums = Array(repeating: (0, Int.max), count: 2)

        for (j, value) in nextRow {
            if value <= minimums[0].1 {
                if minimums[0].1 <= minimums[1].1 { minimums[1] = minimums[0] }
                minimums[0] = (j, value)
            } else if value <= minimums[1].1 {
                minimums[1] = (j, value)
            }
        }

        tab = minimums
    }

    return min(tab[0].1, tab[1].1)
}

print(minFallingPathSum([[1,2,3],[4,5,6],[7,8,9]]))
print(minFallingPathSum([[7]]))


// Time: O(n^3), Space: O(n)
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