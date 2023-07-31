// You are given an m x n grid where each cell can have one of three values:
// 0 representing an empty cell,
// 1 representing a fresh orange, or
// 2 representing a rotten orange.
// Every minute, any fresh orange that is 4-directionally 
// adjacent to a rotten orange becomes rotten.
// Return the minimum number of minutes that must elapse until no cell has a fresh orange. 
// If this is impossible, return -1.

func orangesRotting(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rows = grid.count, cols = grid[0].count
    var queue = [(Int, Int)]()
    var time = 0, fresh = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1 {
                fresh += 1
            } else if grid[i][j] == 2 {
                queue.append((i, j))
            }
        }
    }

    let directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]

    while !queue.isEmpty, fresh > 0 {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()

            for direction in directions {
                let row = i + direction[0], col = j + direction[1]

                if (row < 0 || row == rows) || (col < 0 || col == cols) || grid[row][col] != 1 {
                    continue
                }

                grid[row][col] = 2
                queue.append((row, col))
                fresh -= 1
            }
        }

        time += 1
    }

    return fresh == 0 ? time : -1
}

print(orangesRotting([[2,1,1],[0,1,1],[1,0,1]]))
print(orangesRotting([[0,2]]))