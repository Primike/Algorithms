// Given a square matrix mat, return the sum of the matrix diagonals.

// Time: O(n), Space: O(1)
func diagonalSum(_ mat: [[Int]]) -> Int {
    var result = 0

    for i in 0..<mat.count {
        result += mat[i][i] + mat[i][mat.count - i - 1]
    }

    if mat.count % 2 != 0 { result -= mat[(mat.count - 1) / 2][(mat.count - 1) / 2] }
    return result
}

print(diagonalSum([
    [1,2,3],
    [4,5,6],
    [7,8,9]]))
print(diagonalSum([
    [1,1,1,1],
    [1,1,1,1],
    [1,1,1,1],
    [1,1,1,1]]))
print(diagonalSum([[5]]))