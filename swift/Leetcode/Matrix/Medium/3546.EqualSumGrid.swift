class Solution {
    func canPartitionGrid(_ grid: [[Int]]) -> Bool {
        let m = grid.count
        let n = grid[0].count
        var total = 0
        
        for row in grid {
            for val in row {
                total += val
            }
        }
        
        if total % 2 != 0 {
            return false
        }
        
        let target = total / 2
        var currentSum = 0
        
        for i in 0..<(m - 1) {
            for j in 0..<n {
                currentSum += grid[i][j]
            }
            if currentSum == target {
                return true
            }
        }
        
        currentSum = 0
        
        for j in 0..<(n - 1) {
            for i in 0..<m {
                currentSum += grid[i][j]
            }
            if currentSum == target {
                return true
            }
        }
        
        return false
    }
}