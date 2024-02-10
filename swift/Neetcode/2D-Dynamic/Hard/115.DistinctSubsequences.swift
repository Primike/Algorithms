// Given two strings s and t, return the number of 
// distinct subsequences of s which equals t.

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