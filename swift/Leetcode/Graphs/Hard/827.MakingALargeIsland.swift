// You are given an n x n binary matrix grid. 
// You are allowed to change at most one 0 to be 1.
// Return the size of the largest island in grid 
// after applying this operation.

// Time: O(n^2), Space: O(n^2)
func largestIsland(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Set<String>()
    var colorToSize = [Int: Int]()
    var size = 0
    var color = 1

    func dfs(_ i: Int, _ j: Int) {  
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return }
        if grid[i][j] == 0 || visited.contains(key) { return }

        size += 1
        grid[i][j] = color
        visited.insert(key)

        for (di, dj) in directions {
            dfs(i + di, j + dj)
        }
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if visited.contains("\(i),\(j)") || grid[i][j] == 0 { continue }

            dfs(i, j)
            colorToSize[color] = size
            size = 0
            color += 1
        }
    }

    var result = 0
    
    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] != 0 { continue }

            var colors = Set<Int>()

            for (di, dj) in directions {
                let r = i + di, c = j + dj

                if r < 0 || r >= rows || c < 0 || c >= cols { continue }
                if grid[r][c] == 0 || colors.contains(grid[r][c]) { continue }
                colors.insert(grid[r][c])
            }

            var total = 1

            for color in colors {
                total += colorToSize[color, default: 0]
            }

            result = max(result, total)
        }
    }

    return max(result, colorToSize.values.max() ?? 0)
}

print(largestIsland([[1,0],[0,1]]))
print(largestIsland([[1,1],[1,0]]))
print(largestIsland([[1,1],[1,1]]))


func largestIsland2(_ grid: [[Int]]) -> Int {
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