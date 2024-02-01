// Given an m x n integer matrix matrix, if an element is 0, 
// set its entire row and column to 0's.
// You must do it in place.

// Time: O(m * n), Space: O(1)
func setZeroes(_ matrix: inout [[Int]]) {
    let rows = matrix.count, cols = matrix[0].count
    var row1Zero = false, col1Zero = false

    for j in 0..<cols {
        if matrix[0][j] == 0 {
            row1Zero = true
            break
        }
    }

    for i in 0..<rows {
        if matrix[i][0] == 0 {
            col1Zero = true
            break
        }
    }

    for i in 1..<rows {
        for j in 1..<cols {
            if matrix[i][j] == 0 {
                matrix[0][j] = 0
                matrix[i][0] = 0
            }
        }
    }

    for i in 1..<rows {
        for j in 1..<cols {
            if matrix[0][j] == 0 || matrix[i][0] == 0 {
                matrix[i][j] = 0
            }
        }
    }

    if row1Zero {
        for j in 0..<cols {
            matrix[0][j] = 0
        }
    }

    if col1Zero {
        for i in 0..<rows {
            matrix[i][0] = 0
        }
    }
}

print(setZeroes([[1,1,1],[1,0,1],[1,1,1]]))
print(setZeroes([[0,1,2,0],[3,4,5,2],[1,3,1,5]]))