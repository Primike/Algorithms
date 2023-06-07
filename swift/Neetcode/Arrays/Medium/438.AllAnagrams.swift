//Given two strings s and p, return an array of all the start indices of 
//p's anagrams in s. You may return the answer in any order.

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if p.count > s.count { return [] }

    let s = Array(s)
    var sDict = s.prefix(p.count).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var pDict = Array(p).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = sDict == pDict ? [0] : []

    for i in p.count..<s.count {
        var leftIndex = i - p.count
        sDict[s[i], default: 0] += 1
        sDict[s[leftIndex]]? -= 1

        if sDict[s[leftIndex]] == 0 {
            sDict.removeValue(forKey: s[leftIndex])
        }

        if sDict == pDict {
            result.append(leftIndex + 1)
        }
    }

    return result
}

print(findAnagrams("cbaebabacd", "abc"))
print(findAnagrams("abab", "ab"))