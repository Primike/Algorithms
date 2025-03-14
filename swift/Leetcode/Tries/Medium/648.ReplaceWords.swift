// Given a dictionary consisting of many roots and a sentence 
// consisting of words separated by spaces, replace all the derivatives 
// in the sentence with the root forming it. If a derivative can be 
// replaced by more than one root, replace it with the root that has 
// the shortest length.
// Return the sentence after the replacement.

// Time: O(n * l), Space: O(n)
func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
    let dictionary = Set(dictionary)
    var sentence = sentence.components(separatedBy: " ")
    
    for (i, word) in sentence.enumerated() {
        let wordArray = Array(word)
        var currentPrefix = ""

        for j in 0..<wordArray.count {
            currentPrefix.append(wordArray[j])

            if dictionary.contains(currentPrefix) {
                sentence[i] = currentPrefix
                break
            }
        }
    }

    return sentence.joined(separator: " ")
}

print(replaceWords(["cat","bat","rat"], "the cattle was rattled by the battery"))
print(replaceWords(["a","b","c"], "aadsfasf absbs bbab cadsfafs"))