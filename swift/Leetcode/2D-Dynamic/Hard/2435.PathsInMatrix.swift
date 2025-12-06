class Solution {
    func numberOfPaths(_ grid: [[Int]], _ k: Int) -> Int {
        let MOD = 1_000_000_007
        let m = grid.count
        let n = grid[0].count

        var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: k), count: n + 1), count: m + 1)

        for i in 1...m {
            for j in 1...n {
                if i == 1 && j == 1 {
                    dp[i][j][grid[0][0] % k] = 1
                    continue
                }

                let value = grid[i - 1][j - 1] % k
                for r in 0..<k {
                    let prevMod = (r - value + k) % k
                    dp[i][j][r] = (dp[i - 1][j][prevMod] + dp[i][j - 1][prevMod]) % MOD
                }
            }
        }

        return dp[m][n][0]
    }
}