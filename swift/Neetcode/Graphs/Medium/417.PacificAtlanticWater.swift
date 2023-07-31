// There is an m x n rectangular island that borders both the 
// Pacific Ocean and Atlantic Ocean. The Pacific Ocean 
// touches the island's left and top edges, 
// and the Atlantic Ocean touches the island's right and bottom edges.

func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let rows = heights.count, cols = heights[0].count
    var pacific = Set<String>(), atlantic = Set<String>()

    func dfs(_ i: Int, _ j: Int, _ visited: inout Set<String>, _ prevHeight: Int) {
        if i < 0 || j < 0 || i >= rows || j >= cols || visited.contains("\(i),\(j)") || heights[i][j] < prevHeight {
            return
        }

        visited.insert("\(i),\(j)")
        dfs(i + 1, j, &visited, heights[i][j])
        dfs(i - 1, j, &visited, heights[i][j])
        dfs(i, j + 1, &visited, heights[i][j])
        dfs(i, j - 1, &visited, heights[i][j])
    }

    for i in 0..<rows {
        dfs(i, 0, &pacific, heights[i][0])
        dfs(i, cols - 1, &atlantic, heights[i][cols - 1])
    }

    for j in 0..<cols {
        dfs(0, j, &pacific, heights[0][j])
        dfs(rows - 1, j, &atlantic, heights[rows - 1][j])
    }

    var result = [[Int]]()

    for i in 0..<rows {
        for j in 0..<cols {
            if pacific.contains("\(i),\(j)") && atlantic.contains("\(i),\(j)") {
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