// You are given a string s. You can convert s to a palindrome
// by adding characters in front of it.
// Return the shortest palindrome you can find by 
// performing this transformation.

// Time: O(n^2), Space: O(n)
func shortestPalindrome(_ s: String) -> String {
    if s.count == 0 { return s }
    
    let s = Array(s)
    var index = s.count - 1

    for i in (0..<s.count).reversed() {
        var left = 0, right = i

        while left <= right, s[left] == s[right] {
            left += 1
            right -= 1
        }

        if left > right {
            index = i 
            break 
        }
    }

    let rightPart = String(s[(index + 1)...])
    let leftPart = rightPart.reversed()
    let palindrome = String(s[0...index])

    return leftPart + palindrome + rightPart
}

print(shortestPalindrome("aacecaaa"))
print(shortestPalindrome("abcd"))