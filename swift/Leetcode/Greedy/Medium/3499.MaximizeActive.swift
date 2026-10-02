class Solution {
    func maxActiveSectionsAfterTrade(_ s: String) -> Int {
        let sChars = Array(s)
        let n = sChars.count
        
        let cnt1 = sChars.filter { $0 == "1" }.count
        
        var zeroBlocks = [Int]()
        var i = 0
        
        while i < n {
            let start = i
            while i < n && sChars[i] == sChars[start] {
                i += 1
            }
            if sChars[start] == "0" {
                zeroBlocks.append(i - start)
            }
        }
        
        let m = zeroBlocks.count
        if m < 2 {
            return cnt1
        }
        
        var bestGain = 0
        for i in 0..<(m - 1) {
            bestGain = max(bestGain, zeroBlocks[i] + zeroBlocks[i + 1])
        }
        
        return cnt1 + bestGain
    }
}