// Given a string s, return the length of the longest repeating substrings. 
// If no repeating substring exists, return 0.

// Time: O(n^2 * log(n)), Space: O(n^2)
func longestRepeatingSubstring(_ s: String) -> Int {
    let s = Array(s)
    var prefixStrings = [String]()

    for i in 0..<s.count {
        prefixStrings.append(String(s[i...]))
    }

    let sortedPrefixes = prefixStrings.sorted().map { Array($0) }
    var result = 0

    for i in 1..<sortedPrefixes.count {
        let maxIndex = min(sortedPrefixes[i].count, sortedPrefixes[i - 1].count)
        var j = 0

        while j < maxIndex, sortedPrefixes[i][j] == sortedPrefixes[i - 1][j] {
            j += 1
        }

        result = max(result, j)
    }

    return result
}

print(longestRepeatingSubstring("abcd"))
print(longestRepeatingSubstring("abbaba"))
print(longestRepeatingSubstring("aabcaabdaab"))

// Time: O(n^3), Space: O(n^3)
func longestRepeatingSubstring2(_ s: String) -> Int {
    let s = Array(s)
    var substrings = Set<String>()
    var result = 0

    for i in 0..<s.count {
        var string = ""

        for j in i..<s.count {
            string.append(s[j])

            if substrings.contains(string) { result = max(result, string.count) }

            substrings.insert(string)
        }
    }

    return result
}