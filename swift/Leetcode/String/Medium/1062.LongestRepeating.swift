// Given a string s, return the length of the longest repeating substrings. 
// If no repeating substring exists, return 0.

// Time: O(n^2 * log(n)), Space: O(n^2)
func longestRepeatingSubstring(_ s: String) -> Int {
    let s = Array(s)
    var left = 1, right = s.count - 1
    var result = 0

    while left <= right {
        let mid = (right + left) / 2
        var substrings = Set<String>()
        var string = ""
        var isValid = false

        for i in 0..<s.count {
            string.append(s[i])
            if i < mid - 1 { continue }

            if substrings.contains(string) {
                isValid = true
                break
            }

            substrings.insert(string)
            string.removeFirst()
        }

        if isValid {
            result = max(result, mid)
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return result
}

print(longestRepeatingSubstring("abcd"))
print(longestRepeatingSubstring("abbaba"))
print(longestRepeatingSubstring("aabcaabdaab"))


// Time: O(n^2 * log(n)), Space: O(n^2)
func longestRepeatingSubstring2(_ s: String) -> Int {
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


// Time: O(n^3), Space: O(n^3)
func longestRepeatingSubstring3(_ s: String) -> Int {
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