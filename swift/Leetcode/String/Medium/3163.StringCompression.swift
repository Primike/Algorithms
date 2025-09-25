// Given a string word, compress it using the following algorithm:
// Begin with an empty string comp. While word is not empty, 
// use the following operation:
// Remove a maximum length prefix of word made of a 
// single character c repeating at most 9 times.
// Append the length of the prefix followed by c to comp.
// Return the string comp.

// Time: O(n), Space: O(1)
func compressedString(_ word: String) -> String {
    let word = Array(word)
    var result = ""
    var i = 0

    while i < word.count {
        var char = word[i]
        var count = 0

        while i < word.count, char == word[i], count < 9 {
            i += 1
            count += 1
        }

        result += "\(count)\(char)"
    }

    return result
}

print(compressedString("abcde"))
print(compressedString("aaaaaaaaaaaaaabb"))