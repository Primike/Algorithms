class Solution {
    func numOfStrings(_ patterns: [String], _ word: String) -> Int {
        func check(_ pattern: String, _ word: String) -> Bool {
            let pChars = Array(pattern)
            let wChars = Array(word)
            let m = pChars.count
            let n = wChars.count
            
            if m > n { return false }
            
            for i in 0...(n - m) {
                var flag = true
                for j in 0..<m {
                    if wChars[i + j] != pChars[j] {
                        flag = false
                        break
                    }
                }
                if flag {
                    return true
                }
            }
            return false
        }

        var res = 0
        for pattern in patterns {
            if check(pattern, word) {
                res += 1
            }
        }
        return res
    }
}