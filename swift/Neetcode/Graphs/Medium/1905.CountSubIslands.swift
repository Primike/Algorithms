// Return the number of islands in grid2 that are considered sub-islands.

func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
    var grid2 = grid2
    let rows = grid2.count, cols = grid2[0].count

    func dfs(_ i: Int, _ j: Int) -> Bool {
        if i < 0 || i >= rows || j < 0 || j >= cols || grid2[i][j] == 0 {
            return true
        }

        grid2[i][j] = 0
        var result = true
        if grid1[i][j] == 0 { result = false }

        result = dfs(i + 1, j) && result
        result = dfs(i - 1, j) && result
        result = dfs(i, j + 1) && result
        result = dfs(i, j - 1) && result

        return result
    }

    var count = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid2[i][j] == 1, dfs(i, j) { count += 1 }
        }
    }

    return count
}

print(countSubIslands(
    [[1,1,1,0,0],
    [0,1,1,1,1],
    [0,0,0,0,0],
    [1,0,0,0,0],
    [1,1,0,1,1]], 

    [[1,1,1,0,0],
    [0,0,1,1,1],
    [0,1,0,0,0],
    [1,0,1,1,0],
    [0,1,0,1,0]]
))
print(countSubIslands(
    [[1,0,1,0,1],
    [1,1,1,1,1],
    [0,0,0,0,0],
    [1,1,1,1,1],
    [1,0,1,0,1]], 
    
    [[0,0,0,0,0],
    [1,1,1,1,1],
    [0,1,0,1,0],
    [0,1,0,1,0],
    [1,0,0,0,1]]))