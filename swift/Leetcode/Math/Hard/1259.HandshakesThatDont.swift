class Solution {
    func numberOfWays(_ numPeople: Int) -> Int {
        let m = 1_000_000_007
        let n = numPeople / 2
        
        var inv = Array(repeating: 0, count: n + 2)
        if n + 2 > 1 {
            inv[1] = 1
        }
        
        if n >= 0 {
            for i in stride(from: 2, to: n + 2, by: 1) {
                let k = m / i
                let r = m % i
                inv[i] = m - (k * inv[r]) % m
            }
        }
        
        var C = 1
        for i in 0..<n {
            C = (2 * (2 * i + 1) % m) * inv[i + 2] % m * C % m
        }
        
        return C
    }
}