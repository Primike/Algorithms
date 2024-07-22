// Given an input string s and a pattern p, 
// implement regular expression matching with support for '.' and '*' where:
// '.' Matches any single character.​​​​
// '*' Matches zero or more of the preceding element.

// Time O(s * p), Space: O(s * p)
func isMatch(_ s: String, _ p: String) -> Bool {
    let s = Array(s), p = Array(p)
    var memo = [String: Bool]()
    
    func dp(_ i: Int, _ j: Int) -> Bool {
        let key = "\(i),\(j)"

        if j == p.count { return i == s.count }
        if let value = memo[key] { return value }
        
        var result = i < s.count && (p[j] == s[i] || p[j] == ".")

        if j < p.count - 1, p[j + 1] == "*" {
            result = dp(i, j + 2) || (result && dp(i + 1, j))
        } else {
            result = result && dp(i + 1, j + 1)
        }
        
        memo[key] = result
        return result
    }
    
    return dp(0, 0)
}

print(isMatch("aa", "a"))
print(isMatch("aa", "a*"))
print(isMatch("ab", ".*"))