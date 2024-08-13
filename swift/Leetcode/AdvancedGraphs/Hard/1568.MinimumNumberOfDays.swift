// The grid is said to be connected if we have exactly one island, 
// otherwise is said disconnected.
// In one day, we are allowed to change any single land cell (1) into a water cell (0).
// Return the minimum number of days to disconnect the grid.

func minDays(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var discoveryTime = Array(repeating: Array(repeating: -1, count: cols), count: rows)
    var lowest = Array(repeating: Array(repeating: -1, count: cols), count: rows)
    var parent = Array(repeating: Array(repeating: -1, count: cols), count: rows)
    var apInfo = (false, 0)

    func dfs(_ i: Int, _ j: Int) {
        discoveryTime[i][j] = apInfo.1
        apInfo.1 += 1
        lowest[i][j] = discoveryTime[i][j]
        var children = 0

        for (di, dj) in directions {
            let r = i + di, c = j + dj

            if r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] != 1 { continue }

            if discoveryTime[r][c] == -1 {
                children += 1
                parent[r][c] = i * cols + j
                dfs(r, c)
                lowest[i][j] = min(lowest[i][j], lowest[r][c])

                if lowest[r][c] >= discoveryTime[i][j], parent[i][j] != -1 { apInfo.0 = true }
            } else if r * cols + c != parent[i][j] {
                lowest[i][j] = min(lowest[i][j], discoveryTime[r][c])
            }
        }

        if parent[i][j] == -1, children > 1 { apInfo.0 = true }
    }

    var landCells = 0
    var islandCount = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1 {
                landCells += 1
                if discoveryTime[i][j] == -1 {
                    dfs(i, j)
                    islandCount += 1
                }
            }
        }
    }

    if islandCount == 0 || islandCount >= 2 { return 0 }
    if landCells == 1 { return 1 }
    if apInfo.0 { return 1 }

    return 2
}

print(minDays([[0,1,1,0],[0,1,1,0],[0,0,0,0]]))
print(minDays([[1,1]]))