// Given a 2D integer array matrix, return the transpose of matrix.
// The transpose of a matrix is the matrix flipped over its main diagonal, 
// switching the matrix's row and column indices.

// Time: O(m * n), Space: O(m * n)
func transpose(_ matrix: [[Int]]) -> [[Int]] {
    let rows = matrix.count, cols = matrix[0].count
    var result = Array(repeating: Array(repeating: 0, count: rows), count: cols)

    for i in 0..<rows {
        for j in 0..<cols {
            result[j][i] = matrix[i][j]
        }
    }

    return result
}

print(transpose([[1,2,3],[4,5,6],[7,8,9]]))
print(transpose([[1,2,3],[4,5,6]]))