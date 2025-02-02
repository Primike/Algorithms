// A string s matches a pattern if there is some bijective mapping 
// of single characters to non-empty strings such that if each character 
// in pattern is replaced by the string it maps to, 
// then the resulting string is s. A bijective mapping means that 
// no two characters map to the same string, and no character 
// maps to two different strings.

func wordPatternMatch(_ pattern: String, _ s: String) -> Bool {
    let pattern = Array(pattern), s = Array(s)
    var pDict = [Character: String]()
    var sDict = [String: Character]()

    func backtrack(_ i: Int, _ j: Int) -> Bool {
        if i == pattern.count, j == s.count { return true }
        if i == pattern.count || j == s.count { return false }

        let letter = pattern[i]
        var string = ""
        
        for k in j..<s.count {
            string.append(s[k])

            if let value = pDict[letter] {
                if value == string, backtrack(i + 1, k + 1) { return true }
            } else if sDict[string] == nil {
                pDict[letter] = string
                sDict[string] = letter

                if backtrack(i + 1, k + 1) { return true }

                pDict[letter] = nil
                sDict[string] = nil
            }
        }

        return false
    }

    return backtrack(0, 0)
}

print(wordPatternMatch("abab", "redblueredblue"))
print(wordPatternMatch("aaaa", "asdasdasdasd"))
print(wordPatternMatch("aabb", "xyzabcxzyabc"))