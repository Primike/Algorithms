class Solution {
    func minNumberOperations(_ target: [Int]) -> Int {
        guard !target.isEmpty else {
            return 0
        }
        
        let n = target.count
        var ans = target[0]
        
        for i in 1..<n {
            ans += max(target[i] - target[i - 1], 0)
        }
        
        return ans
    }
}