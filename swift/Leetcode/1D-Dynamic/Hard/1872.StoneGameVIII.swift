class Solution {
    func stoneGameVIII(_ stones: [Int]) -> Int {
        let n = stones.count
        var pre = [Int](repeating: 0, count: n)
        pre[0] = stones[0]
        for i in 1..<n {
            pre[i] = pre[i - 1] + stones[i]
        }
        
        var f = [Int](repeating: 0, count: n)
        f[n - 1] = pre[n - 1]
        
        for i in stride(from: n - 2, through: 1, by: -1) {
            f[i] = max(f[i + 1], pre[i] - f[i + 1])
        }
        
        return f[1]
    }
}