// Return the number of closed islands 0.

func closedIsland(_ grid: [[Int]]) -> Int {
    var grid = grid
    var rows = grid.count, cols = grid[0].count

    func dfs(_ i: Int, _ j: Int) -> Bool {
        if i < 0 || i >= rows || j < 0 || j >= cols { return false }  
        if grid[i][j] == 1 { return true }

        grid[i][j] = 1

        let top = dfs(i - 1, j)
        let bottom = dfs(i + 1, j)
        let left = dfs(i, j - 1)
        let right = dfs(i, j + 1)
        
        return top && bottom && left && right
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 0 && dfs(i, j) {
                result += 1
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