class Solution {
    func lastSubstring(_ s: String) -> String {
        var i = 0
        var j = 1
        let n = s.count
        let sChars = Array(s)

        while j < n {
            var k = 0
            while j + k < n && sChars[i + k] == sChars[j + k] {
                k += 1
            }
            if j + k < n && sChars[i + k] < sChars[j + k] {
                let oldI = i
                i = j
                j = max(j + 1, oldI + k + 1)
            } else {
                j = j + k + 1
            }
        }
        return String(sChars.suffix(from: i))
    }

    func answerString(_ word: String, _ numFriends: Int) -> String {
        if numFriends == 1 {
            return word
        }
        let last = self.lastSubstring(word)
        let n = word.count
        let m = last.count

        let desiredLength = n - numFriends + 1
        if desiredLength <= 0 {
            return ""
        }
        
        let finalLength = min(m, desiredLength)
        return String(last.prefix(finalLength))
    }
}