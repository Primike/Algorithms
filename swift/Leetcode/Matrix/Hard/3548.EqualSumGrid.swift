class Solution {
    func canPartitionGrid(_ grid: [[Int]]) -> Bool {
        var currentGrid = grid
        var total = 0
        for i in 0..<currentGrid.count {
            for j in 0..<currentGrid[0].count {
                total += currentGrid[i][j]
            }
        }
        
        for _ in 0..<4 {
            var exist = Set<Int>()
            exist.insert(0)
            var sumVal = 0
            let m = currentGrid.count
            let n = currentGrid[0].count
            
            if m < 2 {
                currentGrid = rotation(currentGrid)
                continue
            }
            
            if n == 1 {
                for i in 0..<(m - 1) {
                    sumVal += currentGrid[i][0]
                    let tag = sumVal * 2 - total
                    if tag == 0 || tag == currentGrid[0][0] || tag == currentGrid[i][0] {
                        return true
                    }
                }
                currentGrid = rotation(currentGrid)
                continue
            }
            
            for i in 0..<(m - 1) {
                for j in 0..<n {
                    exist.insert(currentGrid[i][j])
                    sumVal += currentGrid[i][j]
                }
                
                let tag = sumVal * 2 - total
                if i == 0 {
                    if tag == 0 || tag == currentGrid[0][0] || tag == currentGrid[0][n - 1] {
                        return true
                    }
                    continue
                }
                
                if exist.contains(tag) {
                    return true
                }
            }
            currentGrid = rotation(currentGrid)
        }
        
        return false
    }

    private func rotation(_ grid: [[Int]]) -> [[Int]] {
        let m = grid.count
        let n = grid[0].count
        var tmp = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<m {
            for j in 0..<n {
                tmp[j][m - 1 - i] = grid[i][j]
            }
        }
        return tmp
    }
}