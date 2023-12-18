// Given two strings s and t of lengths m and n respectively, return the 
// minimum window substring of s such that every character in t (including duplicates) 
// is included in the window. If there is no such substring, return the empty string "".

func minWindow(_ s: String, _ t: String) -> String {
    if t.count > s.count { return "" }

    let s = Array(s)
    let tDict = Array(t).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let target = tDict.count
    var sDict = [Character: Int]()
    var result = (-1, -1), length = Int.max
    var left = 0, count = 0

    for (i, letter) in s.enumerated() {
        sDict[letter, default: 0] += 1
        if let value = tDict[letter], value == sDict[letter]! {
            count += 1
        }

        while left <= i, count == target {
            if i - left + 1 < length {
                length = i - left + 1
                result = (left, i)
            }

            sDict[s[left]]! -= 1
            if let value = tDict[s[left]], value > sDict[s[left]]! {
                count -= 1
            }

            if sDict[s[left]]! == 0 { sDict[s[left]] = nil }
            left += 1
        }
    }

    return result.0 == -1 ? "" : String(s[result.0...result.1])
}

print(minWindow("ADOBECODEBANC", "ABC"))
print(minWindow("a", "a"))
print(minWindow("a", "aa"))