// Given two strings s and t, return the number of 
// distinct subsequences of s which equals t.

// Time: O(m * n), Space: O(m * n)
func numDistinct(_ s: String, _ t: String) -> Int {
    let s = Array(s), t = Array(t)
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if j >= t.count { return 1 }
        if i >= s.count || j >= t.count { return 0 }
        if let value = memo[key] { return value }

        var result = dp(i + 1, j)
        if s[i] == t[j] { result += dp(i + 1, j + 1) }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}

print(numDistinct("rabbbit", "rabbit"))
print(numDistinct("babgbag", "bag"))


func numDistinct(_ s: String, _ t: String) -> Int {
    let s = Array(s), t = Array(t)
    var tab = Array(repeating: Array(repeating: 0, count: t.count + 1), count: s.count + 1)

    for i in 0...s.count {
        tab[i][0] = 1
    }

    for i in 1...s.count {
        for j in 1...t.count {
            if s[i - 1] == t[j - 1] {
                tab[i][j] = tab[i - 1][j - 1] + tab[i - 1][j]
            } else {
                tab[i][j] = tab[i - 1][j]
            }
        }
    }

    return tab[s.count][t.count]
}