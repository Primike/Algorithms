//Given a string s, return true if it is a palindrome, 
//or false otherwise.

func isPalindrome(_ s: String) -> Bool {
    var left = s.startIndex 
    var right = s.index(before: s.endIndex)

    while left < right {
        if !s[left].isNumber, !s[left].isLetter {  
            left = s.index(after: left)
            continue 
        }

        if !s[right].isNumber, !s[right].isLetter {  
            right = s.index(before: right)
            continue 
        }

        if s[left].lowercased() != s[right].lowercased() { return false }
        left = s.index(after: left)
        right = s.index(before: right)
    }
    
    return true
}

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("race a car"))
print(isPalindrome("0P"))
print(isPalindrome(""))