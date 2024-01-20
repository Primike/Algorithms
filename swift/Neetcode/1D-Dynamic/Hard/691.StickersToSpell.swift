// We are given n different types of stickers. 
// Each sticker has a lowercase English word on it.
// You would like to spell out the given string target by cutting 
// individual letters from your collection of stickers and rearranging them. 
// You can use each sticker more than once if you want, 
// and you have infinite quantities of each sticker.
// Return the minimum number of stickers that you need to spell out target. 
// If the task is impossible, return -1.

func minStickers(_ stickers: [String], _ target: String) -> Int {
    var current = Array(repeating: 0, count: 26)

    for letter in target {
        current[Int(letter.asciiValue!) - 97] += 1
    }

    var words = [[Character: Int]]()

    for sticker in stickers {
        var dict = [Character: Int]()

        for letter in sticker {
            if current[Int(letter.asciiValue!) - 97] == 0 { continue }
            dict[letter, default: 0] += 1
        }

        words.append(dict)
    }

    var memo = [[Int]: Int]()

    func dp(_ current: [Int]) -> Int {
        if current.allSatisfy { $0 == 0 } { return 0 }
        if let value = memo[current] { return value }

        var result = Int.max

        for word in words {
            var array = current, count = 0

            for (letter, value) in word {
                let i = Int(letter.asciiValue!) - 97

                if array[i] > 0 { 
                    array[i] = max(0, array[i] - value)
                    count += 1 
                }
            }

            if count > 0 { 
                let recursion = dp(array)
                if recursion != -1 { result = min(result, recursion + 1) }
            }
        }

        memo[current] = result == .max ? -1 : result
        return memo[current, default: -1]
    }

    return dp(current)
}

print(minStickers(["with","example","science"], "thehat"))
print(minStickers(["notice","possible"], "basicbasic"))