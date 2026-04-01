class Solution {
    func countSubmatrices(_ grid: [[Int]], _ k: Int) -> Int {
        var grid = grid
        let r = grid.count
        let c = grid[0].count
        var cnt = 0
        var brCol = c
        
        if grid[0][0] > k {
            return 0
        }
        
        cnt += 1
        
        for j in 1..<c {
            grid[0][j] += grid[0][j - 1]
            if grid[0][j] > k {
                brCol = j
                break
            }
            cnt += 1
        }
        
        if r > 1 {
            for i in 1..<r {
                grid[i][0] += grid[i - 1][0]
                if grid[i][0] > k {
                    break
                }
                cnt += 1
                
                for j in 1..<brCol {
                    grid[i][j] += grid[i - 1][j] + grid[i][j - 1] - grid[i - 1][j - 1]
                    if grid[i][j] > k {
                        brCol = j
                        break
                    }
                    cnt += 1
                }
            }
        }
        
        return cnt
    }
}