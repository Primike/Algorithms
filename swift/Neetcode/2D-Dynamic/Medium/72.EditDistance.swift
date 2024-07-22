// Given two strings word1 and word2, return the 
// minimum number of operations required to convert word1 to word2.
// You have the following three operations permitted on a word:
// Insert a character Delete a character Replace a character

// Time: O(m * n), Space: O(m * n)
func minDistance(_ word1: String, _ word2: String) -> Int {
    if word1.isEmpty { return word2.count }
    if word2.isEmpty { return word1.count }

    let word1 = Array(word1), word2 = Array(word2)
    var tab = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)

    for i in 0...word1.count { tab[i][0] = i }
    for j in 0...word2.count { tab[0][j] = j }

    for i in 1...word1.count {
        for j in 1...word2.count {
            if word1[i - 1] == word2[j - 1] {
                tab[i][j] = tab[i - 1][j - 1]
            } else {
                tab[i][j] = min(tab[i - 1][j], tab[i][j - 1], tab[i - 1][j - 1]) + 1
            }
        }
    }

    return tab[word1.count][word2.count]
}

print(minDistance("horse", "ros"))
print(minDistance("intention", "execution"))


func minDistance(_ word1: String, _ word2: String) -> Int {
    let word1 = Array(word1), word2 = Array(word2)
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i == word1.count { return word2.count - j }
        if j == word2.count { return word1.count - i }
        if let value = memo[key] { return value }

        var result = dp(i + 1, j + 1) + (word1[i] == word2[j] ? 0 : 1)
        result = min(result, dp(i, j + 1) + 1)
        result = min(result, dp(i + 1, j) + 1)

        memo[key] = result
        return result
    }

    return dp(0, 0)
}