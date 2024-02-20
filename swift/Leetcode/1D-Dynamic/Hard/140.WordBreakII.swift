// Given a string s and a dictionary of strings wordDict, add spaces 
// in s to construct a sentence where each word is a valid dictionary word. 
// Return all such possible sentences in any order.

func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    let s = Array(s), wordDict = Set(wordDict)
    let alphaSet = Set(wordDict.joined())

    for letter in s {
        if !alphaSet.contains(letter) { return [] }
    }

    var memo = [Int: [String]]()

    func dp(_ index: Int) -> [String] {
        if index == s.count { return [""] }
        if let value = memo[index] { return value }

        var result = [String]()

        for i in (index + 1)...s.count {
            let word = String(s[index..<i])
            
            if !wordDict.contains(word) { continue }

            let sentences = dp(i)

            for sentence in sentences {
                result.append(sentence.isEmpty ? word : word + " " + sentence)
            }
        }

        memo[index] = result
        return result
    }

    return dp(0)
}

print(wordBreak("catsanddog", ["cat","cats","and","sand","dog"]))
print(wordBreak("pineapplepenapple", ["apple","pen","applepen","pine","pineapple"]))
print(wordBreak("catsandog", ["cats","dog","sand","and","cat"]))