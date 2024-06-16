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

    func backtrack(_ i: Int, _ j: Int, _ pDict: inout [Character: String], _ sDict: inout [String: Character]) -> Bool {
        if i == pattern.count && j == s.count { return true }
        if i == pattern.count || j == s.count { return false }

        let char = pattern[i]

        for k in j..<s.count {
            let sPrefix = String(s[j...k])

            if let value = pDict[char] {
                if value == sPrefix, backtrack(i + 1, k + 1, &pDict, &sDict) { return true }
            } else if sDict[sPrefix] == nil {
                pDict[char] = sPrefix
                sDict[sPrefix] = char

                if backtrack(i + 1, k + 1, &pDict, &sDict) { return true }

                pDict[char] = nil
                sDict[sPrefix] = nil
            }
        }

        return false
    }

    return backtrack(0, 0, &pDict, &sDict)
}

print(wordPatternMatch("abab", "redblueredblue"))
print(wordPatternMatch("aaaa", "asdasdasdasd"))
print(wordPatternMatch("aabb", "xyzabcxzyabc"))