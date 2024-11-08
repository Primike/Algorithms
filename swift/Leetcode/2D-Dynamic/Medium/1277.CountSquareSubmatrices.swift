// Given a m * n matrix of ones and zeros, 
// return how many square submatrices have all ones.

// Time: O(m * n), Space: O(m * n)
func countSquares(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var matrix = matrix
    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if matrix[i][j] != 1 { continue }

            if i > 0, j > 0 {
                matrix[i][j] = min(matrix[i - 1][j], matrix[i][j - 1], matrix[i - 1][j - 1]) + 1
            }

            result += matrix[i][j]
        }
    }
    
    return result
}

print(countSquares([
  [0,1,1,1],
  [1,1,1,1],
  [0,1,1,1]
]))
print(countSquares([
  [1,0,1],
  [1,1,0],
  [1,1,0]
]))