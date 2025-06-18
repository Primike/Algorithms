private final class Math {
    static let MOD = 1_000_000_007
    private static let MX = 100_001
    private static var fact: [Int] = []
    private static var inv_fact: [Int] = []
    private static var initialized = false

    static func initialize() {
        if initialized { return }
        
        fact = Array(repeating: 0, count: MX)
        inv_fact = Array(repeating: 0, count: MX)
        
        fact[0] = 1
        for i in 1..<MX {
            fact[i] = (fact[i - 1] * i) % MOD
        }
        
        inv_fact[MX - 1] = qpow(fact[MX - 1], MOD - 2)
        for i in (1..<MX).reversed() {
            inv_fact[i - 1] = (inv_fact[i] * i) % MOD
        }
        
        initialized = true
    }

    static func qpow(_ x: Int, _ n: Int) -> Int {
        var res = 1
        var x = x
        var n = n
        while n > 0 {
            if n & 1 == 1 {
                res = (res * x) % MOD
            }
            x = (x * x) % MOD
            n >>= 1
        }
        return res
    }

    static func comb(_ n: Int, _ m: Int) -> Int {
        let term1 = (fact[n] * inv_fact[m]) % MOD
        return (term1 * inv_fact[n - m]) % MOD
    }
}

class Solution {
    func countGoodArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        Math.initialize()
        let MOD = Math.MOD
        
        let combinations = Math.comb(n - 1, k)
        let term1 = (combinations * m) % MOD
        let term2 = Math.qpow(m - 1, n - k - 1)
        
        return (term1 * term2) % MOD
    }
}