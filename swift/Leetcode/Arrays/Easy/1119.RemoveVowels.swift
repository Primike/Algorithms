// Given a string s, remove the vowels 'a', 'e', 'i', 'o', and 'u' 
// from it, and return the new string.

// Time: O(n), Space: O(1)
func removeVowels(_ s: String) -> String {
    return s.filter { !["a", "e", "i", "o", "u"].contains(String($0)) }
}

print(removeVowels("leetcodeisacommunityforcoders"))
print(removeVowels("aeiou"))