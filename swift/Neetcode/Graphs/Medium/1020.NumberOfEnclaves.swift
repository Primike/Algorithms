// Return the number of land cells in grid for which we cannot walk off the 
// boundary of the grid in any number of moves.

func numEnclaves(_ grid: [[Int]]) -> Int {
    var rows = grid.count, cols = grid[0].count
    var land = 0, borderLand = 0
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> Int {
        if i < 0 || i == rows || j < 0 || j == cols || grid[i][j] == 0 || visited.contains("\(i),\(j)"){
            return 0
        }

        visited.insert("\(i),\(j)")
        var count = 1
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        
        for (di, dj) in directions {
            count += dfs(i + di, j + dj)
        }

        return count
    }

    for i in 0..<rows {
        for j in 0..<cols {
            land += grid[i][j]

            if grid[i][j] == 1, !visited.contains("\(i),\(j)"), (i == 0 || i == rows - 1 || j == 0 || j == cols - 1) {
                borderLand += dfs(i, j)
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