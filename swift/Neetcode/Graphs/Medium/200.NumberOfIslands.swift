// Given an m x n 2D binary grid grid which represents a map of 
// '1's (land) and '0's (water), return the number of islands.

func numIslands(_ grid: [[Character]]) -> Int {
    if grid.isEmpty { return 0 }

    var visited = Set<String>()
    var result = 0

    func bfs(_ i: Int, _ j: Int) {
        let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        var queue = [(Int, Int)]()

        visited.insert("\(i),\(j)")
        queue.append((i, j))

        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()

            for direction in directions {
                let x = row + direction[0], y = col + direction[1]

                if x >= 0, x < grid.count, y >= 0, y < grid[0].count, grid[x][y] == "1", !visited.contains("\(x),\(y)") {
                    queue.append((x, y))
                    visited.insert("\(x),\(y)")
                }
            }
        }
    }

    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] == "1", !visited.contains("\(i),\(j)") {
                bfs(i, j)
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