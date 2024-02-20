// You are given an n x n binary matrix grid. 
// You are allowed to change at most one 0 to be 1.
// Return the size of the largest island in grid 
// after applying this operation.

// Time: O(n^2), Space: O(n^2)
func largestIsland(_ grid: [[Int]]) -> Int {
    var grid = grid.map { $0.map { ($0, 0) } }
    var rows = grid.count, cols = grid[0].count
    var visited = Set<String>()
    var currentCells = [(Int, Int)]()

    func dfs(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return 0 }
        if visited.contains(key) || grid[i][j].0 == 0 { return 0 }

        visited.insert(key)
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
        var result = 0
        currentCells.append((i, j))

        for (di, dj) in directions {
            let key = "\(di),\(dj)"
            result += dfs(di, dj)
        }

        return result + 1
    }

    var result = 0
    var islands = 1

    for i in 0..<rows {
        for j in 0..<cols {
            if !visited.contains("\(i),\(j)"), grid[i][j].0 == 1 {
                let area = dfs(i, j)

                for (x, y) in currentCells {
                    grid[x][y] = (area, islands)
                }

                result = max(result, area)
                currentCells = []
                islands += 1
            }
        }
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j].0 == 0 {
                var totalArea = 1
                var label = Set<Int>()

                if i > 0, !label.contains(grid[i - 1][j].1) { 
                    totalArea += grid[i - 1][j].0
                    label.insert(grid[i - 1][j].1)
                }

                if j > 0, !label.contains(grid[i][j - 1].1) { 
                    totalArea += grid[i][j - 1].0
                    label.insert(grid[i][j - 1].1)
                }

                if i + 1 < rows, !label.contains(grid[i + 1][j].1) { 
                    totalArea += grid[i + 1][j].0
                    label.insert(grid[i + 1][j].1)
                }

                if j + 1 < cols, !label.contains(grid[i][j + 1].1) { 
                    totalArea += grid[i][j + 1].0 
                    label.insert(grid[i][j + 1].1)
                }

                result = max(result, totalArea)
            }
        }
    }

    return result
}

print(largestIsland([[1,0],[0,1]]))
print(largestIsland([[1,1],[1,0]]))
print(largestIsland([[1,1],[1,1]]))