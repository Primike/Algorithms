// Given a string s consisting only of characters a, b and c.
// Return the number of substrings containing at 
// least one occurrence of all these characters a, b and c.

// Time: O(n), Space: O(1)
func numberOfSubstrings(_ s: String) -> Int {
    let s = Array(s).map { String($0) }
    var window = [String: Int]()
    var result = 0
    var left = 0, count = 0

    for i in 0..<s.count {
        window[s[i], default: 0] += 1

        if window[s[i]]! == 1 { count += 1 }

        while left < i, count == 3 {
            result += s.count - i
            window[s[left]]! -= 1

            if window[s[left]]! == 0 { count -= 1 } 

            left += 1
        }
    }

    return result
}

print(numberOfSubstrings("abcabc"))
print(numberOfSubstrings("aaacb"))
print(numberOfSubstrings("abc"))