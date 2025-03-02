// You are given an n x n binary matrix grid. 
// You are allowed to change at most one 0 to be 1.
// Return the size of the largest island in grid 
// after applying this operation.

// Time: O(n^2), Space: O(n^2)
func largestIsland(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var islandId = 2
    
    func dfs(_ i: Int, _ j: Int) -> Int {
        grid[i][j] = islandId
        var count = 1

        for (di, dj) in directions {
            let r = i + di, c = j + dj

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if grid[r][c] != 1 { continue }

            count += dfs(r, c)
        }

        return count
    }

    var islandSizes = [Int: Int]()

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1 {
                let total = dfs(i, j)
                islandSizes[islandId] = total
                islandId += 1
            }
        }
    }

    var result = islandSizes.values.max() ?? 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] != 0 { continue }

            var islands = Set<Int>()

            for (di, dj) in directions {
                let r = i + di, c = j + dj
                
                if r < 0 || r >= rows || c < 0 || c >= cols { continue }
                if grid[r][c] == 0 { continue }

                islands.insert(grid[r][c])
            }

            let total = islands.map { islandSizes[$0, default: 0] }.reduce(0, +)
            result = max(result, total + 1)
        }
    }

    return result
}