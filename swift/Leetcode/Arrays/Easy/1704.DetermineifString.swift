// You are given a string s of even length. Split this string 
// into two halves of equal lengths, and let a be the first half 
// and b be the second half.
// Two strings are alike if they have the same number of vowels 
// ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'). 
// Notice that s contains uppercase and lowercase letters.
// Return true if a and b are alike. Otherwise, return false.

// Time: O(n), Space: O(n)
func halvesAreAlike(_ s: String) -> Bool {
    let s = Array(s)
    let vowels = Set(["a", "e", "i", "o", "u"])
    var left = 0, right = s.count - 1
    var vowelsL = 0, vowelsR = 0

    while left < right {
        if vowels.contains(s[left].lowercased()) { vowelsL += 1 }
        if vowels.contains(s[right].lowercased()) { vowelsR += 1 }

        left += 1
        right -= 1
    }

    return vowelsL == vowelsR
}

print(halvesAreAlike("book"))
print(halvesAreAlike("textbook"))