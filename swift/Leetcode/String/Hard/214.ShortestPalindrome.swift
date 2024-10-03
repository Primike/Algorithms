// You are given a string s. You can convert s to a palindrome
// by adding characters in front of it.
// Return the shortest palindrome you can find by 
// performing this transformation.

func shortestPalindrome(_ s: String) -> String {
    let length = s.count
    if length == 0 { return s }
    
    let sChars = Array(s)
    var left = 0
    
    for right in stride(from: length - 1, through: 0, by: -1) {
        if sChars[right] == sChars[left] {
            left += 1
        }
    }
    
    if left == length { return s }
    
    let range = left..<length
    let nonPalindrome = sChars[range]
    let reverse = String(nonPalindrome.reversed())
    let prefixSubstring = String(sChars[0..<left])
    let shortestPrefixPalindrome = shortestPalindrome(prefixSubstring)
    
    return reverse + shortestPrefixPalindrome + String(nonPalindrome)
}

print(shortestPalindrome("aacecaaa"))
print(shortestPalindrome("abcd"))