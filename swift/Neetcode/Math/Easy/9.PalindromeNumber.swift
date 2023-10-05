// Given an integer x, return true if x is a palindrome
// and false otherwise.

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 || (x % 10 == 0 && x != 0) { return false }
    
    var x = x
    var reversedHalf = 0
    
    while x > reversedHalf {
        reversedHalf = reversedHalf * 10 + x % 10
        x /= 10
    }
    
    return x == reversedHalf || x == reversedHalf / 10
}

print(isPalindrome(121))
print(isPalindrome(-121))
print(isPalindrome(10))