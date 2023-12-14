// Given a string s, return true if the s can be palindrome after 
// deleting at most one character from it.

func validPalindrome(_ s: String) -> Bool {
    let s = Array(s)
    var left = 0
    var right = s.count - 1

    while left < right {
        if s[left] != s[right] {
            let lRemove = String(s[(left + 1)...right])
            let rRemove = String(s[left..<(right)])
            
            return lRemove == String(lRemove.reversed()) || rRemove == String(rRemove.reversed())
        }
        
        left += 1
        right -= 1
    }
    
    return true
}

print(validPalindrome("aba"))
print(validPalindrome("abca"))
print(validPalindrome("abc"))