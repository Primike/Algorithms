class Solution {
    func smallestSubsequence(_ s: String) -> String {
        var vis = Array(repeating: 0, count: 26)
        var num = Array(repeating: 0, count: 26)
        
        let sChars = Array(s)
        let aValue = Int(Character("a").asciiValue!)
        
        for ch in sChars {
            let idx = Int(ch.asciiValue!) - aValue
            num[idx] += 1
        }
        
        var stk = [Character]()
        
        for ch in sChars {
            let idx = Int(ch.asciiValue!) - aValue
            
            if vis[idx] == 0 {
                while let last = stk.last, last > ch {
                    let topIdx = Int(last.asciiValue!) - aValue
                    if num[topIdx] > 0 {
                        vis[topIdx] = 0
                        stk.removeLast()
                    } else {
                        break
                    }
                }
                vis[idx] = 1
                stk.append(ch)
            }
            num[idx] -= 1
        }
        
        return String(stk)
    }
}