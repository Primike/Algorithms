// Given a string s, find the longest palindromic subsequence's length in s.

func longestPalindromeSubseq(_ s: String) -> Int {
    let s = Array(s), s2 = Array(s.reversed())
    var tab = Array(repeating: Array(repeating: 0, count: s.count + 1), count: s.count + 1)

    for i in 1...s.count {
        for j in 1...s.count {
            if s[i - 1] == s2[j - 1] {
                tab[i][j] = tab[i - 1][j - 1] + 1
            } else {
                tab[i][j] = max(tab[i - 1][j], tab[i][j - 1])
            }
        }
    }

    return tab[s.count][s.count]
}

print(longestPalindromeSubseq("bbbab"))
print(longestPalindromeSubseq("cbbd"))