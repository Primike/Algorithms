final class Solution {
    func maxPartitionsAfterOperations(_ s: String, _ k: Int) -> Int {
        let bytes = Array(s.utf8)
        let n = bytes.count
        if n == 0 { return 0 }
        
        var left = Array(repeating: Array(repeating: 0, count: 3), count: n)
        var right = Array(repeating: Array(repeating: 0, count: 3), count: n)
        
        var num = 0, mask = 0, count = 0
        if n >= 2 {
            for i in 0..<(n - 1) {
                let bit = 1 << (Int(bytes[i]) - 97)
                if (mask & bit) == 0 {
                    count += 1
                    if count <= k {
                        mask |= bit
                    } else {
                        num += 1
                        mask = bit
                        count = 1
                    }
                }
                left[i + 1][0] = num
                left[i + 1][1] = mask
                left[i + 1][2] = count
            }
        }
        
        num = 0; mask = 0; count = 0
        if n >= 2 {
            for i in stride(from: n - 1, to: 0, by: -1) {
                let bit = 1 << (Int(bytes[i]) - 97)
                if (mask & bit) == 0 {
                    count += 1
                    if count <= k {
                        mask |= bit
                    } else {
                        num += 1
                        mask = bit
                        count = 1
                    }
                }
                right[i - 1][0] = num
                right[i - 1][1] = mask
                right[i - 1][2] = count
            }
        }
        
        var maxVal = 0
        for i in 0..<n {
            var seg = left[i][0] + right[i][0] + 2
            let totalMask = left[i][1] | right[i][1]
            let totCount = totalMask.nonzeroBitCount
            if left[i][2] == k && right[i][2] == k && totCount < 26 {
                seg += 1
            } else if min(totCount + 1, 26) <= k {
                seg -= 1
            }
            if seg > maxVal { maxVal = seg }
        }
        return maxVal
    }
}