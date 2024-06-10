// Given a list of words, list of  single letters 
// (might be repeating) and score of every character.
// Return the maximum score of any valid set of words formed 
// by using the given letters (words[i] cannot be used two or more times).
// It is not necessary to use all characters in letters and 
// each letter can only be used once. Score of letters 'a', 'b', 'c', ... ,'z' 
// is given by score[0], score[1], ... , score[25] respectively.

func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
    var result = 0

    func backtrack(_ i: Int, _ total: Int, _ dict: [Character: Int]) {
        if i == words.count {
            result = max(result, total)
            return 
        }

        backtrack(i + 1, total, dict)

        var dict = dict
        var count = 0

        for letter in words[i] {
            if !dict.keys.contains(letter) { return }

            dict[letter, default: 0] -= 1
            if dict[letter, default: 0] == 0 { dict[letter] = nil }
            count += score[Int(letter.asciiValue!) - 97]
        }

        backtrack(i + 1, total + count, dict)
    }

    backtrack(0, 0, letters.reduce(into: [:]) { $0[$1, default: 0] += 1 })
    return result
}

print(maxScoreWords(
    ["dog","cat","dad","good"], 
    ["a","a","c","d","d","d","g","o","o"], 
    [1,0,9,5,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0]))
print(maxScoreWords(
    ["xxxz","ax","bx","cx"], 
    ["z","a","b","c","x","x","x"], 
    [4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,10]))
print(maxScoreWords(
    ["leetcode"], 
    ["l","e","t","c","o","d"], 
    [0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0]))