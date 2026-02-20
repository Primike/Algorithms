class Solution {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        var ans = [String]()
        
        for i in 0..<1024 {
            let h = i >> 6
            let m = i & 0x3F
            
            if h < 12 && m < 60 && i.nonzeroBitCount == turnedOn {
                ans.append(String(format: "%d:%02d", h, m))
            }
        }
        
        return ans
    }
}