class Solution {
    func boldWords(_ words: [String], _ S: String) -> String {
        let sChars = Array(S)
        let n = sChars.count
        var mask = Array(repeating: false, count: n)
        
        for i in 0..<n {
            for word in words {
                if S.dropFirst(i).hasPrefix(word) {
                    let wordLen = word.count
                    let end = min(i + wordLen, n)
                    for j in i..<end {
                        mask[j] = true
                    }
                }
            }
        }
        
        var ans = ""
        var i = 0
        while i < n {
            if mask[i] {
                ans.append("<b>")
                while i < n && mask[i] {
                    ans.append(sChars[i])
                    i += 1
                }
                ans.append("</b>")
            } else {
                ans.append(sChars[i])
                i += 1
            }
        }
        
        return ans
    }
}