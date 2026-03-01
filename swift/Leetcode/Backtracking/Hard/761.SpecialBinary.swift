class Solution {
    func makeLargestSpecial(_ S: String) -> String {
        if S.isEmpty { return S }
        
        let chars = Array(S)
        var anchor = 0
        var bal = 0
        var mountains = [String]()
        
        for i in 0..<chars.count {
            bal += (chars[i] == "1" ? 1 : -1)
            if bal == 0 {
                let start = S.index(S.startIndex, offsetBy: anchor + 1)
                let end = S.index(S.startIndex, offsetBy: i)
                let inner = String(S[start..<end])
                
                mountains.append("1" + makeLargestSpecial(inner) + "0")
                anchor = i + 1
            }
        }
        
        mountains.sort(by: >)
        return mountains.joined()
    }
}