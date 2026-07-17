class Solution {
    private let mod = 1_000_000_007
    private static let maxN = 100_001
    private static var pow10: [Int] = {
        var array = Array(repeating: 1, count: maxN)
        for i in 1..<maxN {
            array[i] = (array[i - 1] * 10) % 1_000_000_007
        }
        return array
    }()

    func sumAndMultiply(_ s: String, _ queries: [[Int]]) -> [Int] {
        let n = s.count
        let sChars = Array(s)
        
        var sum = Array(repeating: 0, count: n + 1)
        var x = Array(repeating: 0, count: n + 1)
        var cnt = Array(repeating: 0, count: n + 1)
        
        for i in 0..<n {
            let d = Int(String(sChars[i])) ?? 0
            sum[i + 1] = sum[i] + d
            x[i + 1] = d > 0 ? (x[i] * 10 + d) % mod : x[i]
            cnt[i + 1] = cnt[i] + (d > 0 ? 1 : 0)
        }
        
        let m = queries.count
        var res = Array(repeating: 0, count: m)
        
        for i in 0..<m {
            let l = queries[i][0]
            let r = queries[i][1] + 1
            
            let length = cnt[r] - cnt[l]
            let partX = (x[r] - (x[l] * Solution.pow10[length]) % mod + mod) % mod
            let partSum = sum[r] - sum[l]
            
            res[i] = (partX * partSum) % mod
        }
        
        return res
    }
}