// Given an n x n grid containing only values 0 and 1, where 0 represents water and 1 represents land, 
// find a water cell such that its distance to the nearest land cell is maximized, and 
// return the distance. If no land or water exists in the grid, return -1.

func maxDistance(_ grid: [[Int]]) -> Int {
    var rows = grid.count, cols = grid[0].count
    var visited = Set<String>()
    var queue = [(Int, Int)]()

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1 { 
                queue.append((i, j))
                visited.insert("\(i),\(j)") 
            }
        }
    }

    if queue.count == rows * cols { return -1 }
    var count = -1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()
            let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

            for (di, dj) in directions {
                let x = i + di, y = j + dj

                if x < 0 || x >= rows || y < 0 || y >= cols || visited.contains("\(x),\(y)") {
                    continue
                }

                queue.append((x, y))
                visited.insert("\(x),\(y)")
            }
        }

        count += 1
    }

    return count
}

print(maxDistance([[1,0,1],[0,0,0],[1,0,1]]))
print(maxDistance([[1,0,0],[0,0,0],[0,0,0]]))