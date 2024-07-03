// Given a string s and a dictionary of strings wordDict, add spaces 
// in s to construct a sentence where each word is a valid dictionary word. 
// Return all such possible sentences in any order.

// Time: O(n * 2^n), Space: O(n * 2^n)
func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    let s = Array(s).map { String($0) }
    let wordDict = Set(wordDict)
    let alphaSet = Set(wordDict.joined())

    for letter in s {
        if !alphaSet.contains(letter) { return [] }
    }

    var memo = [Int: [String]]()

    func dp(_ index: Int) -> [String] {
        if index == s.count { return [""] }
        if let value = memo[index] { return value }

        var result = [String]()
        var word = ""

        for i in index..<s.count {
            word += s[i]
            
            if !wordDict.contains(word) { continue }

            for sentence in dp(i + 1) {
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