//Given a string s, return true if the s can be palindrome after 
//deleting at most one character from it.

func validPalindrome(_ s: String) -> Bool {
    var left = s.startIndex, right = s.index(before: s.endIndex)

    while left <= right {
        if s[left] != s[right] {
            let lRemove = String(s[(s.index(after: left))...right])
            let rRemove = String(s[left..<(right)])
            
            return lRemove == String(lRemove.reversed()) || rRemove == String(rRemove.reversed())
        }
        
        left = s.index(after: left)
        right = s.index(before: right)
    }
    
    return true
}

print(validPalindrome("aba"))
print(validPalindrome("abca"))
print(validPalindrome("abc"))