// You are given a 0-indexed m x n binary matrix land where a 0 
// represents a hectare of forested land and a 1 represents a hectare of farmland.
// Return a 2D array containing the 4-length arrays described above 
// for each group of farmland in land. If there are no groups of farmland, 
// return an empty array. You may return the answer in any order.

// Time: O(m * n), Space: O(m * n)
func findFarmland(_ land: [[Int]]) -> [[Int]] {
    let rows = land.count, cols = land[0].count
    var visited = Set<String>()

    func bfs(_ i: Int, _ j: Int) -> (Int, Int) {
        visited.insert("\(i),\(j)")
        var queue = [(i, j)]
        var last = (i, j)

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let (r, c) = queue.removeFirst()
                let directions = [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
                last = (r, c)

                for (di, dj) in directions {
                    let key = "\(di),\(dj)"

                    if di < 0 || di >= rows || dj < 0 || dj >= cols { continue }
                    if visited.contains(key) || land[di][dj] == 0 { continue }

                    visited.insert(key)
                    queue.append((di, dj))
                }
            }
        }

        return last
    }

    var result = [[Int]]()

    for i in 0..<rows {
        for j in 0..<cols {
            if visited.contains("\(i),\(j)") { continue }       
            if land[i][j] == 0 { continue }

            let (r, c) = bfs(i, j)
            result.append([i, j, r, c])
        }
    }

    return result
}

print(findFarmland([[1,0,0],[0,1,1],[0,1,1]]))
print(findFarmland([[1,1],[1,1]]))
print(findFarmland([[0]]))