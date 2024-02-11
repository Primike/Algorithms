// A transformation sequence from word beginWord to word endWord using a dictionary 
// wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:
// Every adjacent pair of words differs by a single letter.
// Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
// sk == endWord
// Given two words, beginWord and endWord, and a dictionary wordList, 
// return the number of words in the shortest transformation sequence from beginWord to endWord, 
// or 0 if no such sequence exists.

// Use hashmap better
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    var wordList = Set(wordList.map { Array($0) })
    let beginWord = Array(beginWord), endWord = Array(endWord)
    if !wordList.contains(endWord) { return 0 }
    
    wordList.remove(beginWord)
    var queue = [beginWord]
    var result = 1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()
            
            for word in wordList {
                var count = 0

                for i in 0..<word.count {
                    if first[i] != word[i] { count += 1 }
                    if count >= 2 { break }
                }

                if count <= 1 {
                    if word == endWord { return result + 1}
                    queue.append(word)
                    wordList.remove(word)
                }
            }
        }

        result += 1
    }

    return 0
}

print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log"]))