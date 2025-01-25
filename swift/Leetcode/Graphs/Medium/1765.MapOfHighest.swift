// If isWater[i][j] == 0, cell (i, j) is a land cell.
// If isWater[i][j] == 1, cell (i, j) is a water cell.
// You must assign each cell a height in a way that follows these rules:
// The height of each cell must be non-negative.
// If the cell is a water cell, its height must be 0.
// Any two adjacent cells must have an absolute height difference of at most 1. 
// A cell is adjacent to another cell if the former is directly
// north, east, south, or west of the latter (i.e., their sides are touching).
// Find an assignment of heights such that the maximum height in the matrix is maximized.

// Time: O(m * n), Space: O(m * n)
func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
    var isWater = isWater
    let rows = isWater.count, cols = isWater[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var queue = [(Int, Int)]()

    for i in 0..<rows {
        for j in 0..<cols {
            if isWater[i][j] == 1 {
                queue.append((i, j))
                isWater[i][j] = 0
            } else {
                isWater[i][j] = -1
            }
        }
    }

    var queueIndex = 0
    var height = 1

    while queueIndex < queue.count {
        for _ in 0..<(queue.count - queueIndex) {
            let (i, j) = queue[queueIndex]
            queueIndex += 1

            for (di, dj) in directions {
                let r = i + di, c = j + dj

                if r < 0 || r >= rows || c < 0 || c >= cols { continue }
                if isWater[r][c] != -1 { continue }

                isWater[r][c] = height
                queue.append((r, c))
            }
        }

        height += 1
    }

    return isWater
}

print(highestPeak([[0,1],[0,0]]))
print(highestPeak([[0,0,1],[1,0,0],[0,0,0]]))