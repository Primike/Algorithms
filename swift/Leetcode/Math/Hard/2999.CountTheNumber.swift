class Solution {
    func numberOfPowerfulInt(_ start: Int, _ finish: Int, _ limit: Int, _ s: String) -> Int {
        let start_ = String(start - 1)
        let finish_ = String(finish)
        return calculate(x: finish_, s: s, limit: limit) - calculate(x: start_, s: s, limit: limit)
    }

    func calculate(x: String, s: String, limit: Int) -> Int {
        if x.count < s.count {
            return 0
        }
        if x.count == s.count {
            return x >= s ? 1 : 0
        }

        let suffix = String(x.suffix(s.count))
        var count = 0
        let preLen = x.count - s.count

        for i in 0..<preLen {
            if limit < (x[x.index(x.startIndex, offsetBy: i)].wholeNumberValue ?? 0) {
                count += Int(pow(Double(limit + 1), Double(preLen - i)))
                return count
            }
            count += (x[x.index(x.startIndex, offsetBy: i)].wholeNumberValue ?? 0) * Int(pow(Double(limit + 1), Double(preLen - 1 - i)))
        }
        if suffix >= s {
            count += 1
        }
        return count
    }
}