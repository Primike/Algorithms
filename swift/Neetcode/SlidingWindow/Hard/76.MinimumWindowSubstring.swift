// Given two strings s and t of lengths m and n respectively, return the 
// minimum window substring of s such that every character in t (including duplicates) 
// is included in the window. If there is no such substring, return the empty string "".

// Time: O(n), Space: O(n)
func minWindow(_ s: String, _ t: String) -> String {
    let s = Array(s)
    let tDict = Array(t).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var sDict = [Character: Int]()
    var result = (0, s.count)
    var count = 0
    var left = 0

    for i in 0..<s.count {
        sDict[s[i], default: 0] += 1

        if let value = tDict[s[i]], value == sDict[s[i]]! { count += 1 }

        while count == tDict.keys.count {
            if i - left < result.1 - result.0 { result = (left, i) }

            sDict[s[left], default: 1] -= 1

            if let value = tDict[s[left]], value - 1 == sDict[s[left]]! { count -= 1 }
            if sDict[s[left], default: 0] == 0 { sDict[s[left]] = nil }

            left += 1
        }
    }

    if result.1 == s.count { return "" }
    return String(s[result.0...result.1])
}

print(minWindow("ADOBECODEBANC", "ABC"))
print(minWindow("a", "a"))
print(minWindow("a", "aa"))