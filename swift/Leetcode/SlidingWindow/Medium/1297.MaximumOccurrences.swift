// Given a string s, return the maximum number of occurrences of 
// any substring under the following rules:
// The number of unique characters in the substring must be 
// less than or equal to maxLetters.
// The substring size must be between minSize and maxSize inclusive.

// Time: O(n), Space: O(n)
func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
    let s = Array(s)
    var strings = [String: Int]()
    var window = [Character: Int]()
    var left = 0

    for i in 0..<s.count {
        window[s[i], default: 0] += 1

        while window.keys.count > maxLetters || (i - left + 1) > minSize {
            window[s[left], default: 1] -= 1
            if window[s[left]] == 0 { window[s[left]] = nil }
            left += 1
        }

        if i - left + 1 == minSize { 
            strings[String(s[left...i]), default: 0] += 1 
        }
    }

    return strings.values.max() ?? 0
}

print(maxFreq("aababcaab", 2, 3, 4))
print(maxFreq("aaaa", 1, 3, 3))