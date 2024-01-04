// You are given an m x n integer matrix grid where each cell is either 
// 0 (empty) or 1 (obstacle). You can move up, down, left, or right 
// from and to an empty cell in one step.
// Return the minimum number of steps to walk from the upper left corner 
// (0, 0) to the lower right corner (m - 1, n - 1) given that you can eliminate 
// at most k obstacles. If it is not possible to find such walk return -1.

func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
    let rows = grid.count, cols = grid[0].count
    var visited = Set([[0, 0, 0]])
    var queue = [(0, 0, 0)]
    var result = 0

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j, count) = queue.removeFirst()
            let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
            
            if i == rows - 1, j == cols - 1 { return result }

            for (di, dj) in directions {
                let key = [di, dj, count]

                if di < 0 || di >= rows || dj < 0 || dj >= cols { continue }
                if visited.contains(key) { continue }
                if count == k, grid[di][dj] == 1 { continue }

                var newCount = count
                if grid[di][dj] == 1 { newCount += 1 }

                visited.insert(key)
                queue.append((di, dj, newCount))
            }
        }

        result += 1
    }

    return -1
}

print(shortestPath([[0,0,0],[1,1,0],[0,0,0],[0,1,1],[0,0,0]], 1))
print(shortestPath([[0,1,1],[1,1,1],[1,0,0]], 1))