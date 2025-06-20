class Solution {
    func minMaxDifference(_ num: Int) -> Int {
        var sChars = Array(String(num))
        let orig = sChars
        var pos = 0
        while pos < sChars.count && sChars[pos] == "9" { pos += 1 }
        if pos < sChars.count {
            let target = sChars[pos]
            for i in 0..<sChars.count where sChars[i] == target {
                sChars[i] = "9"
            }
        }
        var tChars = orig
        let first = tChars[0]
        for i in 0..<tChars.count where tChars[i] == first {
            tChars[i] = "0"
        }
        let sStr = String(sChars)
        let tStr = String(tChars)
        return (Int(sStr) ?? 0) - (Int(tStr) ?? 0)
    }
}