class Solution {
    func longestBalanced(_ s: String) -> Int {
        let n = s.count
        if n == 0 { return 0 }
        let sArray = Array(s)
        
        var ans = 1
        var currentLen = 1
        for i in 1..<n {
            if sArray[i] == sArray[i-1] {
                currentLen += 1
            } else {
                ans = max(ans, currentLen)
                currentLen = 1
            }
        }
        ans = max(ans, currentLen)
        
        var ab = [String: Int]()
        var bc = [String: Int]()
        var ca = [String: Int]()
        var abc = [String: Int]()
        
        abc["0,0"] = -1
        ab["0,0"] = -1
        bc["0,0"] = -1
        ca["0,0"] = -1
        
        var cnt = [0, 0, 0]
        let aAscii = Int(Character("a").asciiValue!)
        
        for i in 0..<n {
            let charIdx = Int(sArray[i].asciiValue!) - aAscii
            cnt[charIdx] += 1
            
            let A = cnt[0]
            let B = cnt[1]
            let C = cnt[2]
            
            let keyABC = "\(B - A),\(C - A)"
            if let prevIdx = abc[keyABC] {
                ans = max(ans, i - prevIdx)
            } else {
                abc[keyABC] = i
            }
            
            let keyAB = "\(A - B),\(C)"
            if let prevIdx = ab[keyAB] {
                ans = max(ans, i - prevIdx)
            } else {
                ab[keyAB] = i
            }
            
            let keyBC = "\(B - C),\(A)"
            if let prevIdx = bc[keyBC] {
                ans = max(ans, i - prevIdx)
            } else {
                bc[keyBC] = i
            }
            
            let keyCA = "\(C - A),\(B)"
            if let prevIdx = ca[keyCA] {
                ans = max(ans, i - prevIdx)
            } else {
                ca[keyCA] = i
            }
        }
        
        return ans
    }
}