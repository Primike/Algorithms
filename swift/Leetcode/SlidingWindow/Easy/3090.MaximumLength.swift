class Solution {
    func maximumLengthSubstring(_ s: String) -> Int {
        let sChars = Array(s)
        var count = Array(repeating: 0, count: 26)
        let aValue = Int(Character("a").asciiValue!)
        
        var left = 0
        var res = 0
        
        for right in 0..<sChars.count {
            let ch = Int(sChars[right].asciiValue!) - aValue
            count[ch] += 1
            
            while count[ch] > 2 {
                let ch2 = Int(sChars[left].asciiValue!) - aValue
                count[ch2] -= 1
                left += 1
            }
            
            res = max(res, right - left + 1)
        }
        
        return res
    }
}