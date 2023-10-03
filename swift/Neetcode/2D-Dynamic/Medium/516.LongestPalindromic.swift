// Given a string s, find the longest palindromic subsequence's length in s.

func longestPalindromeSubseq(_ s: String) -> Int {
    var s = Array(s), sReversed = Array(s.reversed())
    var tab = Array(repeating: Array(repeating: 0, count: s.count + 1), count: s.count + 1)

    for i in stride(from: s.count - 1, to: -1, by: -1) {
        for j in stride(from: s.count - 1, to: -1, by: -1) {
            if s[i] == sReversed[j] {
                tab[i][j] = 1 + tab[i + 1][j + 1]
            } else {
                tab[i][j] = max(tab[i][j + 1], tab[i + 1][j])
            }
        }
    }

    return tab[0][0]
}

print(longestPalindromeSubseq("bbbab"))
print(longestPalindromeSubseq("cbbd"))