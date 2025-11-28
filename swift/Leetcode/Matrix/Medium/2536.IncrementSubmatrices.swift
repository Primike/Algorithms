class Solution {
    func rangeAddQueries(_ n: Int, _ queries: [[Int]]) -> [[Int]] {
        var diff = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        
        for query in queries {
            let row1 = query[0]
            let col1 = query[1]
            let row2 = query[2]
            let col3 = query[3]
            
            diff[row1][col1] += 1
            diff[row2 + 1][col1] -= 1
            diff[row1][col3 + 1] -= 1
            diff[row2 + 1][col3 + 1] += 1
        }

        var mat = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for i in 0..<n {
            for j in 0..<n {
                let x1 = (i == 0) ? 0 : mat[i - 1][j]
                let x2 = (j == 0) ? 0 : mat[i][j - 1]
                let x3 = (i == 0 || j == 0) ? 0 : mat[i - 1][j - 1]
                mat[i][j] = diff[i][j] + x1 + x2 - x3
            }
        }
        
        return mat
    }
}