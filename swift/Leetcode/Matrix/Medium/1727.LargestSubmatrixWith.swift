// You are given a binary matrix matrix of size m x n, 
// and you are allowed to rearrange the columns of the matrix in any order.
// Return the area of the largest submatrix within matrix 
// where every element of the submatrix is 1 after reordering the columns optimally.

// Time: O(m * n * log(n)), Space: O(m * n)
func largestSubmatrix(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var matrix = matrix

    for i in 1..<rows {
        for j in 0..<cols {
            if matrix[i][j] == 0 { continue }
            matrix[i][j] += matrix[i - 1][j]
        }
    }

    for i in 0..<rows {
        matrix[i] = matrix[i].sorted { $0 > $1 }
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            result = max(result, matrix[i][j] * (j + 1))
        }
    }

    return result
}

print(largestSubmatrix([[0,0,1],[1,1,1],[1,0,1]]))
print(largestSubmatrix([[1,0,1,0,1]]))
print(largestSubmatrix([[1,1,0],[1,0,1]]))