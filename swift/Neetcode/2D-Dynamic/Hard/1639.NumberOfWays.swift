// Your task is to form target using the given words under the following rules:
// To form the ith character (0-indexed) of target, 
// you can choose the kth character of the jth string in words if target[i] = words[j][k].
// Once you use the kth character of the jth string of words, 
// you can no longer use the xth character of any string in words where x <= k. 
// In other words, all characters to the left of or at index k become unusuable for every string.
// Repeat the process until you form the string target.
// Return the number of ways to form target from words.

// Time: O(n * l + target * l), Space: O(l)
func numWays(_ words: [String], _ target: String) -> Int {
    let mod = 1_000_000_007
    let words = words.map { Array($0) }, target = Array(target)
    var wordCounts = Array(repeating: [Character: Int](), count: words[0].count)

    for word in words {
        for i in 0..<word.count {
            wordCounts[i][word[i], default: 0] += 1
        }
    }

    var tab = Array(repeating: 0, count: wordCounts.count + 1)

    for j in 0..<tab.count {
        tab[j] = 1
    }

    for i in 1...target.count {
        var nextRow = Array(repeating: 0, count: wordCounts.count + 1)

        for j in 1...wordCounts.count {
            nextRow[j] = nextRow[j - 1] % mod

            if let count = wordCounts[j - 1][target[i - 1]] {
                nextRow[j] += (tab[j - 1] * count) % mod
            }

            nextRow[j] %= mod
        }

        tab = nextRow
    }

    return tab[wordCounts.count]
}

print(numWays(["acca","bbbb","caca"], "aba"))
print(numWays(["abba","baab"], "bab"))


func numWays2(_ words: [String], _ target: String) -> Int {
    let mod = 1_000_000_007
    let words = words.map { Array($0) }, target = Array(target)
    var wordCounts = Array(repeating: [Character: Int](), count: words[0].count)

    for word in words {
        for i in 0..<word.count {
            wordCounts[i][word[i], default: 0] += 1
        }
    }

    var tab = Array(repeating: Array(repeating: 0, count: wordCounts.count + 1), count: target.count + 1)

    for j in 0..<tab[0].count {
        tab[0][j] = 1
    }

    for i in 1...target.count {
        for j in 1...wordCounts.count {
            tab[i][j] = tab[i][j - 1] % mod

            if let count = wordCounts[j - 1][target[i - 1]] {
                tab[i][j] += (tab[i - 1][j - 1] * count) % mod
            }

            tab[i][j] %= mod
        }
    }

    return tab[target.count][wordCounts.count]
}

func numWays3(_ words: [String], _ target: String) -> Int {
    let mod = 1_000_000_007
    let words = words.map { Array($0) }, target = Array(target)
    var wordCounts = Array(repeating: [Character: Int](), count: words[0].count)

    for word in words {
        for i in 0..<word.count {
            wordCounts[i][word[i], default: 0] += 1
        }
    }

    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i == target.count { return 1 }
        if j == wordCounts.count { return 0 }
        if let value = memo[key] { return value }

        var result = (dp(i, j + 1)) % mod

        if let count = wordCounts[j][target[i]] {
            result += (dp(i + 1, j + 1) * count) % mod
        }

        result %= mod
        memo[key] = result
        return result
    }

    return dp(0, 0)
}