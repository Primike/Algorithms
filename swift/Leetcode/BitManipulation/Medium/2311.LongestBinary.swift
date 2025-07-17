class Solution {
    func longestSubsequence(_ s: String, _ k: Int) -> Int {
        var sm = 0
        var cnt = 0
        let bits = k == 0 ? 0 : k.bitWidth - k.leadingZeroBitCount

        for (i, ch) in s.reversed().enumerated() {
            if ch == "1" {
                if i < bits && sm + (1 << i) <= k {
                    sm += (1 << i)
                    cnt += 1
                }
            } else {
                cnt += 1
            }
        }
        return cnt
    }
}