// A word is considered valid if:
// It contains a minimum of 3 characters.
// It contains only digits (0-9), and 
// English letters (uppercase and lowercase).
// It includes at least one vowel.
// It includes at least one consonant.
// You are given a string word.
// Return true if word is valid, otherwise, return false.

// Time: O(n), Space: O(1)
func isValid(_ word: String) -> Bool {
    if word.count < 3 { return false }
    
    let vowels: Set<Character> = [
        "a", "e", "i", "o", "u",
        "A", "E", "I", "O", "U"
    ]
    var hasVowel = false
    var hasLetter = false

    for letter in word {
        if !letter.isNumber, !letter.isLetter { return false }

        if vowels.contains(letter) {
            hasVowel = true
        } else if letter.isLetter {
            hasLetter = true
        }
    }

    return hasVowel && hasLetter
}

print(isValid("234Adas"))
print(isValid("b3"))
print(isValid("a3$e"))