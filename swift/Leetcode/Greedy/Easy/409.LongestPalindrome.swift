// Given a string s which consists of lowercase or uppercase letters, 
// return the length of the longest palindrome
// that can be built with those letters.

// Time: O(n), Space: O(n)
func longestPalindrome(_ s: String) -> Int {
    let dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0
    var odd = false

    for (_, value) in dict {
        if value % 2 == 0 {
            result += value
        } else {
            if value > 1 { result += value - 1 }
            odd = true
        }
    }

    if odd { result += 1 }
    return result
}

print(longestPalindrome("abccccdd"))
print(longestPalindrome("a"))