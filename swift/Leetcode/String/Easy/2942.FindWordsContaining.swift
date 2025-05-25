// You are given a 0-indexed array of strings words and a character x.
// Return an array of indices representing the words 
// that contain the character x.
// Note that the returned array may be in any order.

// Time: O(n), Space: O(1)
func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
    var result = [Int]()

    for i in 0..<words.count {
        for char in words[i] {
            if char == x {
                result.append(i)
                break
            }
        }
    }

    return result
}

print(findWordsContaining(["leet","code"], "e"))
print(findWordsContaining(["abc","bcd","aaaa","cbc"], "a"))
print(findWordsContaining(["abc","bcd","aaaa","cbc"], "z"))