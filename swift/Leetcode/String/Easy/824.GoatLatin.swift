// We would like to convert the sentence to "Goat Latin" 
// (a made-up language similar to Pig Latin.) 
// The rules of Goat Latin are as follows:
// If a word begins with a vowel ('a', 'e', 'i', 'o', or 'u'), 
// append "ma" to the end of the word.
// For example, the word "apple" becomes "applema".
// If a word begins with a consonant (i.e., not a vowel), 
// remove the first letter and append it to the end, then add "ma".
// For example, the word "goat" becomes "oatgma".
// Add one letter 'a' to the end of each word per its word index 
// in the sentence, starting with 1.
// For example, the first word gets "a" added to the end, 
// the second word gets "aa" added to the end, and so on.
// Return the final sentence representing the conversion 
// from sentence to Goat Latin.

// Time: O(n^2), Space: O(n^2)
func toGoatLatin(_ sentence: String) -> String {
    let vowels: Set<Character> = [
        "a", "e", "i", "o", "u",
        "A", "E", "I", "O", "U"
    ]
    let sentence = sentence.components(separatedBy: " ")
    var result = [String]()

    for i in 0..<sentence.count {
        var word = sentence[i]
        
        if vowels.contains(word.first ?? "$") {
            word.append("ma")
        } else {
            word += "\(word.removeFirst())" + "ma"
        }

        word += String(repeating: "a", count: i + 1)
        result.append(word)
    }

    return result.joined(separator: " ")
}

print(toGoatLatin("I speak Goat Latin"))
print(toGoatLatin("The quick brown fox jumped over the lazy dog"))