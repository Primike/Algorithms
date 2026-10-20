class NumMatrix {
    private var rows: Int = 0
    private var cols: Int = 0
    private var bit: [[Int]] = []
    
    private func lsb(_ n: Int) -> Int {
        return n & (-n)
    }
    
    private func updateBIT(_ r: Int, _ c: Int, _ val: Int) {
        var i = r
        while i <= rows {
            var j = c
            while j <= cols {
                bit[i][j] += val
                j += lsb(j)
            }
            i += lsb(i)
        }
    }
    
    private func queryBIT(_ r: Int, _ c: Int) -> Int {
        var sum = 0
        var i = r
        while i > 0 {
            var j = c
            while j > 0 {
                sum += bit[i][j]
                j -= lsb(j)
            }
            i -= lsb(i)
        }
        return sum
    }
    
    private func buildBIT(_ matrix: [[Int]]) {
        for i in 1...rows {
            for j in 1...cols {
                let val = matrix[i - 1][j - 1]
                updateBIT(i, j, val)
            }
        }
    }
    
    init(_ matrix: [[Int]]) {
        rows = matrix.count
        if rows == 0 { return }
        cols = matrix[0].count
        bit = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
        buildBIT(matrix)
    }
    
    func update(_ row: Int, _ col: Int, _ val: Int) {
        let oldVal = sumRegion(row, col, row, col)
        let r = row + 1
        let c = col + 1
        let diff = val - oldVal
        updateBIT(r, c, diff)
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let r1 = row1 + 1
        let c1 = col1 + 1
        let r2 = row2 + 1
        let c2 = col2 + 1
        
        let a = queryBIT(r2, c2)
        let b = queryBIT(r1 - 1, c1 - 1)
        let c = queryBIT(r2, c1 - 1)
        let d = queryBIT(r1 - 1, c2)
        
        return (a + b) - (c + d)
    }
}