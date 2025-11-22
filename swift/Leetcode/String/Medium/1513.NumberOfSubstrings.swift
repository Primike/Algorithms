class Solution {
    func numSub(_ s: String) -> Int {
        var total = 0
        var consecutive = 0
        let s = Array(s)
        let length = s.count
        
        for i in 0..<length {
            if s[i] == "0" {
                total += consecutive * (consecutive + 1) / 2
                consecutive = 0
            } else {
                consecutive += 1
            }
        }
        
        total += consecutive * (consecutive + 1) / 2
        total = total % 1_000_000_007
        return total
    }
}