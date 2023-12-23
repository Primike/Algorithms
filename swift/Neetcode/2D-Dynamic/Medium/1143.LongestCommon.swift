// Given two strings text1 and text2, return the length of their longest common subsequence. 
// If there is no common subsequence, return 0.

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let text1 = Array(text1), text2 = Array(text2)
    var tab = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)

    for i in 1...text1.count {
        for j in 1...text2.count {
            if text1[i - 1] == text2[j - 1] {
                tab[i][j] = tab[i - 1][j - 1] + 1
            } else {
                tab[i][j] = max(tab[i - 1][j], tab[i][j - 1])
            }
        }
    }

    return tab[text1.count][text2.count]
}


print(longestCommonSubsequence("abcde", "ace" ))
print(longestCommonSubsequence("abc", "abc"))
print(longestCommonSubsequence("abc", "def"))


func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
    let text1 = Array(text1), text2 = Array(text2)
    var tab = Array(repeating: Array(repeating: 0, count: text2.count), count: text1.count)

    for i in 0..<text1.count {
        for j in 0..<text2.count {
            if text1[i] == text2[j] { tab[i][j] += 1 }
            if i > 0, j > 0 { tab[i][j] += tab[i - 1][j - 1] }
            if i > 0 { tab[i][j] = max(tab[i][j], tab[i - 1][j]) }
            if j > 0 { tab[i][j] = max(tab[i][j], tab[i][j - 1]) }
        }
    }

    return tab[text1.count - 1][text2.count - 1]
}