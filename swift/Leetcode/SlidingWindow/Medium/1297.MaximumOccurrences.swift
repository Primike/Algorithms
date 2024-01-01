// Given a string s, return the maximum number of occurrences of 
// any substring under the following rules:
// The number of unique characters in the substring must be 
// less than or equal to maxLetters.
// The substring size must be between minSize and maxSize inclusive.

func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
    let s = Array(s)
    var substrings = [String: Int]()
    var window = [Character: Int](), string = [Character]()

    for (i, letter) in s.enumerated() {
        string.append(letter)
        window[letter, default: 0] += 1

        while string.count > minSize || window.keys.count > maxLetters {
            let first = string.first!
            window[first]! -= 1
            if window[first, default: 0] == 0 { window[first] = nil }
            string.removeFirst()
        }

        if string.count < minSize { continue }
        substrings[String(string), default: 0] += 1
    }

    return substrings.values.max() ?? 0
}

print(maxFreq("aababcaab", 2, 3, 4))
print(maxFreq("aaaa", 1, 3, 3))