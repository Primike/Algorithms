// Given a string word, compress it using the following algorithm:
// Begin with an empty string comp. While word is not empty, 
// use the following operation:
// Remove a maximum length prefix of word made of a 
// single character c repeating at most 9 times.
// Append the length of the prefix followed by c to comp.
// Return the string comp.

// Time: O(n), Space: O(1)
func compressedString(_ word: String) -> String {
    let word = Array(word).map { String($0) }
    var result = ""
    var i = 0

    while i < word.count {
        var current = word[i]
        var count = 0

        while i < word.count, current == word[i] {
            if count == 9 { 
                result += "9" + current 
                count = 0
            }
            
            count += 1
            i += 1
        }

        result += "\(count)" + current
    }
    
    return result
}

print(compressedString("abcde"))
print(compressedString("aaaaaaaaaaaaaabb"))