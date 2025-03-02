// You are given an m x n integer matrix grid where each cell is either 
// 0 (empty) or 1 (obstacle). You can move up, down, left, or right 
// from and to an empty cell in one step.
// Return the minimum number of steps to walk from the upper left corner 
// (0, 0) to the lower right corner (m - 1, n - 1) given that you can eliminate 
// at most k obstacles. If it is not possible to find such walk return -1.

// Time: O(m * n), Space: O(m * n)
func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
    if grid.count == 1, grid[0].count == 1 { return 0 }

    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Set([[0, 0, 0]])
    var queue = [(0, 0, 0)]
    var result = 0

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j, removed) = queue.removeFirst()                

            for (di, dj) in directions {
                let r = i + di, c = j + dj

                if r < 0 || r >= rows || c < 0 || c >= cols { continue }
                if r == rows - 1, c == cols - 1 { return result + 1 }
                
                if grid[r][c] == 0, !visited.contains([r, c, removed]) {
                    visited.insert([r, c, removed])
                    queue.append((r, c, removed))
                } else if removed < k, !visited.contains([r, c, removed + 1]) {
                    visited.insert([r, c, removed + 1])
                    queue.append((r, c, removed + 1))
                }
            }
        }

        result += 1
    }

    return -1
}

print(shortestPath([[0,0,0],[1,1,0],[0,0,0],[0,1,1],[0,0,0]], 1))
print(shortestPath([[0,1,1],[1,1,1],[1,0,0]], 1))