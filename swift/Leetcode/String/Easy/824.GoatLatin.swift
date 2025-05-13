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
    let sentence = sentence.components(separatedBy: " ")
    let vowels = Set(["a", "e", "i", "o", "u"])
    var result = [String]()

    for i in 0..<sentence.count {
        var word = Array(sentence[i]).map { String($0) }
        let aLetters = String(repeating: "a", count: i + 1)

        if vowels.contains(word[0].lowercased()) {
            word.append("ma" + aLetters)
        } else {
            let letter = word.removeFirst()
            word.append(letter + "ma" + aLetters)
        }

        result.append(word.joined())
    }

    return result.joined(separator: " ")
}