// You are given an n x n binary matrix grid where 1 represents land and 0 represents water.
// Return the smallest number of 0's you must flip to connect the two islands.

func shortestBridge(_ grid: [[Int]]) -> Int {
    var n = grid.count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Set<String>()

    func isOutOfBounds(_ i: Int, _ j: Int) -> Bool {
        return i < 0 || i >= n || j < 0 || j >= n
    }

    func dfs(_ i: Int, _ j: Int) {
        if isOutOfBounds(i, j) || grid[i][j] != 1 || visited.contains("\(i),\(j)") {
            return
        }

        visited.insert("\(i),\(j)")
        for (di, dj) in directions {
            dfs(i + di, j + dj)
        }
    }

    var result = 0

    func bfs() -> Int {
        var queue = Array(visited)

        while !queue.isEmpty {
            for i in 0..<queue.count {
                let first = queue.removeFirst()
                let position = first.split(separator: ",").map { Int($0)! }

                for (di, dj) in directions {
                    var x = position[0] + di, y = position[1] + dj

                    if isOutOfBounds(x, y) || visited.contains("\(x),\(y)") {
                        continue
                    }

                    if grid[x][y] == 1 {
                        return result
                    }

                    queue.append("\(x),\(y)")
                    visited.insert("\(x),\(y)")
                }
            }

            result += 1
        }

        return result
    }

    for i in 0..<n {
        for j in 0..<n {
            if grid[i][j] == 1 {
                dfs(i, j)
                return bfs()
            }
        }
    }

    return result
}

print(shortestBridge([[0,1],[1,0]]))
print(shortestBridge([[0,1,0],[0,0,0],[0,0,1]]))
print(shortestBridge([[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]))