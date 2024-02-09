// You are given a string word and an array of strings forbidden.
// A string is called valid if none of its substrings are present in forbidden.
// Return the length of the longest valid substring of the string word.

// Time: O(n^2), Space: O(n)
func longestValidSubstring(_ word: String, _ forbidden: [String]) -> Int {
    let word = Array(word), forbidden = Set(forbidden)
    let longest = forbidden.map { $0.count }.max() ?? 0
    var result = 0
    var right = word.count - 1

    for i in stride(from: word.count - 1, to: -1, by: -1) {
        for j in i...min(i + longest, right) {
            let substring = String(word[i...j])

            if forbidden.contains(substring) {
                right = j - 1
                break
            }
        }
        
        result = max(result, right - i + 1)
    }

    return result
}

print(longestValidSubstring("cbaaaabc", ["aaa","cb"]))
print(longestValidSubstring("leetcode", ["de","le","e"]))