// Given a string s and a dictionary of strings wordDict, 
// return true if s can be segmented into a space-separated sequence 
// of one or more dictionary words.

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var s = Array(s)
    var tab = Array(repeating: false, count: s.count + 1)
    tab[0] = true

    for i in 0..<s.count {
        if tab[i] == false { continue }

        let current = String(s[i...])

        for word in wordDict {
            if current.hasPrefix(word) { tab[i + word.count] = true }
        }
    }

    return tab[s.count]
}

print(wordBreak("leetcode", ["leet","code"]))
print(wordBreak("applepenapple", ["apple","pen"]))
print(wordBreak("catsandog", ["cats","dog","sand","and","cat"]))

func wordBreak2(_ s: String, _ wordDict: [String]) -> Bool {
    let s = Array(s)
    var memo = [Int: Bool]()

    func dp(_ i: Int) -> Bool {
        if i == s.count { return true }
        if let value = memo[i] { return value }

        let string = String(s[i...])
        var result = false 

        for word in wordDict {
            if string.hasPrefix(word) { result = result || dp(i + word.count) }
        }

        memo[i] = result
        return result
    }

    return dp(0)
}