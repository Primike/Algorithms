// Given two strings text1 and text2, return the length of their longest common subsequence. 
// If there is no common subsequence, return 0.

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    var text1 = Array(text1), text2 = Array(text2)
    var tab = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)

    for i in stride(from: text1.count - 1, to: -1, by: -1) {
        for j in stride(from: text2.count - 1, to: -1, by: -1) {
            if text1[i] == text2[j] {
                tab[i][j] = 1 + tab[i + 1][j + 1]
            } else {
                tab[i][j] = max(tab[i][j + 1], tab[i + 1][j])
            }
        }
    }

    return tab[0][0]
}

print(longestCommonSubsequence("abcde", "ace" ))
print(longestCommonSubsequence("abc", "abc"))
print(longestCommonSubsequence("abc", "def"))