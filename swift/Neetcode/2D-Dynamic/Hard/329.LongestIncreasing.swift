// Given an m x n integers matrix, return the length 
// of the longest increasing path in matrix.
// From each cell, you can either move in four directions: 
// left, right, up, or down. You may not move diagonally or 
// move outside the boundary (i.e., wrap-around is not allowed).

// Time: O(m * n), Space: O(m * n)
func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var memo = [[Int]: Int]()

    func dfs(_ i: Int, _ j: Int) -> Int {
        if let value = memo[[i, j]] { return value }

        var maximum = 0

        for (di, dj) in directions {
            let r = i + di, c = j + dj

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if matrix[r][c] >= matrix[i][j] { continue }

            maximum = max(maximum, dfs(r, c))
        }

        maximum += 1
        memo[[i, j]] = maximum
        return maximum
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            result = max(result, dfs(i, j))
        }
    }

    return result
}

print(longestIncreasingPath([[9,9,4],[6,6,8],[2,1,1]]))
print(longestIncreasingPath([[3,4,5],[3,2,6],[2,2,1]]))
print(longestIncreasingPath([[1]]))