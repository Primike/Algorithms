// Given a string array words, return an array of all characters 
// that show up in all strings within the words (including duplicates). 
// You may return the answer in any order.

// Time: O(m * n), Space: O(m * n)
func commonChars(_ words: [String]) -> [String] {
    let words = words.map { $0.reduce(into: [:]) { $0[$1, default: 0] += 1 } }
    var current = words[0]

    for i in 1..<words.count {
        var newDict = [Character: Int]()

        for (key, value) in words[i] {
            if let previous = current[key] {
                newDict[key] = min(previous, value)
            }
        }

        current = newDict
    }

    var result = [String]()

    for (key, value) in current {
        for i in 0..<value {
            result.append(String(key))
        }
    }

    return result
}

print(commonChars(["bella","label","roller"]))
print(commonChars(["cool","lock","cook"]))