// wordA is a predecessor of wordB if and only if we can insert exactly 
// one letter anywhere in wordA without changing the order of the 
// other characters to make it equal to wordB.
// Return the length of the longest possible word chain 
// with words chosen from the given list of words.

// Time: O(n^2 * l), Space: O(n)
func longestStrChain(_ words: [String]) -> Int {
    let words = words.sorted { ($0.count, $0) < ($1.count, $1) }.map { Array($0) }
    var tab = Array(repeating: 1, count: words.count)

    for i in 0..<words.count {
        for j in 0..<i {
            if words[i].count - words[j].count != 1 { continue }

            var count = 0
            var left = 0, right = 0

            while left < words[i].count, right < words[j].count {
                if words[i][left] != words[j][right] { 
                    count += 1
                } else {
                    right += 1
                }

                left += 1
            }

            if count <= 1 { tab[i] = max(tab[i], tab[j] + 1) }
        }
    }

    return tab.max() ?? 0
}

print(longestStrChain(["a","b","ba","bca","bda","bdca"]))
print(longestStrChain(["xbc","pcxbcf","xb","cxbc","pcxbc"]))
print(longestStrChain(["abcd","dbqca"]))