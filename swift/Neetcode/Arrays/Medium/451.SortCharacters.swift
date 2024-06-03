// Given a string s, sort it in decreasing order based on 
// the frequency of the characters. 
// The frequency of a character is the number of times it appears in the string.
// Return the sorted string. If there are multiple answers, return any of them.

// Time: O(n * logn), Space: O(n)
func frequencySort(_ s: String) -> String {
    var dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var frequency = [(Character, Int)]()

    for (key, value) in dict {
        frequency.append((key, value))
    }

    frequency.sort { $0.1 > $1.1 }
    var result = ""

    for (letter, count) in frequency {
        result += String(repeating: letter, count: count)
    }

    return result
}

print(frequencySort("tree"))
print(frequencySort("cccaaa"))
print(frequencySort("Aabb"))