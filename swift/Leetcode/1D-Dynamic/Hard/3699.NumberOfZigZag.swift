class Solution {
    func zigZagArrays(_ n: Int, _ l: Int, _ r: Int) -> Int {
        let mod = 1_000_000_007
        let m = r - l + 1
        
        var dp0 = Array(repeating: 1, count: m)
        var dp1 = Array(repeating: 1, count: m)
        
        for _ in 0..<(n - 1) {
            var sum0 = Array(repeating: 0, count: m + 1)
            var sum1 = Array(repeating: 0, count: m + 1)
            
            for i in 0..<m {
                sum0[i + 1] = (sum0[i] + dp0[i]) % mod
                sum1[i + 1] = (sum1[i] + dp1[i]) % mod
            }
            
            var nextDp0 = Array(repeating: 0, count: m)
            var nextDp1 = Array(repeating: 0, count: m)
            
            for i in 0..<m {
                nextDp0[i] = sum1[i] % mod
                nextDp1[i] = (sum0[m] - sum0[i + 1] + mod) % mod
            }
            
            dp0 = nextDp0
            dp1 = nextDp1
        }
        
        var total0 = 0
        var total1 = 0
        for i in 0..<m {
            total0 = (total0 + dp0[i]) % mod
            total1 = (total1 + dp1[i]) % mod
        }
        
        return (total0 + total1) % mod
    }
}