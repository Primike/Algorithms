func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
    let s1 = Array(str1)
    let s2 = Array(str2)
    let n = s1.count, m = s2.count
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    for i in 0...n { dp[i][m] = n - i }
    for j in 0...m { dp[n][j] = m - j }
    for i in stride(from: n - 1, through: 0, by: -1) {
        for j in stride(from: m - 1, through: 0, by: -1) {
            if s1[i] == s2[j] {
                dp[i][j] = 1 + dp[i + 1][j + 1]
            } else {
                dp[i][j] = 1 + min(dp[i + 1][j], dp[i][j + 1])
            }
        }
    }
    var i = 0, j = 0, res = ""
    while i < n && j < m {
        if s1[i] == s2[j] {
            res.append(s1[i])
            i += 1; j += 1
        } else if dp[i + 1][j] < dp[i][j + 1] {
            res.append(s1[i])
            i += 1
        } else {
            res.append(s2[j])
            j += 1
        }
    }
    while i < n {
        res.append(s1[i])
        i += 1
    }
    while j < m {
        res.append(s2[j])
        j += 1
    }
    return res
}