// You are given an m x n binary matrix grid. 
// An island is a group of 1's (representing land) connected 
// 4-directionally (horizontal or vertical.) 
// You may assume all four edges of the grid are surrounded by water.

// Time: O(2 * n * m), Space: O(n * m)
func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return 0 }
        if grid[i][j] == 0 || visited.contains(key) { return 0 }

        visited.insert(key)
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
        var area = 0

        for (di, dj) in directions {
            area += dfs(di, dj)
        }

        return area + 1
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1, !visited.contains("\(i),\(j)") {
                result = max(result, dfs(i, j))
            }
        }
    }

    return result
}

print(maxAreaOfIsland([
    [0,0,1,0,0,0,0,1,0,0,0,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,1,1,0,1,0,0,0,0,0,0,0,0],
    [0,1,0,0,1,1,0,0,1,0,1,0,0],
    [0,1,0,0,1,1,0,0,1,1,1,0,0],
    [0,0,0,0,0,0,0,0,0,0,1,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,0,0,0,0,0,0,1,1,0,0,0,0]]))

print(maxAreaOfIsland([[0,0,0,0,0,0,0,0]]))



func maxAreaOfIsland2(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count 
    var visited = Set<String>()

    func bfs(_ i: Int, _ j: Int) -> Int {
        visited.insert("\(i),\(j)")
        var queue = [(i, j)]
        var area = 1

        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            let directions = [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]               

            for (di, dj) in directions {
                let key = "\(di),\(dj)"

                if di < 0 || di >= rows || dj < 0 || dj >= cols { continue }
                if grid[di][dj] == 0 || visited.contains(key) { continue }

                queue.append((di, dj))
                visited.insert(key)
                area += 1
            }
        }

        return area
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1, !visited.contains("\(i),\(j)") {
                result = max(result, bfs(i, j))
            }
        }
    }

    return result
}
