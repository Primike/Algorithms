// Given a rows x cols screen and a sentence represented as a list of strings, 
// return the number of times the given sentence can be fitted on the screen.
// The order of words in the sentence must remain unchanged, 
// and a word cannot be split into two lines. 
// A single space must separate two consecutive words in a line.

func wordsTyping(_ sentence: [String], _ rows: Int, _ cols: Int) -> Int {
    let sentence = Array(sentence.joined(separator: " ") + " ")
    let length = sentence.count
    var result = 0

    for _ in 0..<rows {
        result += cols

        if sentence[result % length] == " " {
            result += 1
        } else {
            while result > 0, sentence[(result - 1) % length] != " " {
                result -= 1
            }
        }
    }

    return result / length
}

print(wordsTyping(["hello","world"], 2, 8))
print(wordsTyping(["a", "bcd", "e"], 3, 6))
print(wordsTyping(["i","had","apple","pie"], 4, 5))