// Given a string s consisting only of characters a, b and c.
// Return the number of substrings containing at 
// least one occurrence of all these characters a, b and c.

// Time: O(n), Space: O(1)
func numberOfSubstrings(_ s: String) -> Int {
    let s = Array(s)
    var dict = [Character: Int]()
    var result = 0
    var left = 0

    for i in 0..<s.count {
        dict[s[i], default: 0] += 1
        if dict.keys.count == 3 { result += s.count - i }

        while dict.keys.count == 3 {
            dict[s[left], default: 1] -= 1
            if dict[s[left]] == 0 { dict[s[left]] = nil }
            left += 1

            if dict.keys.count == 3 { result += s.count - i }
        }
    }

    return result
}

print(numberOfSubstrings("abcabc"))
print(numberOfSubstrings("aaacb"))
print(numberOfSubstrings("abc"))