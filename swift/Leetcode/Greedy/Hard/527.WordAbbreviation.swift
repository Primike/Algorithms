class Solution {
    func wordsAbbreviation(_ words: [String]) -> [String] {
        func abbrev(_ word: String, _ i: Int = 0) -> String {
            if word.count - i <= 3 {
                return word
            }
            let prefixStr = String(word.prefix(i + 1))
            let num = String(word.count - i - 2)
            guard let lastChar = word.last else { return word }
            let suffix = String(lastChar)
            return "\(prefixStr)\(num)\(suffix)"
        }

        let n = words.count
        var ans = words.map { abbrev($0) }
        var prefix = [Int](repeating: 0, count: n)

        for i in 0..<n {
            while true {
                var dupes = Set<Int>()
                for j in (i + 1)..<n {
                    if ans[i] == ans[j] {
                        dupes.insert(j)
                    }
                }

                if dupes.isEmpty {
                    break
                }

                dupes.insert(i)
                
                for k in dupes {
                    prefix[k] += 1
                    ans[k] = abbrev(words[k], prefix[k])
                }
            }
        }
        
        return ans
    }
}