// Given a matrix and a target, return the number of 
// non-empty submatrices that sum to target.
// A submatrix x1, y1, x2, y2 is the set of all cells matrix[x][y] 
// with x1 <= x <= x2 and y1 <= y <= y2.
// Two submatrices (x1, y1, x2, y2) and (x1', y1', x2', y2') are different 
// if they have some coordinate that is different: for example, if x1 != x1'.

func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var prefixRows = matrix

    for i in 0..<rows {
        for j in 1..<cols {
            prefixRows[i][j] += prefixRows[i][j - 1]
        }
    }

    var result = 0

    for left in 0..<cols {
        for right in left..<cols {
            var prefixCol = [0: 1]
            var current = 0

            for r in 0..<rows {
                current += prefixRows[r][right] 
                current -= left > 0 ? prefixRows[r][left - 1] : 0

                if let sum = prefixCol[current - target] { result += sum }
                prefixCol[current, default: 0] += 1
            }
        }
    }

    return result
}

print(numSubmatrixSumTarget([[0,1,0],[1,1,1],[0,1,0]], 0))
print(numSubmatrixSumTarget([[1,-1],[-1,1]], 0))
print(numSubmatrixSumTarget([[904]], 0))