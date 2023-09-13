// Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. 
// If there is no clear path, return -1.

func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    if grid[0][0] == 1 { return -1 }

    var rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (-1, -1), (-1, 1), (1, 1), (1, -1)] 
    var queue = [(0, 0)]
    var visited: Set<String> = ["0,0"]
    var count = 1
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()

            if (i, j) == (rows - 1, cols - 1) { return count }

            for (di, dj) in directions {
                var x = i + di, y = j + dj

                if x < 0 || x >= rows || y < 0 || y >= cols || visited.contains("\(x),\(y)") || grid[x][y] == 1 {
                    continue
                }

                visited.insert("\(x),\(y)")
                queue.append((x, y))
            }
        }

        count += 1
    }

    return -1
}

print(shortestPathBinaryMatrix([[0,1],[1,0]]))
print(shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]]))
print(shortestPathBinaryMatrix([[1,0,0],[1,1,0],[1,1,0]]))