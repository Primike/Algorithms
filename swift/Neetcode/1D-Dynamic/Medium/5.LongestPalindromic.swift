// Given a string s, return the longest palindromic substring in s.

// Time: O(n^2), Space: O(1)
func longestPalindrome(_ s: String) -> String {
    let s = Array(s)
    var start = 0, end = 0
    
    for i in 0..<s.count {
        var left = i, right = i

        while left >= 0, right < s.count, s[left] == s[right] {
            left -= 1
            right += 1
        }
        
        if right - left - 1 > end - start {
            start = left + 1
            end = right
        }

        left = i 
        right = i + 1

        while left >= 0, right < s.count, s[left] == s[right] {
            left -= 1
            right += 1
        }
        
        if right - left - 1 > end - start {
            start = left + 1
            end = right
        }
    }
    
    return String(s[start..<end])
}

print(longestPalindrome("babad"))
print(longestPalindrome("cbbd"))