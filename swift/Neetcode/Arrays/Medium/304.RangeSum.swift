class NumMatrix {

    var sumMatrix: [[Int]]

    init(_ matrix: [[Int]]) {
        self.sumMatrix = matrix

        for i in 0..<matrix.count {
            var prefixSum = 0
            
            for j in 0..<matrix[0].count {
                prefixSum += matrix[i][j]
                sumMatrix[i][j] = prefixSum

                if i > 0 { sumMatrix[i][j] += sumMatrix[i - 1][j] }
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var result = sumMatrix[row2][col2]
        
        if row1 > 0 { result -= sumMatrix[row1 - 1][col2] }
        if col1 > 0 { result -= sumMatrix[row2][col1 - 1] }
        if row1 > 0, col1 > 0 { result += sumMatrix[row1 - 1][col1 - 1] }

        return result
    }
}