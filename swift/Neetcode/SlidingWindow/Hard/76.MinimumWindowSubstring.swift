// Given two strings s and t of lengths m and n respectively, return the 
// minimum window substring of s such that every character in t (including duplicates) 
// is included in the window. If there is no such substring, return the empty string "".

// Time: O(n + t), Space: O(26)
func minWindow(_ s: String, _ t: String) -> String {
    let s = Array(s)
    let tDict = t.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var window = [Character: Int]()
    var bounds = (0, s.count)
    var count = 0
    var left = 0

    for i in 0..<s.count {
        window[s[i], default: 0] += 1 
        if let value = tDict[s[i]], window[s[i]]! == value { count += 1 }

        while count == tDict.keys.count {
            if i - left < bounds.1 - bounds.0 { bounds = (left, i) }
            if let value = tDict[s[left]], window[s[left]] == value { count -= 1 }

            window[s[left]]! -= 1
            left += 1
        }
    }

    return bounds.1 < s.count ? String(s[bounds.0...bounds.1]) : ""
}

print(minWindow("ADOBECODEBANC", "ABC"))
print(minWindow("a", "a"))
print(minWindow("a", "aa"))