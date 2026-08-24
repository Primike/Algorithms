class Solution {
    func smallestPalindrome(_ s: String) -> String {
        let sChars = Array(s)
        let n = sChars.count
        let partition = n / 2
        var bucket = Array(repeating: 0, count: 26)
        
        let aValue = Int(Character("a").asciiValue!)
        
        for i in 0..<partition {
            let idx = Int(sChars[i].asciiValue!) - aValue
            bucket[idx] += 1
        }
        
        var left = ""
        for i in 0..<26 {
            if bucket[i] > 0 {
                let char = String(UnicodeScalar(aValue + i)!)
                left += String(repeating: char, count: bucket[i])
            }
        }
        
        let mid: String
        if n % 2 != 0 {
            mid = String(sChars[partition])
        } else {
            mid = ""
        }
        
        let right = String(left.reversed())
        
        return left + mid + right
    }
}