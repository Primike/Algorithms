class Solution {
    private let mod = 1_000_000_007

    private func mul(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
        let n = a.count
        let m = b[0].count
        let kLen = a[0].count
        var res = Array(repeating: Array(repeating: 0, count: m), count: n)

        for i in 0..<n {
            for k in 0..<kLen {
                let r = a[i][k]
                if r == 0 { continue }
                for j in 0..<m {
                    res[i][j] = (res[i][j] + r * b[k][j]) % mod
                }
            }
        }
        return res
    }

    private func powMul(_ base: [[Int]], _ exp: Int, _ res: [[Int]]) -> [[Int]] {
        var base = base
        var exp = exp
        var res = res
        while exp > 0 {
            if (exp & 1) != 0 {
                res = mul(res, base)
            }
            base = mul(base, base)
            exp >>= 1
        }
        return res
    }

    func zigZagArrays(_ n: Int, _ l: Int, _ r: Int) -> Int {
        let m = r - l + 1
        if n == 1 {
            return m
        }

        let size = 2 * m
        var u = Array(repeating: Array(repeating: 0, count: size), count: size)
        for i in 0..<m {
            for j in 0..<i {
                u[i][j + m] = 1
            }
            for j in (i + 1)..<m {
                u[i + m][j] = 1
            }
        }

        var dp = [Array(repeating: 1, count: size)]
        dp = powMul(u, n - 1, dp)
        
        var ans = 0
        for i in 0..<size {
            ans = (ans + dp[0][i]) % mod
        }

        return ans
    }
}