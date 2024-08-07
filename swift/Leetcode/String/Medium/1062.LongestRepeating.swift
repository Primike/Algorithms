// Given a string s, return the length of the longest repeating substrings. 
// If no repeating substring exists, return 0.

func longestRepeatingSubstring(_ s: String) -> Int {
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

print(longestRepeatingSubstring("abcd"))
print(longestRepeatingSubstring("abbaba"))
print(longestRepeatingSubstring("aabcaabdaab"))