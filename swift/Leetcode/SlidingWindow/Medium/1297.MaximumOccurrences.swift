// Given a string s, return the maximum number of occurrences of 
// any substring under the following rules:
// The number of unique characters in the substring must be 
// less than or equal to maxLetters.
// The substring size must be between minSize and maxSize inclusive.

// Time: O(n), Space: O(n)
func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
    var substrings = [String: Int]()
    var window = [Character: Int](), string = [Character]()

    for letter in s {
        string.append(letter)
        window[letter, default: 0] += 1
        if string.count < minSize { continue }

        if window.keys.count <= maxLetters { 
            substrings[String(string), default: 0] += 1
        }

        let char = string.removeFirst()
        window[char, default: 0] -= 1
        if window[char, default: 0] == 0 { window[char] = nil }
    }

    return substrings.values.max() ?? 0
}

print(maxFreq("aababcaab", 2, 3, 4))
print(maxFreq("aaaa", 1, 3, 3))