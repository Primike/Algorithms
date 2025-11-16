class Solution {
    func maxOperations(_ s: String) -> Int {
        let s = Array(s)
        var countOne = 0
        var ans = 0
        var i = 0
        
        while i < s.count {
            if s[i] == "0" {
                while i + 1 < s.count && s[i + 1] == "0" {
                    i += 1
                }
                ans += countOne
            } else {
                countOne += 1
            }
            i += 1
        }
        
        return ans
    }
}