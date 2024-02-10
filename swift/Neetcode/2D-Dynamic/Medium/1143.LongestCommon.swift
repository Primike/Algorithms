// Given two strings text1 and text2, return the length of their longest common subsequence. 
// If there is no common subsequence, return 0.

// Time: O(n * m), Space: O(n * m)
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

print(longestCommonSubsequence("abcde", "ace" ))
print(longestCommonSubsequence("abc", "abc"))
print(longestCommonSubsequence("abc", "def"))


func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
    let text1 = Array(text1), text2 = Array(text2)
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i >= text1.count || j >= text2.count { return 0 }
        if let value = memo[key] { return value }

        var result = max(dp(i + 1, j), dp(i, j + 1))
        
        if text1[i] == text2[j] { result = max(result, dp(i + 1, j + 1) + 1) }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}