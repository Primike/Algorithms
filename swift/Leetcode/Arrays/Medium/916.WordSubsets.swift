// A string b is a subset of string a if every letter in b occurs 
// in a including multiplicity.
// For example, "wrr" is a subset of "warrior" but is not a subset of "world".
// A string a from words1 is universal if for every string b in words2, 
// b is a subset of a.
// Return an array of all the universal strings in words1. 
// You may return the answer in any order.

// Time: O(n + m), Space: O(n + m)
func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
    var words1Dicts = [[Character: Int]]()

    for word in words1 {
        let dict = word.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        words1Dicts.append(dict)
    }

    var lettersMax = [Character: Int]()

    for word in words2 {
        let dict = word.reduce(into: [:]) { $0[$1, default: 0] += 1 }

        for (letter, count) in dict {
            lettersMax[letter] = max(lettersMax[letter, default: 0], count)
        }
    }

    var result = [String]()

    for i in 0..<words1Dicts.count {
        let dict = words1Dicts[i]
        var isValid = true

        for (letter, count) in lettersMax {
            if dict[letter, default: 0] < count{ 
                isValid = false
                break
            }
        }

        if isValid { result.append(words1[i]) }
    }

    return result
}

print(wordSubsets(["amazon","apple","facebook","google","leetcode"], ["e","o"]))
print(wordSubsets(["amazon","apple","facebook","google","leetcode"], ["lc","eo"]))
print(wordSubsets(["acaac","cccbb","aacbb","caacc","bcbbb"], ["c","cc","b"]))