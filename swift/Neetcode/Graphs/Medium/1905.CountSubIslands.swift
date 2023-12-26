// Return the number of islands in grid2 that are considered sub-islands.

// Time: 2 * n * m, Space: n * m
func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
    let rows = grid2.count, cols = grid2[0].count
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> Bool {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return true }
        if grid2[i][j] == 0 || visited.contains(key) { return true }

        visited.insert(key)
        var bool = true
        if grid1[i][j] == 0 { bool = false }
        
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

        for (di, dj) in directions {
            bool = dfs(di, dj) && bool 
        }

        return bool
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid2[i][j] == 1, !visited.contains("\(i),\(j)") {
                if dfs(i, j) { result += 1 }
            }
        }
    }

    return result
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

func countSubIslands2(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
    let rows = grid2.count, cols = grid2[0].count
    var visited = Set<String>()

    func bfs(_ i: Int, _ j: Int) -> Bool {
        var queue = [(i, j)]
        var isSubIsland = grid1[i][j] == 1

        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            visited.insert("\(r),\(c)")
            let directions = [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]

            for (di, dj) in directions {
                if di < 0 || di >= rows || dj < 0 || dj >= cols { continue }
                if grid2[di][dj] == 0 || visited.contains("\(di),\(dj)") { continue }
                if grid1[di][dj] == 0 { isSubIsland = false }

                queue.append((di, dj))
            }
        }
        
        return isSubIsland
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid2[i][j] == 1, !visited.contains("\(i),\(j)") {
                if bfs(i, j) { result += 1 }
            }
        }
    }

    return result
}