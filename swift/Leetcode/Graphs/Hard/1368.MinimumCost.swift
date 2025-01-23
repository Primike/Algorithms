func minCost(_ grid: [[Int]]) -> Int {
    let numRows = grid.count
    let numCols = grid[0].count

    var minChanges = Array(repeating: Array(repeating: Int.max, count: numCols), count: numRows)
    minChanges[0][0] = 0

    while true {
        let prevState = minChanges.map { $0 }

        for row in 0..<numRows {
            for col in 0..<numCols {
                if row > 0 {
                    minChanges[row][col] = min(
                        minChanges[row][col],
                        minChanges[row - 1][col] + (grid[row - 1][col] == 3 ? 0 : 1)
                    )
                }
                if col > 0 {
                    minChanges[row][col] = min(
                        minChanges[row][col],
                        minChanges[row][col - 1] + (grid[row][col - 1] == 1 ? 0 : 1)
                    )
                }
            }
        }

        for row in stride(from: numRows - 1, through: 0, by: -1) {
            for col in stride(from: numCols - 1, through: 0, by: -1) {
                if row < numRows - 1 {
                    minChanges[row][col] = min(
                        minChanges[row][col],
                        minChanges[row + 1][col] + (grid[row + 1][col] == 4 ? 0 : 1)
                    )
                }
                if col < numCols - 1 {
                    minChanges[row][col] = min(
                        minChanges[row][col],
                        minChanges[row][col + 1] + (grid[row][col + 1] == 2 ? 0 : 1)
                    )
                }
            }
        }

        if minChanges == prevState {
            break
        }
    }

    return minChanges[numRows - 1][numCols - 1]
}