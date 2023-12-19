// Given a string s consisting of words and spaces, 
// return the length of the last word in the string.

func lengthOfLastWord(_ s: String) -> Int {
    var length = 0
    var foundLetter = false

    for letter in s.reversed() {
        if letter != " " {
            foundLetter = true
            length += 1
        } else if foundLetter {
            return length
        }
    }

    return length
}

print(lengthOfLastWord("Hello World"))
print(lengthOfLastWord("   fly me   to   the moon  "))
print(lengthOfLastWord("luffy is still joyboy"))