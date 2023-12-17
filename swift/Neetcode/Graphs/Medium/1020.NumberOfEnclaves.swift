// Return the number of land cells in grid for which we cannot walk off the 
// boundary of the grid in any number of moves.

func numEnclaves(_ grid: [[Int]]) -> Int {
    var rows = grid.count, cols = grid[0].count
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i < 0 || i == rows || j < 0 || j == cols { return 0 }
        if grid[i][j] == 0 || visited.contains(key) { return 0 }

        visited.insert(key)
        var count = 1
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
        
        for (di, dj) in directions {
            count += dfs(di, dj)
        }

        return count
    }

    var land = 0, borderLand = 0

    for i in 0..<rows {
        for j in 0..<cols {
            land += grid[i][j]

            if grid[i][j] == 1, !visited.contains("\(i),\(j)") {
                if i == 0 || i == rows - 1 || j == 0 || j == cols - 1 { 
                    borderLand += dfs(i, j) 
                }
            }
        }
    }

    return land - borderLand
}

print(numEnclaves(
    [[0,0,0,0],
    [1,0,1,0],
    [0,1,1,0],
    [0,0,0,0]]))
print(numEnclaves(
    [[0,1,1,0],
    [0,0,1,0],
    [0,0,1,0],
    [0,0,0,0]]))



func numEnclaves(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> (Int, Bool) {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return (0, false) }
        if grid[i][j] == 0 || visited.contains(key) { return (0, true) }

        visited.insert(key)
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
        var count = 1
        var bool = true

        for (di, dj) in directions {
            let (cells, isEnclosed) = dfs(di, dj)
            count += cells
            bool = bool && isEnclosed
        }

        return (count, bool)
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1, !visited.contains("\(i),\(j)") {
                let (count, bool) = dfs(i, j)
                if bool { result += count }
            }
        }
    }

    return result
}