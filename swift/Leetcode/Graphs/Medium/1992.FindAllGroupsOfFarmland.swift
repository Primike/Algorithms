// You are given a 0-indexed m x n binary matrix land where a 0 
// represents a hectare of forested land and a 1 represents a hectare of farmland.
// Return a 2D array containing the 4-length arrays described above 
// for each group of farmland in land. If there are no groups of farmland, 
// return an empty array. You may return the answer in any order.

// Time: O(m * n), Space: O(m * n)
func findFarmland(_ land: [[Int]]) -> [[Int]] {
    var land = land
    let rows = land.count, cols = land[0].count 
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var result = [[Int]]()

    for i in 0..<rows {
        for j in 0..<cols {
            if land[i][j] == 0 { continue }

            land[i][j] = 0
            var queue = [(i, j)]
            var r = Int.min, c = Int.min

            while !queue.isEmpty {
                let first = queue.removeFirst()
                r = max(r, first.0)
                c = max(c, first.1)

                for (di, dj) in directions {
                    let x = first.0 + di, y = first.1 + dj

                    if x < 0 || x >= rows || y < 0 || y >= cols { continue }
                    if land[x][y] == 0 { continue }

                    queue.append((x, y))
                    land[x][y] = 0
                }
            }

            result.append([i, j, r, c])
        }
    }

    return result
}

print(findFarmland([[1,0,0],[0,1,1],[0,1,1]]))
print(findFarmland([[1,1],[1,1]]))
print(findFarmland([[0]]))