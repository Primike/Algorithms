class Solution {
    func longestSubsequenceRepeatedK(_ s: String, _ k: Int) -> String {
        var ans = ""
        
        var freqs: [Character: Int] = [:]
        for char in s {
            freqs[char, default: 0] += 1
        }
        
        let candidateChars = freqs.filter { $0.value >= k }.keys.sorted(by: >)
        
        var q: [String] = candidateChars.map { String($0) }
        
        while !q.isEmpty {
            let curr = q.removeFirst()
            
            if curr.count > ans.count {
                ans = curr
            }
            
            for char in candidateChars {
                let nxt = curr + String(char)
                let target = String(repeating: nxt, count: k)
                
                if isSubsequence(target, s) {
                    q.append(nxt)
                }
            }
        }
        
        return ans
    }

    private func isSubsequence(_ sub: String, _ main: String) -> Bool {
        var subIndex = sub.startIndex
        if subIndex == sub.endIndex {
            return true
        }
        
        for mainChar in main {
            if mainChar == sub[subIndex] {
                subIndex = sub.index(after: subIndex)
                if subIndex == sub.endIndex {
                    return true
                }
            }
        }
        
        return false
    }
}