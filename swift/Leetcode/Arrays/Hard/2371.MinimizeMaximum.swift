// You are given an m x n integer matrix grid containing distinct positive integers.
// You have to replace each integer in the matrix with a positive integer 
// satisfying the following conditions:
// The relative order of every two elements that are in the same 
// row or column should stay the same after the replacements.
// The maximum number in the matrix after the replacements 
// should be as small as possible.
// For example, if grid = [[2, 4, 5], [7, 3, 9]] then a good replacement 
// could be either grid = [[1, 2, 3], [2, 1, 4]] or grid = [[1, 2, 3], [3, 1, 4]].
// Return the resulting matrix. If there are multiple answers, return any of them.

// Time: O(m * n * log(m * n)), Space: O(m * n)
func minScore(_ grid: [[Int]]) -> [[Int]] {
    var grid = grid
    let rows = grid.count, cols = grid[0].count
    var rowsMax = Array(repeating: 1, count: rows)
    var colsMax = Array(repeating: 1, count: cols)
    var numbers = [(Int, Int, Int)]()

    for i in 0..<rows {
        for j in 0..<cols {
            numbers.append((grid[i][j], i, j))
        }
    }

    numbers.sort { $0.0 < $1.0 }

    for (_, i, j) in numbers {
        let maximum = max(rowsMax[i], colsMax[j])
        grid[i][j] = maximum
        rowsMax[i] = maximum + 1
        colsMax[j] = maximum + 1
    }

    return grid
}

print(minScore([[3,1],[2,5]]))
print(minScore([[10]]))