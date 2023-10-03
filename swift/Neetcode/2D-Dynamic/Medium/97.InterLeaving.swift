// Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.

func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    if s1.count + s2.count != s3.count { return false }

    var s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
    var tab = Array(repeating: Array(repeating: false, count: s2.count + 1), count: s1.count + 1)
    tab[s1.count][s2.count] = true

    for i in stride(from: s1.count, to: -1, by: -1) {
        for j in stride(from: s2.count, to: -1, by: -1) {
            if i < s1.count, s1[i] == s3[i + j], tab[i + 1][j] { tab[i][j] = true }
            if j < s2.count, s2[j] == s3[i + j], tab[i][j + 1] { tab[i][j] = true }
        }
    }

    return tab[0][0]
}

print(isInterleave("aabcc", "dbbca", "aadbbcbcac"))
print(isInterleave("aabcc", "dbbca", "aadbbbaccc"))
print(isInterleave("", "", ""))

func isInterleave2(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    if s1.count + s2.count != s3.count { return false }

    var s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
    var memo = [String: Bool]()

    func dp(_ i: Int, _ j: Int) -> Bool {
        if let stored = memo["\(i),\(j)"] { return stored }
        if i == s1.count, j == s2.count { return true }

        if i < s1.count, s1[i] == s3[i + j], dp(i + 1, j) { return true }
        if j < s2.count, s2[j] == s3[i + j], dp(i, j + 1) { return true }

        memo["\(i),\(j)"] = false
        return false
    }

    return dp(0,0)
}