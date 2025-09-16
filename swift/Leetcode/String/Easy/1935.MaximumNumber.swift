// Given a string text of words separated by a single space 
// (no leading or trailing spaces) and a string brokenLetters 
// of all distinct letter keys that are broken, return the 
// number of words in text you can fully type using this keyboard.

// Time: O(n * l), Space: O(n * l)
func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
    let words = text.components(separatedBy: " ")
    let letters = Set(brokenLetters)
    var result = 0

    for word in words {
        var isValid = true

        for char in word {
            if letters.contains(char) { 
                isValid = false 
                break
            }
        }

        if isValid { result += 1 }
    }

    return result
}

print(canBeTypedWords("hello world", "ad"))
print(canBeTypedWords("leet code", "lt"))
print(canBeTypedWords("leet code", "e"))