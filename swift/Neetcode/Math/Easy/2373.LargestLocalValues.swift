// Generate an integer matrix maxLocal of size (n - 2) x (n - 2) such that:
// maxLocal[i][j] is equal to the largest value of the 3 x 3 matrix 
// in grid centered around row i + 1 and column j + 1.

// Time: O(n * n), Space: O(n * n)
func largestLocal(_ grid: [[Int]]) -> [[Int]] {
    let rows = grid.count - 2, cols = grid[0].count - 2
    var result = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
    
    for i in 1...rows {
        for j in 1...cols {
            var largest = grid[i][j]

            for (di, dj) in directions {
                largest = max(largest, grid[i - di][j - dj])
            }

            result[i - 1][j - 1] = largest
        }
    }

    return result
}

print(largestLocal([[9,9,8,1],[5,6,2,6],[8,2,6,4],[6,2,2,2]]))
print(largestLocal([[1,1,1,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,1,1,1],[1,1,1,1,1]]))