// Given a sequence of words written in the alien language, and the order of the 
// alphabet, return true if and only if the given words are sorted lexicographically 
// in this alien language.

// Time: char, Space: 26
func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    let dict = Dictionary(uniqueKeysWithValues: order.enumerated().map { ($1, $0) })
    let wordsArray = words.map { Array($0) }

    for i in 0..<wordsArray.count - 1 {
        let w1 = wordsArray[i]
        let w2 = wordsArray[i + 1]
        
        for j in 0..<w1.count {
            if j == w2.count { return false }
            
            if w1[j] != w2[j] {
                if dict[w2[j]]! < dict[w1[j]]! { return false }
                break
            }
        }
    }

    return true
}

print(isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
print(isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz"))
print(isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz"))