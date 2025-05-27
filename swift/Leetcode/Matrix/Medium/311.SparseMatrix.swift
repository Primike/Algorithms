// Given two sparse matrices mat1 of size m x k and mat2 
// of size k x n, return the result of mat1 x mat2. 
// You may assume that multiplication is always possible.

// Time: O(m * n * c), Space: O(m * n)
func multiply(_ mat1: [[Int]], _ mat2: [[Int]]) -> [[Int]] {
    let rows1 = mat1.count, cols1 = mat1[0].count
    let rows2 = mat2.count, cols2 = mat2[0].count
    var mat2Cols = Array(repeating: [Int: Int](), count: cols2)

    for i in 0..<rows2 {
        for j in 0..<cols2 {
            if mat2[i][j] != 0 { mat2Cols[j][i] = mat2[i][j] }
        }
    }       

    var mat1Rows = Array(repeating: [Int: Int](), count: rows1)

    for i in 0..<rows1 {
        for j in 0..<cols1 {
            if mat1[i][j] != 0 { mat1Rows[i][j] = mat1[i][j] }
        }
    } 

    var result = Array(repeating: Array(repeating: 0, count: cols2), count: rows1)

    for i in 0..<rows1 {
        for j in 0..<cols2 {
            var current = 0

            for (k, mat1Value) in mat1Rows[i] {
                if let mat2Value = mat2Cols[j][k] {
                    current += mat1Value * mat2Value
                }
            }

            result[i][j] = current
        }
    }

    return result
}

print(multiply([[1,0,0],[-1,0,3]], [[7,0,0],[0,0,0],[0,0,1]]))
print(multiply([[0]], [[0]]))


func multiply2(_ mat1: [[Int]], _ mat2: [[Int]]) -> [[Int]] {
    let rows = mat1.count, cols1 = mat1[0].count, cols2 = mat2[0].count
    var result = Array(repeating: Array(repeating: 0, count: cols2), count: rows)
    
    for i in 0..<rows {
        for j in 0..<cols2 {
            var current = 0

            for k in 0..<cols1 {
                current += mat1[i][k] * mat2[k][j]
            }

            result[i][j] = current
        }
    }

    return result
}