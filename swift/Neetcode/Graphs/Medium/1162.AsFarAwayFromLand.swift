// Given an n x n grid containing only values 0 and 1, where 0 represents water and 1 represents land, 
// find a water cell such that its distance to the nearest land cell is maximized, and 
// return the distance. If no land or water exists in the grid, return -1.

// Time: O(n^2), Space: O(n^2)
func maxDistance(_ grid: [[Int]]) -> Int {
    var n = grid.count
    var visited = Set<String>()
    var queue = [(Int, Int)]()

    for i in 0..<n {
        for j in 0..<n {
            if grid[i][j] == 1 { 
                queue.append((i, j))
                visited.insert("\(i),\(j)") 
            }
        }
    }

    if queue.count == n * n { return -1 }
    var result = -1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()
            let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

            for (di, dj) in directions {
                let key = "\(di),\(dj)"

                if di < 0 || di >= n || dj < 0 || dj >= n { continue }
                if visited.contains(key) { continue }

                visited.insert(key)
                queue.append((di, dj))
            }
        }

        result += 1
    }

    return result
}

print(maxDistance([[1,0,1],[0,0,0],[1,0,1]]))
print(maxDistance([[1,0,0],[0,0,0],[0,0,0]]))