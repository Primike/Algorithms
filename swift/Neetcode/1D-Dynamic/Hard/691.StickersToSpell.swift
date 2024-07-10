// We are given n different types of stickers. 
// Each sticker has a lowercase English word on it.
// You would like to spell out the given string target by cutting 
// individual letters from your collection of stickers and rearranging them. 
// You can use each sticker more than once if you want, 
// and you have infinite quantities of each sticker.
// Return the minimum number of stickers that you need to spell out target. 
// If the task is impossible, return -1.

func minStickers(_ stickers: [String], _ target: String) -> Int {
    var word = Array(repeating: 0, count: 26)

    for letter in target {
        word[Int(letter.asciiValue!) - 97] += 1
    }

    var words = [[Character: Int]]()

    for sticker in stickers {
        var dict = [Character: Int]()

        for letter in sticker {
            if word[Int(letter.asciiValue!) - 97] == 0 { continue }
            dict[letter, default: 0] += 1
        }

        words.append(dict)
    }

    var memo = [[Int]: Int]()

    func dp(_ word: [Int]) -> Int {
        if word.allSatisfy { $0 == 0 } { return 0 }
        if let value = memo[word] { return value }

        var result = Int.max

        for sticker in words {
            var array = word
            var modifiedWord = false

            for (letter, value) in sticker {
                let i = Int(letter.asciiValue!) - 97
                if array[i] <= 0 { continue }

                array[i] = max(0, array[i] - value)
                modifiedWord = true
            }

            if modifiedWord { 
                let subproblem = dp(array)
                if subproblem != -1 { result = min(result, subproblem + 1) }
            }
        }

        memo[word] = result == .max ? -1 : result
        return memo[word, default: -1]
    }

    return dp(word)
}

print(minStickers(["with","example","science"], "thehat"))
print(minStickers(["notice","possible"], "basicbasic"))