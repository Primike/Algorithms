// You are given an array of strings words. 
// Each element of words consists of two lowercase English letters.
// Create the longest possible palindrome by selecting 
// some elements from words and concatenating them in any order.
// Each element can be selected at most once.
// Return the length of the longest palindrome that you can create. 
// If it is impossible to create any palindrome, return 0.

// Time: O(n), Space: O(26 * 2)
func longestPalindrome(_ words: [String]) -> Int {
    var dict = words.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0
    var foundOdd = false

    for (key, value) in dict {
        let reversed = String(key.reversed())

        if key == reversed, value % 2 == 0 {
            result += value * 2
        } else if key == reversed {
            result += (value - 1) * 2
            foundOdd = true
        } else if let count = dict[reversed] {
            result += min(value, count) * 2
        }
    }

    return result + (foundOdd ? 2 : 0)
}

print(longestPalindrome(["lc","cl","gg"]))
print(longestPalindrome(["ab","ty","yt","lc","cl","ab"]))
print(longestPalindrome(["cc","ll","xx"]))