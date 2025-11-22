class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        let s = Array(s)
        let n = s.count
        var pre = Array(repeating: -1, count: n + 1)
        
        for i in 0..<n {
            if i == 0 || s[i - 1] == "0" {
                pre[i + 1] = i
            } else {
                pre[i + 1] = pre[i]
            }
        }

        var res = 0
        for i in 1...(n) {
            var cnt0 = (s[i - 1] == "0") ? 1 : 0
            var j = i
            while j > 0 && cnt0 * cnt0 <= n {
                let cnt1 = (i - pre[j]) - cnt0
                if cnt0 * cnt0 <= cnt1 {
                    res += min(j - pre[j], cnt1 - cnt0 * cnt0 + 1)
                }
                j = pre[j]
                cnt0 += 1
            }
        }
        return res
    }
}