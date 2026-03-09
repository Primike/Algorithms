// Given an m x n binary matrix mat, return the number 
// of special positions in mat.
// A position (i, j) is called special if mat[i][j] == 1 
// and all other elements in row i and column j are 0 
// (rows and columns are 0-indexed).

// Time: O(m * n), Space: O(m * n)
func numSpecial(_ mat: [[Int]]) -> Int {
    let rows = mat.count, cols = mat[0].count
    var rowDict = [Int: Int]()
    var colDict = [Int: Int]()

    for i in 0..<rows {
        for j in 0..<cols {
            if mat[i][j] == 0 {
                rowDict[i, default: 0] += 1
                colDict[j, default: 0] += 1
            }
        }
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if mat[i][j] == 1, rowDict[i] == cols - 1, colDict[j] == rows - 1 {
                result += 1
            }
        }
    }

    return result
}

print(numSpecial([[1,0,0],[0,0,1],[1,0,0]]))
print(numSpecial([[1,0,0],[0,1,0],[0,0,1]]))