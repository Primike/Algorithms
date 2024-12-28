// You are given an m x n binary matrix matrix.
// You can choose any number of columns in the matrix 
// and flip every cell in that column 
// (i.e., Change the value of the cell from 0 to 1 or vice versa).
// Return the maximum number of rows that have all 
// values equal after some number of flips.

// Time: O(n * m), Space: O(n * m)
func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
    var dict = [String: Int]()

    for row in matrix {
        let pattern = row.map { $0 == row[0] ? "T" : "F" }.joined()
        dict[pattern, default: 0] += 1
    }

    return dict.values.max() ?? 0
}

print(maxEqualRowsAfterFlips([[0,1],[1,1]]))
print(maxEqualRowsAfterFlips([[0,1],[1,0]]))
print(maxEqualRowsAfterFlips([[0,0,0],[0,0,1],[1,1,0]]))