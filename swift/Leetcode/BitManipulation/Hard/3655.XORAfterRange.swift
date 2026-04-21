class Solution {
    private let mod = 1_000_000_007

    func xorAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> Int {
        var nums = nums
        let n = nums.count
        let T = Int(Double(n).squareRoot())
        
        var groups = Array(repeating: [(l: Int, r: Int, v: Int)](), count: T)
        
        for query in queries {
            let l = query[0], r = query[1], k = query[2], v = query[3]
            if k < T {
                groups[k].append((l, r, v))
            } else {
                for i in stride(from: l, through: r, by: k) {
                    nums[i] = (nums[i] * v) % mod
                }
            }
        }
        
        var dif = Array(repeating: 1, count: n + T)
        
        for k in 1..<T {
            if groups[k].isEmpty { continue }
            
            for i in 0..<dif.count { dif[i] = 1 }
            
            for group in groups[k] {
                dif[group.l] = (dif[group.l] * group.v) % mod
                let R = ((group.r - group.l) / k + 1) * k + group.l
                dif[R] = (dif[R] * power(group.v, mod - 2)) % mod
            }
            
            for i in k..<n {
                dif[i] = (dif[i] * dif[i - k]) % mod
            }
            
            for i in 0..<n {
                nums[i] = (nums[i] * dif[i]) % mod
            }
        }
        
        return nums.reduce(0, ^)
    }

    private func power(_ base: Int, _ exp: Int) -> Int {
        var res = 1
        var base = base % mod
        var exp = exp
        while exp > 0 {
            if exp % 2 == 1 { res = (res * base) % mod }
            base = (base * base) % mod
            exp /= 2
        }
        return res
    }
}