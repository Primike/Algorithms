class Solution {
    func constructProductMatrix(_ grid: [[Int]]) -> [[Int]] {
        let MOD = 12345
        let n = grid.count
        let m = grid[0].count
        var p = Array(repeating: Array(repeating: 0, count: m), count: n)

        var suffix = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in stride(from: m - 1, through: 0, by: -1) {
                p[i][j] = suffix
                suffix = (suffix * (grid[i][j] % MOD)) % MOD
            }
        }

        var prefix = 1
        for i in 0..<n {
            for j in 0..<m {
                p[i][j] = (p[i][j] * prefix) % MOD
                prefix = (prefix * (grid[i][j] % MOD)) % MOD
            }
        }

        return p
    }
}