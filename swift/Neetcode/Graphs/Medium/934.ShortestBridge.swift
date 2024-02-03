// You are given an n x n binary matrix grid where 1 represents land and 0 represents water.
// Return the smallest number of 0's you must flip to connect the two islands.

// Time: O(m * n), Space: O(m * n)
func shortestBridge(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count 
    var visited = Set<String>()
    var queue = [(Int, Int)]()

    func dfs(_ i: Int, _ j: Int) {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return }
        if visited.contains(key) || grid[i][j] == 0 { return }

        visited.insert(key)
        queue.append((i, j))
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

        for (di, dj) in directions {
            dfs(di, dj)
        }
    }

    func bfs(_ i: Int, _ j: Int) -> Int {
        dfs(i, j)
        var count = 0

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let (r, c) = queue.removeFirst()
                let directions = [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]

                for (di, dj) in directions {
                    let key = "\(di),\(dj)"

                    if di < 0 || di >= rows || dj < 0 || dj >= cols { continue }
                    if visited.contains(key) { continue }
                    if grid[di][dj] == 1 { return count }

                    visited.insert(key)
                    queue.append((di, dj))
                }
            }

            count += 1
        }

        return count
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1 { return bfs(i, j) }
        }
    }

    return 0
}

print(shortestBridge([[0,1],[1,0]]))
print(shortestBridge([[0,1,0],[0,0,0],[0,0,1]]))
print(shortestBridge([[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]))