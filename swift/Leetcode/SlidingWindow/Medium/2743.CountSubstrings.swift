// You are given a string s consisting only of lowercase English letters.
// We call a substring special if it contains no character which has 
// occurred at least twice (in other words, it does not contain a repeating 
// character). Your task is to count the number of special substrings. 
// Return the number of special substrings.

// Time: O(n), Space: O(26)
func numberOfSpecialSubstrings(_ s: String) -> Int {
    let s = Array(s)
    var dict = [Character: Int]()
    var result = 0
    var left = 0

    for i in 0..<s.count {
        dict[s[i], default: 0] += 1

        while left < i, let value = dict[s[i]], value >= 2 {
            dict[s[left], default: 1] -= 1
            if dict[s[left], default: 0] == 0 { dict[s[left]] = nil }
            
            left += 1
        }

        result += i - left + 1
    }

    return result
}

print(numberOfSpecialSubstrings("abcd"))
print(numberOfSpecialSubstrings("ooo"))
print(numberOfSpecialSubstrings("abab"))