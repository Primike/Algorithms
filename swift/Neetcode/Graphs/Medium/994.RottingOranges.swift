// You are given an m x n grid where each cell can have one of three values:
// 0 representing an empty cell,
// 1 representing a fresh orange, or
// 2 representing a rotten orange.
// Every minute, any fresh orange that is 4-directionally 
// adjacent to a rotten orange becomes rotten.
// Return the minimum number of minutes that must elapse until no cell has a fresh orange. 
// If this is impossible, return -1.

// Time: O(m * n), Space: O(m * n)
func orangesRotting(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var visited = Set<String>()
    var queue = [(Int, Int)]()
    var fresh = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 2 {
                visited.insert("\(i),\(j)")
                queue.append((i, j))
            } else if grid[i][j] == 1 {
                fresh += 1
            }
        }
    }

    var result = 0
        
    while !queue.isEmpty, fresh > 0 {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()
            let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

            for (di, dj) in directions {
                let key = "\(di),\(dj)"

                if di < 0 || di >= rows || dj < 0 || dj >= cols { continue }
                if visited.contains(key) || grid[di][dj] == 0 { continue }

                visited.insert(key)
                queue.append((di, dj))
                fresh -= 1
            }
        }

        result += 1
    }

    return fresh == 0 ? result : -1
}

print(orangesRotting([[2,1,1],[0,1,1],[1,0,1]]))
print(orangesRotting([[0,2]]))