class Solution {
    func validSequence(_ word1: String, _ word2: String) -> [Int] {
        let w1Chars = Array(word1)
        let w2Chars = Array(word2)
        let n = w1Chars.count
        let m = w2Chars.count
        
        var last = Array(repeating: -1, count: m)
        var j = m - 1
        
        for i in stride(from: n - 1, through: 0, by: -1) {
            if j >= 0 && w1Chars[i] == w2Chars[j] {
                last[j] = i
                j -= 1
            }
        }
        
        var res = [Int]()
        res.reserveCapacity(m)
        
        var skip = 0
        j = 0
        
        for (i, c) in w1Chars.enumerated() {
            if j == m {
                break
            }
            
            let isMatch = (c == w2Chars[j])
            let canSkip = (skip == 0) && (j == m - 1 || i < last[j + 1])
            
            if isMatch || canSkip {
                if !isMatch {
                    skip += 1
                }
                res.append(i)
                j += 1
            }
        }
        
        return j == m ? res : []
    }
}