// Given two strings s1 and s2, return true if s2 contains a permutation of s1, 
// or false otherwise.
// In other words, return true if one of s1's permutations is the substring of s2.

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s1.count > s2.count { return false }

    var s1Array = Array(repeating: 0, count: 26)
    var s2Array = Array(repeating: 0, count: 26)
    let s1 = Array(s1), s2 = Array(s2)

    for i in 0..<s1.count {
        s1Array[Int(s1[i].asciiValue! - Character("a").asciiValue!)] += 1
        s2Array[Int(s2[i].asciiValue! - Character("a").asciiValue!)] += 1
    }

    for i in 0..<(s2.count - s1.count) {
        if s1Array == s2Array { return true }
        s2Array[Int(s2[i].asciiValue! - Character("a").asciiValue!)] -= 1
        s2Array[Int(s2[i + s1.count].asciiValue! - Character("a").asciiValue!)] += 1
    }

    return s1Array == s2Array
}

print(checkInclusion("ab", "eidbaooo"))
print(checkInclusion("ab", "eidboaoo"))