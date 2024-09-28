// A word is uncommon if it appears exactly once in one of the sentences, 
// and does not appear in the other sentence.
// Given two sentences s1 and s2, return a list of all the uncommon words. 
// You may return the answer in any order.

// Time: O(n), Space: O(n)
func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
    let s1 = s1.components(separatedBy: " ").reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let s2 = s2.components(separatedBy: " ").reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = [String]()

    for (key, value) in s1 {
        if value > 1 { continue }
        if s2.keys.contains(key) { continue }
        result.append(key)
    }

    for (key, value) in s2 {
        if value > 1 { continue }
        if s1.keys.contains(key) { continue }
        result.append(key)
    }

    return result
}

print(uncommonFromSentences("this apple is sweet", "this apple is sour"))
print(uncommonFromSentences("apple apple", "banana"))