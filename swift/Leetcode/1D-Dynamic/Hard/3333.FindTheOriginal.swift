class Solution {
    func possibleStringCount(_ word: String, _ k: Int) -> Int {
        let mod = 1_000_000_007
        let n = word.count
        guard n > 0 else { return 0 }
        
        var cnt = 1
        var freq: [Int] = []
        let chars = Array(word)

        for i in 1..<n {
            if chars[i] == chars[i - 1] {
                cnt += 1
            } else {
                freq.append(cnt)
                cnt = 1
            }
        }
        freq.append(cnt)

        var ans = 1
        for o in freq {
            ans = (ans * o) % mod
        }

        if freq.count >= k {
            return ans
        }

        var f = [Int](repeating: 0, count: k)
        f[0] = 1
        var g = [Int](repeating: 1, count: k)

        for i in 0..<freq.count {
            var fNew = [Int](repeating: 0, count: k)
            for j in 1..<k {
                fNew[j] = g[j - 1]
                if j - freq[i] - 1 >= 0 {
                    fNew[j] = (fNew[j] - g[j - freq[i] - 1] + mod) % mod
                }
            }
            
            var gNew = [Int](repeating: 0, count: k)
            gNew[0] = fNew[0]
            for j in 1..<k {
                gNew[j] = (gNew[j - 1] + fNew[j]) % mod
            }
            f = fNew
            g = gNew
        }
        
        return (ans - g[k - 1] + mod) % mod
    }
}