// Given two strings s and p, return an array of all the start indices of 
// p's anagrams in s. You may return the answer in any order.

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if p.count > s.count { return [] }

    var s = Array(s), p = Array(p)
    var sArray = Array(repeating: 0, count: 27)
    var pArray = Array(repeating: 0, count: 27)
    var result = [Int]()

    for i in 0..<p.count {
        sArray[Int(s[i].asciiValue!) - 97] += 1
        pArray[Int(p[i].asciiValue!) - 97] += 1
    }

    for i in p.count..<s.count {
        if sArray == pArray { result.append(i - p.count) }

        sArray[Int(s[i - p.count].asciiValue!) - 97] -= 1
        sArray[Int(s[i].asciiValue!) - 97] += 1
    }

    if sArray == pArray { result.append(s.count - p.count) }

    return result
}

print(findAnagrams("cbaebabacd", "abc"))
print(findAnagrams("abab", "ab"))