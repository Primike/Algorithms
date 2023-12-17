// Return the number of closed islands 0.

func closedIsland(_ grid: [[Int]]) -> Int {
    var rows = grid.count, cols = grid[0].count 
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> Bool {
        let key = "\(i),\(j)"
        
        if i < 0 || i >= rows || j < 0 || j >= cols { return false }
        if grid[i][j] == 1 || visited.contains(key) { return true }

        visited.insert(key)
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
        var closed = true

        for (di, dj) in directions {
            if !dfs(di, dj) { closed = false }
        }

        return closed
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 0, !visited.contains("\(i),\(j)") {
                result += dfs(i, j) ? 1 : 0
            }
        }
    }

    return result
}

print(closedIsland(
    [[1,1,1,1,1,1,1,0],
    [1,0,0,0,0,1,1,0],
    [1,0,1,0,1,1,1,0],
    [1,0,0,0,0,1,0,1],
    [1,1,1,1,1,1,1,0]]))
print(closedIsland(
    [[0,0,1,0,0],
    [0,1,0,1,0],
    [0,1,1,1,0]]))
print(closedIsland(
    [[1,1,1,1,1,1,1],
    [1,0,0,0,0,0,1],
    [1,0,1,1,1,0,1],
    [1,0,1,0,1,0,1],
    [1,0,1,1,1,0,1],
    [1,0,0,0,0,0,1],
    [1,1,1,1,1,1,1]]))