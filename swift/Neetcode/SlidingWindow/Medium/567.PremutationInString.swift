// Given two strings s1 and s2, return true if s2 contains a permutation of s1, 
// or false otherwise.
// In other words, return true if one of s1's permutations is the substring of s2.

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    let s1 = Array(s1), s2 = Array(s2)
    var s1Array = Array(repeating: 0, count: 26)
    var s2Array = Array(repeating: 0, count: 26)

    for i in 0..<s1.count {
        s1Array[Int(s1[i].asciiValue! - 97)] += 1
    }

    for i in 0..<s2.count {
        s2Array[Int(s2[i].asciiValue!) - 97] += 1
        if i < s1.count - 1 { continue }

        if s1Array == s2Array { return true }
        s2Array[Int(s2[i - s1.count + 1].asciiValue!) - 97] -= 1
    }

    return false
}

print(checkInclusion("ab", "eidbaooo"))
print(checkInclusion("ab", "eidboaoo"))

func checkInclusion2(_ s1: String, _ s2: String) -> Bool {
    let s2 = Array(s2)
    var s1Dict = Array(s1).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var s2Dict = [Character: Int]()

    for (i, letter) in s2.enumerated() {
        s2Dict[letter, default: 0] += 1
        if i < s1.count - 1 { continue }
        if s2Dict == s1Dict { return true }

        let left = i - s1.count + 1
        s2Dict[s2[left]]! -= 1
        if s2Dict[s2[left]]! == 0 { s2Dict[s2[left]] = nil }
    }

    return false
}