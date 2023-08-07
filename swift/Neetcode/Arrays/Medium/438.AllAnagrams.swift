//Given two strings s and p, return an array of all the start indices of 
//p's anagrams in s. You may return the answer in any order.

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if p.count > s.count { return [] }

    let s = Array(s)
    var sDict = s.prefix(p.count).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var pDict = Array(p).reduce(into: [:]) { $0[$1, default: 0] += 1 }

    var result = [Int]()

    for i in p.count..<s.count {
        if sDict == pDict { result.append(i - p.count) }

        sDict[s[i - p.count], default: 0] -= 1
        sDict[s[i], default: 0] += 1

        if sDict[s[i - p.count]] == 0 { sDict[s[i - p.count]] = nil}
    }

    if sDict == pDict { result.append(s.count - p.count) }

    return result
}

print(findAnagrams("cbaebabacd", "abc"))
print(findAnagrams("abab", "ab"))