// Given a string s, return true if a permutation of 
// the string could form a palindrome and false otherwise.

// Time: O(n), Space: O(26)
func canPermutePalindrome(_ s: String) -> Bool {
    let dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    return dict.values.filter { $0 % 2 != 0 }.count <= 1
}

print(canPermutePalindrome("code"))
print(canPermutePalindrome("aab"))
print(canPermutePalindrome("carerac"))