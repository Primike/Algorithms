class Solution {
    func minimumArea(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        var minI = n
        var maxI = -1
        var minJ = m
        var maxJ = -1

        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == 1 {
                    minI = min(minI, i)
                    maxI = max(maxI, i)
                    minJ = min(minJ, j)
                    maxJ = max(maxJ, j)
                }
            }
        }
        
        guard maxI != -1 else {
            return 0
        }

        return (maxI - minI + 1) * (maxJ - minJ + 1)
    }
}