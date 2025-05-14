class Solution {
    func multiply(_ mat1: [[Int]], _ mat2: [[Int]]) -> [[Int]] {

        func compressMatrix(_ matrix: [[Int]]) -> [[(value: Int, col: Int)]] {
            guard !matrix.isEmpty, let firstRow = matrix.first, !firstRow.isEmpty else {
                return []
            }
            let rows = matrix.count
            let cols = firstRow.count
            var compressedMatrix: [[(value: Int, col: Int)]] = Array(repeating: [], count: rows)

            for row in 0..<rows {
                for col in 0..<cols {
                    if matrix[row][col] != 0 {
                        compressedMatrix[row].append((value: matrix[row][col], col: col))
                    }
                }
            }
            return compressedMatrix
        }

        guard !mat1.isEmpty, let mat1FirstRow = mat1.first, !mat1FirstRow.isEmpty,
              !mat2.isEmpty, let mat2FirstRow = mat2.first, !mat2FirstRow.isEmpty,
              mat1FirstRow.count == mat2.count else {
            return []
        }

        let m = mat1.count
        let n = mat2FirstRow.count
        
        let compressedA = compressMatrix(mat1)
        let compressedB = compressMatrix(mat2)

        var ans = Array(repeating: Array(repeating: 0, count: n), count: m)

        for mat1RowIndex in 0..<m {
            for (element1, mat1ColIndex) in compressedA[mat1RowIndex] {
                guard mat1ColIndex < compressedB.count else { continue }
                
                for (element2, mat2ColIndex) in compressedB[mat1ColIndex] {
                    ans[mat1RowIndex][mat2ColIndex] += element1 * element2
                }
            }
        }

        return ans
    }
}