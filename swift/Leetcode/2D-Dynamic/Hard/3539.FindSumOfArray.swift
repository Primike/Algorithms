class Solution {
    private func quickmul(_ x: Int, _ y: Int, _ mod: Int) -> Int {
        var res = 1
        var cur = x % mod
        var y = y
        while y > 0 {
            if y & 1 == 1 {
                res = (res * cur) % mod
            }
            y >>= 1
            cur = (cur * cur) % mod
        }
        return res
    }

    func magicalSum(_ m: Int, _ k: Int, _ nums: [Int]) -> Int {
        let n = nums.count
        let mod = 1_000_000_007

        var fac = [Int](repeating: 1, count: m + 1)
        if m > 0 {
            for i in 1...m {
                fac[i] = (fac[i - 1] * i) % mod
            }
        }

        var ifac = [Int](repeating: 1, count: m + 1)
        if m >= 2 {
            for i in 2...m {
                ifac[i] = quickmul(i, mod - 2, mod)
            }
            for i in 2...m {
                ifac[i] = (ifac[i - 1] * ifac[i]) % mod
            }
        }

        var numsPower = [[Int]](repeating: [Int](repeating: 1, count: m + 1), count: n)
        for i in 0..<n {
            if m > 0 {
                for j in 1...m {
                    numsPower[i][j] = (numsPower[i][j - 1] * nums[i]) % mod
                }
            }
        }

        var f = [[[[Int]]]](
            repeating: [[[Int]]](
                repeating: [[Int]](
                    repeating: [Int](repeating: 0, count: k + 1),
                    count: m * 2 + 1
                ),
                count: m + 1
            ),
            count: n
        )

        for j in 0...m {
            f[0][j][j][0] = (numsPower[0][j] * ifac[j]) % mod
        }

        if n > 1 {
            for i in 0..<(n - 1) {
                for j in 0...m {
                    for p in 0...(m * 2) {
                        for q in 0...k {
                            if f[i][j][p][q] == 0 {
                                continue
                            }
                            let q2 = (p % 2) + q
                            if q2 > k {
                                break
                            }
                            
                            let rLimit = m - j
                            if rLimit >= 0 {
                                for r in 0...rLimit {
                                    let p2 = (p / 2) + r
                                    if p2 > m * 2 {
                                        continue
                                    }
                                    
                                    var term = f[i][j][p][q]
                                    term = (term * numsPower[i + 1][r]) % mod
                                    term = (term * ifac[r]) % mod
                                    
                                    f[i + 1][j + r][p2][q2] = (f[i + 1][j + r][p2][q2] + term) % mod
                                }
                            }
                        }
                    }
                }
            }
        }
        
        var res = 0
        if n > 0 {
            for p in 0...(m * 2) {
                for q in 0...k {
                    if p.nonzeroBitCount + q == k {
                        let term = (f[n - 1][m][p][q] * fac[m]) % mod
                        res = (res + term) % mod
                    }
                }
            }
        }
        
        return res
    }
}