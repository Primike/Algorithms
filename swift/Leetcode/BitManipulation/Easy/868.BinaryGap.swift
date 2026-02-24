class Solution {
    func binaryGap(_ n: Int) -> Int {
        var last = -1
        var ans = 0
        
        for i in 0..<32 {
            if ((n >> i) & 1) > 0 {
                if last >= 0 {
                    ans = max(ans, i - last)
                }
                last = i
            }
        }
        
        return ans
    }
}