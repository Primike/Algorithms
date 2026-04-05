class Solution {
    func generateString(_ str1: String, _ str2: String) -> String {
        let n = str1.count
        let m = str2.count
        let str1Chars = Array(str1)
        let str2Chars = Array(str2)
        
        var s = Array(repeating: "a", count: n + m - 1)
        var fixed = Array(repeating: false, count: n + m - 1)

        for i in 0..<n {
            if str1Chars[i] == "T" {
                for j in 0..<m {
                    let idx = i + j
                    let charStr = String(str2Chars[j])
                    if fixed[idx] && s[idx] != charStr {
                        return ""
                    }
                    s[idx] = charStr
                    fixed[idx] = true
                }
            }
        }

        for i in 0..<n {
            if str1Chars[i] == "F" {
                var mismatch = false
                for j in 0..<m {
                    if s[i + j] != String(str2Chars[j]) {
                        mismatch = true
                        break
                    }
                }
                
                if mismatch {
                    continue
                }

                var changed = false
                for j in stride(from: i + m - 1, through: i, by: -1) {
                    if !fixed[j] {
                        s[j] = "b"
                        changed = true
                        break
                    }
                }
                
                if !changed {
                    return ""
                }
            }
        }

        return s.joined()
    }
}