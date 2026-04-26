class Solution {
    func minimumDistance(_ word: String) -> Int {
        let n = word.count
        if n == 0 { return 0 }
        
        let wordChars = Array(word).map { Int($0.asciiValue! - 65) }
        let BIG = 1 << 30
        var dp = Array(repeating: Array(repeating: BIG, count: 26), count: n)

        func getDistance(_ p: Int, _ q: Int) -> Int {
            let x1 = p / 6, y1 = p % 6
            let x2 = q / 6, y2 = q % 6
            return abs(x1 - x2) + abs(y1 - y2)
        }

        for j in 0..<26 {
            dp[0][j] = 0
        }

        for i in 1..<n {
            let cur = wordChars[i]
            let prev = wordChars[i - 1]
            let d = getDistance(prev, cur)
            
            for j in 0..<26 {
                dp[i][j] = min(dp[i][j], dp[i - 1][j] + d)
                
                if j == prev {
                    for k in 0..<26 {
                        let d0 = getDistance(k, cur)
                        dp[i][j] = min(dp[i][j], dp[i - 1][k] + d0)
                    }
                }
            }
        }

        return dp[n - 1].min() ?? 0
    }
}