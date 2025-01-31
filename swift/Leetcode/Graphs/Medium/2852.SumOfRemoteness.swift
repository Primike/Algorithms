// You are given a 0-indexed matrix grid of order n * n. 
// Each cell in this matrix has a value grid[i][j], 
// which is either a positive integer or -1 representing a blocked cell.
// You can move from a non-blocked cell to 
// any non-blocked cell that shares an edge.
// For any cell (i, j), we represent its remoteness as R[i][j] 
// which is defined as the following:
// If the cell (i, j) is a non-blocked cell, 
// R[i][j] is the sum of the values grid[x][y] such that there is 
// no path from the non-blocked cell (x, y) to the cell (i, j).
// For blocked cells, R[i][j] == 0.
// Return the sum of R[i][j] over all cells.

// Time: O(n^2), Space: O(n^2)
func sumRemoteness(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    func dfs(_ i: Int, _ j: Int) -> (Int, Int) {
        var cellCount = 1
        var islandTotal = grid[i][j]
        grid[i][j] = -1

        for (di, dj) in directions {
            let r = i + di, c = j + dj

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if grid[r][c] == -1 { continue }

            let (count, total) = dfs(r, c)
            cellCount += count
            islandTotal += total
        }

        return (cellCount, islandTotal)
    }

    let gridSum = grid.reduce(0) { $0 + $1.filter { $0 != -1 }.reduce(0, +) }
    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] != -1 { 
                let (cellCount, islandTotal) = dfs(i, j)
                result += cellCount * (gridSum - islandTotal)
            }
        }
    }

    return result
}

print(sumRemoteness([[-1,1,-1],[5,-1,4],[-1,3,-1]]))
print(sumRemoteness([[-1,3,4],[-1,-1,-1],[3,-1,-1]]))
print(sumRemoteness([[1]]))