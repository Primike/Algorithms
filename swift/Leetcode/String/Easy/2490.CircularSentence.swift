// A sentence is circular if:
// The last character of a word is equal to the first character of the next word.
// The last character of the last word is equal to the first character of the first word.
// Given a string sentence, return true if it is circular. Otherwise, return false.

// Time: O(n), Space: O(n)
func isCircularSentence(_ sentence: String) -> Bool {
    if sentence.last != sentence.first { return false }

    var lastLetter = Character("?")
    var lastIsSpace = false

    for char in sentence {
        if lastIsSpace, lastLetter != char { return false }
        
        if char == " " {
            lastIsSpace = true
        } else {
            lastLetter = char
            lastIsSpace = false
        }
    }

    return true
}

print(isCircularSentence("leetcode exercises sound delightful"))
print(isCircularSentence("eetcode"))
print(isCircularSentence("Leetcode is cool"))