class Solution {
    func minCost(_ grid: [[Int]], _ k: Int) -> Int {
        let m = grid.count
        let n = grid[0].count
        let inf = Int.max / 2
        
        var d = [Int: [(Int, Int)]]()
        for i in 0..<m {
            for j in 0..<n {
                d[grid[i][j], default: []].append((i, j))
            }
        }
        
        var dp = Array(repeating: Array(repeating: inf, count: n), count: m)
        dp[0][0] = 0
        
        func update() {
            for i in 0..<m {
                for j in 0..<n {
                    let top = i > 0 ? dp[i - 1][j] : inf
                    let left = j > 0 ? dp[i][j - 1] : inf
                    let temp = grid[i][j] + min(top, left)
                    if temp < dp[i][j] {
                        dp[i][j] = temp
                    }
                }
            }
        }
        
        update()
        
        let keys = d.keys.sorted(by: >)
        
        if k > 0 {
            for _ in 0..<k {
                var dist = inf
                for key in keys {
                    if let points = d[key] {
                        for (i, j) in points {
                            if dp[i][j] < dist {
                                dist = dp[i][j]
                            }
                        }
                        for (i, j) in points {
                            dp[i][j] = dist
                        }
                    }
                }
                update()
            }
        }
        
        return dp[m - 1][n - 1]
    }
}