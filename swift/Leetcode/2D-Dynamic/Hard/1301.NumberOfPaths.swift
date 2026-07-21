class Solution {
    func pathsWithMaxScore(_ board: [String]) -> [Int] {
        let n = board.count
        let mod = 1_000_000_007
        
        let grid = board.map { Array($0) }
        
        var dp = Array(repeating: Array(repeating: [-1, 0], count: n), count: n)
        dp[n - 1][n - 1] = [0, 1]
        
        func update(_ x: Int, _ y: Int, _ u: Int, _ v: Int) {
            if u >= n || v >= n || dp[u][v][0] == -1 {
                return
            }
            if dp[u][v][0] > dp[x][y][0] {
                dp[x][y] = dp[u][v]
            } else if dp[u][v][0] == dp[x][y][0] {
                dp[x][y][1] = (dp[x][y][1] + dp[u][v][1]) % mod
            }
        }
        
        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                if i == n - 1 && j == n - 1 { continue }
                if grid[i][j] == "X" { continue }
                
                update(i, j, i + 1, j)
                update(i, j, i, j + 1)
                update(i, j, i + 1, j + 1)
                
                if dp[i][j][0] != -1 {
                    let charValue: Int
                    if grid[i][j] == "E" {
                        charValue = 0
                    } else {
                        charValue = Int(grid[i][j].asciiValue! - 48)
                    }
                    dp[i][j][0] += charValue
                }
            }
        }
        
        if dp[0][0][0] == -1 {
            return [0, 0]
        } else {
            return [dp[0][0][0], dp[0][0][1] % mod]
        }
    }
}