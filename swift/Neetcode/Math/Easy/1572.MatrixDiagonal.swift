// Given a square matrix mat, return the sum of the matrix diagonals.

func diagonalSum(_ mat: [[Int]]) -> Int {
    var result = 0

    for i in 0..<mat.count {
        result += mat[i][i] 
        
        if i != mat.count - 1 - i {
            result += mat[i][mat.count - 1 - i]
        }
    }

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