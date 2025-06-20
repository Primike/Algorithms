class Solution {
    func maxDiff(_ num: Int) -> Int {
        let numStr = String(num)
        var maxNumStr = numStr
        var minNumStr = numStr

        for ch in maxNumStr {
            if ch != "9" {
                maxNumStr = maxNumStr.replacingOccurrences(of: String(ch), with: "9")
                break
            }
        }

        for (i, ch) in minNumStr.enumerated() {
            if i == 0 {
                if ch != "1" {
                    minNumStr = minNumStr.replacingOccurrences(of: String(ch), with: "1")
                    break
                }
            } else {
                if ch != "0" && ch != minNumStr.first! {
                    minNumStr = minNumStr.replacingOccurrences(of: String(ch), with: "0")
                    break
                }
            }
        }

        return Int(maxNumStr)! - Int(minNumStr)!
    }
}