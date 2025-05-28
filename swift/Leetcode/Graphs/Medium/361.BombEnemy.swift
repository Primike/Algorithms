class Solution {
    func maxKilledEnemies(_ grid: [[Character]]) -> Int {
        if grid.isEmpty {
            return 0
        }

        let rows = grid.count
        let cols = grid[0].count

        var maxCount = 0
        var rowHits = 0
        var colHits = Array(repeating: 0, count: cols)

        for row in 0..<rows {
            for col in 0..<cols {
                if col == 0 || grid[row][col - 1] == "W" {
                    rowHits = 0
                    for k in col..<cols {
                        if grid[row][k] == "W" {
                            break
                        } else if grid[row][k] == "E" {
                            rowHits += 1
                        }
                    }
                }

                if row == 0 || grid[row - 1][col] == "W" {
                    colHits[col] = 0
                    for k in row..<rows {
                        if grid[k][col] == "W" {
                            break
                        } else if grid[k][col] == "E" {
                            colHits[col] += 1
                        }
                    }
                }

                if grid[row][col] == "0" {
                    let totalHits = rowHits + colHits[col]
                    maxCount = max(maxCount, totalHits)
                }
            }
        }
        return maxCount
    }
}