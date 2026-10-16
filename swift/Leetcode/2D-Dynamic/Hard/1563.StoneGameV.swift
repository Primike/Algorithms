class Solution {
    func stoneGameV(_ stoneValue: [Int]) -> Int {
        let n = stoneValue.count
        if n <= 1 { return 0 }
        
        var f = Array(repeating: Array(repeating: 0, count: n), count: n)
        var maxl = Array(repeating: Array(repeating: 0, count: n), count: n)
        var maxr = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for left in stride(from: n - 1, through: 0, by: -1) {
            maxl[left][left] = stoneValue[left]
            maxr[left][left] = stoneValue[left]
            var total = stoneValue[left]
            var suml = 0
            var i = left - 1
            
            for right in (left + 1)..<n {
                total += stoneValue[right]
                
                while i + 1 < right && (suml + stoneValue[i + 1]) * 2 <= total {
                    suml += stoneValue[i + 1]
                    i += 1
                }
                
                if left <= i {
                    f[left][right] = max(f[left][right], maxl[left][i])
                }
                if i + 1 < right {
                    f[left][right] = max(f[left][right], maxr[i + 2][right])
                }
                if suml * 2 == total {
                    f[left][right] = max(f[left][right], maxr[i + 1][right])
                }
                
                maxl[left][right] = max(maxl[left][right - 1], total + f[left][right])
                maxr[left][right] = max(maxr[left + 1][right], total + f[left][right])
            }
        }
        
        return f[0][n - 1]
    }
}