// Given an m r n 2D binary grid grid which represents a map of 
// '1's (land) and '0's (water), return the number of islands.

// Time: O(2 * n * m), Space: O(n * m)
func numIslands(_ grid: [[Character]]) -> Int {
    let rows = grid.count, cols = grid[0].count 
    var visited = Set<String>()
    
    func dfs(_ i: Int, _ j: Int) {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return }
        if visited.contains(key) || grid[i][j] == "0" { return }

        visited.insert(key)
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

        for (di, dj) in directions {
            dfs(di, dj)
        }
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == "1", !visited.contains("\(i),\(j)") {
                dfs(i, j)
                result += 1
            }
        }
    }

    return result
}

print(numIslands([
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]))
print(numIslands([
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]))


func numIslands2(_ grid: [[Character]]) -> Int {
    var rows = grid.count, cols = grid[0].count
    var visited = Set<String>()

    func bfs(_ i: Int, _ j: Int) {
        var queue = [(i, j)]

        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            visited.insert("\(r),\(c)")
            let directions = [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
    
            for (di, dj) in directions {
                if i < 0 || i >= rows || j < 0 || j >= cols { continue }
                if visited.contains(key) || grid[i][j] == "0" { continue }

                queue.append((di, dj))
            }
        }
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == "1", !visited.contains("\(i),\(j)") {
                bfs(i, j)
                result += 1
            }
        }
    }

    return result
}