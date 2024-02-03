// Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. 
// If there is no clear path, return -1.

// Time: O(n^2), Space: O(n^2)
func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    if grid[n - 1][n - 1] == 1 || grid[0][0] == 1 { return -1 }

    var n = grid.count
    var queue = [(0, 0)]
    var visited: Set<String> = ["0,0"]
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
    var result = 1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()
            if i == n - 1, j == n - 1 { return result }

            for (di, dj) in directions {
                var r = i + di, c = j + dj
                let key = "\(r),\(c)"

                if r < 0 || r >= n || c < 0 || c >= n { continue }
                if grid[r][c] == 1 || visited.contains(key) { continue }

                visited.insert(key)
                queue.append((r, c))
            }
        }

        result += 1
    }

    return -1
}

print(shortestPathBinaryMatrix([[0,1],[1,0]]))
print(shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]]))
print(shortestPathBinaryMatrix([[1,0,0],[1,1,0],[1,1,0]]))