class Solution {
    func numberOfSubmatrices(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var sumX = Array(repeating: 0, count: cols)
        var sumY = Array(repeating: 0, count: cols)
        var res = 0

        for i in 0..<rows {
            var rx = 0
            var ry = 0
            for j in 0..<cols {
                let char = grid[i][j]
                if char == "X" {
                    rx += 1
                } else if char == "Y" {
                    ry += 1
                }
                
                sumX[j] += rx
                sumY[j] += ry
                
                if sumX[j] > 0 && sumX[j] == sumY[j] {
                    res += 1
                }
            }
        }

        return res
    }
}