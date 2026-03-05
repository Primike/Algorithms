class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        let sArray = Array(s)
        var ans = 0
        var prev = 0
        var cur = 1
        
        if sArray.isEmpty { return 0 }
        
        for i in 1..<sArray.count {
            if sArray[i-1] != sArray[i] {
                ans += min(prev, cur)
                prev = cur
                cur = 1
            } else {
                cur += 1
            }
        }
        
        return ans + min(prev, cur)
    }
}