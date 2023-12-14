// Given a string s, return true if it is a palindrome, 
// or false otherwise.

func isPalindrome(_ s: String) -> Bool {
    var s = Array(s.filter { $0.isNumber || $0.isLetter }.lowercased())
    var left = 0, right = s.count - 1

    while left <= right {
        if s[left] != s[right] { return false }

        left += 1
        right -= 1
    }

    return true
}

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("race a car"))
print(isPalindrome("0P"))
print(isPalindrome(""))