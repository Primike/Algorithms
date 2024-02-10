// Given a string s, find the longest palindromic subsequence's length in s.

// Time: O(n * m), Space: O(n * m)
func longestPalindromeSubseq(_ s: String) -> Int {
    let s = Array(s), s2 = Array(s.reversed())
    var tab = Array(repeating: Array(repeating: 0, count: s2.count), count: s.count)

    for i in 0..<s.count {
        for j in 0..<s2.count {
            if s[i] == s2[j] { tab[i][j] = 1 }
            if i > 0, j > 0 { tab[i][j] += tab[i - 1][j - 1] }
            if i > 0 { tab[i][j] = max(tab[i][j], tab[i - 1][j]) }
            if j > 0 { tab[i][j] = max(tab[i][j], tab[i][j - 1]) }
        }
    }

    return tab[s.count - 1][s2.count - 1]
}

print(longestPalindromeSubseq("bbbab"))
print(longestPalindromeSubseq("cbbd"))

// TLE
func longestPalindromeSubseq2(_ s: String) -> Int {
    let s = Array(s), s2 = Array(s.reversed())
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i >= s.count || j >= s2.count { return 0 }
        if let value = memo[key] { return value }

        var result = max(dp(i + 1, j), dp(i, j + 1))

        if s[i] == s2[j] { result = max(result, dp(i + 1, j + 1) + 1) }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}