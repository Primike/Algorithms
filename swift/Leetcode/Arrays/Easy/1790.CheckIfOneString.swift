// You are given two strings s1 and s2 of equal length. 
// A string swap is an operation where you choose two indices in a string 
// (not necessarily different) and swap the characters at these indices.
// Return true if it is possible to make both strings equal by 
// performing at most one string swap on exactly one of the strings. 
// Otherwise, return false.

// Time: O(n), Space: O(26)
func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
    let s1Dict = s1.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let s2Dict = s2.reduce(into: [:]) { $0[$1, default: 0] += 1 }

    if s1Dict != s2Dict { return false }

    var result = 0

    for (i, j) in zip(s1, s2) {
        if i != j { result += 1 }
    }

    return result <= 2
}

print(areAlmostEqual("bank", "kanb"))
print(areAlmostEqual("attack", "defend"))
print(areAlmostEqual("kelb", "kelb"))