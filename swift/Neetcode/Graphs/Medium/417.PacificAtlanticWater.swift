// There is an m x n rectangular island that borders both the 
// Pacific Ocean and Atlantic Ocean. The Pacific Ocean 
// touches the island's left and top edges, 
// and the Atlantic Ocean touches the island's right and bottom edges.

// Time: O(n * m), Space: O(2 * n * m)
func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let rows = heights.count, cols = heights[0].count
    var pacific = Set<String>(), atlantic = Set<String>()

    func dfs(_ i: Int, _ j: Int, _ last: Int, _ ocean: inout Set<String>) {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return }
        if last > heights[i][j] || ocean.contains(key) { return }

        ocean.insert(key)
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

        for (di, dj) in directions {
            dfs(di, dj, heights[i][j], &ocean)
        }
    }

    for i in 0..<cols {
        dfs(0, i, -1, &pacific)
        dfs(rows - 1, i, -1, &atlantic)
    }
            
    for i in 0..<rows {
        dfs(i, 0, -1, &pacific)
        dfs(i, cols - 1, -1, &atlantic)
    }

    var result = [[Int]]()

    for i in 0..<rows {
        for j in 0..<cols {
            let key = "\(i),\(j)"
            
            if pacific.contains(key), atlantic.contains(key) {
                result.append([i, j])
            }
        }
    }

    return result
}

print(pacificAtlantic([
    [1,2,2,3,5],
    [3,2,3,4,4],
    [2,4,5,3,1],
    [6,7,1,4,5],
    [5,1,1,2,4]]))

print(pacificAtlantic([[1]]))