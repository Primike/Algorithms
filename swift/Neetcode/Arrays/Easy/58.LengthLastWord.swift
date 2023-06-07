//Given a string s consisting of words and spaces, 
//return the length of the last word in the string.


func lengthOfLastWord(_ s: String) -> Int {
    var length = 0
    var spaceFound = false

    for i in stride(from: s.count - 1, to: -1, by: -1) {
        let character = s[s.index(s.startIndex, offsetBy: i)]

        if character == " " {
            if spaceFound {
                break
            }
        } else {
            spaceFound = true
            length += 1
        }
    }

    return length
}

print(lengthOfLastWord("Hello World"))
print(lengthOfLastWord("   fly me   to   the moon  "))
print(lengthOfLastWord("luffy is still joyboy"))