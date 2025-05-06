class Solution {
    func numTilings(_ n: Int) -> Int {
        let MOD = 1000000007

        if n <= 2 {
            return n
        }

        var f = Array(repeating: 0, count: n + 1)
        var p = Array(repeating: 0, count: n + 1)

        f[1] = 1
        f[2] = 2
        p[2] = 1

        for k in 3...n {
            f[k] = (f[k - 1] + f[k - 2] + 2 * p[k - 1]) % MOD
            p[k] = (p[k - 1] + f[k - 2]) % MOD
        }
        
        return f[n]
    }
}