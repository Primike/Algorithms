class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var dp = Array(repeating: false, count: n + 1)
        let limit = Int(Double(n).squareRoot())
        
        for i in 0...n {
            if dp[i] {
                continue
            }
            for k in 1...limit {
                let square = k * k
                if i + square <= n {
                    dp[i + square] = true
                } else {
                    break
                }
            }
        }
        
        return dp[n]
    }
}