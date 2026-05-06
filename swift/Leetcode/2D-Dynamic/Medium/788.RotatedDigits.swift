class Solution {
    func rotatedDigits(_ n: Int) -> Int {
        let digits = String(n).compactMap { Int(String($0)) }
        var memo = [[[Int]]](repeating: Array(repeating: Array(repeating: -1, count: 2), count: 2), count: digits.count)

        func dp(_ i: Int, _ isLimited: Bool, _ hasDiff: Bool) -> Int {
            if i == digits.count {
                return hasDiff ? 1 : 0
            }

            let limIdx = isLimited ? 1 : 0
            let diffIdx = hasDiff ? 1 : 0

            if memo[i][limIdx][diffIdx] != -1 {
                return memo[i][limIdx][diffIdx]
            }

            var ans = 0
            let upper = isLimited ? digits[i] : 9

            for d in 0...upper {
                if d == 3 || d == 4 || d == 7 { continue }
                
                let nextLimited = isLimited && (d == upper)
                let nextHasDiff = hasDiff || (d == 2 || d == 5 || d == 6 || d == 9)
                
                ans += dp(i + 1, nextLimited, nextHasDiff)
            }

            memo[i][limIdx][diffIdx] = ans
            return ans
        }

        return dp(0, true, false)
    }
}