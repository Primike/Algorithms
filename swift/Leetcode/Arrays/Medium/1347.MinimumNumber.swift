// You are given two strings of the same length s and t. In one step you 
// can choose any character of t and replace it with another character.
// Return the minimum number of steps to make t an anagram of s.

// Time: O(n), Space: O(n)
func minSteps(_ s: String, _ t: String) -> Int {
    var tDict = Array(t).reduce(into: [:]) { $0[$1, default: 0] += 1 }

    for letter in s {
        if let value = tDict[letter], value != 0 {
            tDict[letter] = max(0, value - 1)
        }
    }

    return tDict.values.reduce(0, +)
}

print(minSteps("bab", "aba"))
print(minSteps("leetcode", "practice"))
print(minSteps("anagram", "mangaar"))