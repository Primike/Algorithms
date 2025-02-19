// You have n  tiles, where each tile has one letter tiles[i] printed on it.
// Return the number of possible non-empty sequences of letters 
// you can make using the letters printed on those tiles.

// Time: O(n!), Space: O(n)
func numTilePossibilities(_ tiles: String) -> Int {
    var dict = tiles.reduce(into: [:]) { $0[$1, default: 0] += 1 }

    func backtrack(_ current: String) -> Int {
        if current.count == tiles.count { return 1 }

        var result = 1

        for (key, value) in dict {
            if value == 0 { continue }

            dict[key]! -= 1
            result += backtrack(current + String(key))
            dict[key]! += 1
        }

        return result
    }

    return backtrack("") - 1
}

print(numTilePossibilities("AAB"))
print(numTilePossibilities("AAABBC"))
print(numTilePossibilities("V"))