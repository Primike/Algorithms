//Given two strings s and p, return an array of all the start indices of 
//p's anagrams in s. You may return the answer in any order.

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if p.count > s.count { return [] }

    var sDict = [Character: Int]()
    var pDict = [Character: Int]()
    let sArray = Array(s)
    let pArray = Array(p)

    for i in 0..<p.count {
        sDict[sArray[i], default: 0] += 1
        pDict[pArray[i], default: 0] += 1
    }

    var result = sDict == pDict ? [0] : []
    var left = 0

    for i in p.count..<s.count {
        sDict[sArray[i], default: 0] += 1
        sDict[sArray[left]]? -= 1

        if sDict[sArray[left]] == 0 {
            sDict.removeValue(forKey: sArray[left])
        }

        left += 1

        if sDict == pDict {
            result.append(left)
        }
    }

    return result
}

print(findAnagrams("cbaebabacd", "abc"))
print(findAnagrams("abab", "ab"))