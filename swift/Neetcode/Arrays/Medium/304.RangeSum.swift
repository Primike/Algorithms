class NumMatrix {

    var prefixSum: [[Int]]

    init(_ matrix: [[Int]]) {
        let rows = matrix.count, cols = matrix[0].count
        prefixSum = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)

        for i in 0..<rows {
            var currentSum = 0

            for j in 0..<cols {
                currentSum += matrix[i][j]
                let above = prefixSum[i][j + 1]
                prefixSum[i + 1][j + 1] = currentSum + above
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let sum2 = prefixSum[row2 + 1][col2 + 1] - prefixSum[row1][col2 + 1]
        let sum1 = prefixSum[row2 + 1][col1] - prefixSum[row1][col1]
        return sum2 - sum1
    }
}