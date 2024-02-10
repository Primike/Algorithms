// Given an m x n integers matrix, return the length 
// of the longest increasing path in matrix.
// From each cell, you can either move in four directions: 
// left, right, up, or down. You may not move diagonally or 
// move outside the boundary (i.e., wrap-around is not allowed).

func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var memo = [String: Int]()

    func dfs(_ i: Int, _ j: Int, _ last: Int) -> Int {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return .min }
        if matrix[i][j] <= last { return 0 }
        if let value = memo[key] { return value }
        
        var result = 0
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

        for (di, dj) in directions {
            result = max(result, dfs(di, dj, matrix[i][j]))
        }

        result += 1
        memo[key] = result
        return result
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            result = max(result, dfs(i, j, .min))
        }
    }

    return result
}

print(longestIncreasingPath([[9,9,4],[6,6,8],[2,1,1]]))
print(longestIncreasingPath([[3,4,5],[3,2,6],[2,2,1]]))
print(longestIncreasingPath([[1]]))