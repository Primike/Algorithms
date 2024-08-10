// It is allowed to remap the keys numbered 2 to 9 to 
// distinct collections of letters. The keys can be remapped 
// to any amount of letters, but each letter must be mapped 
// to exactly one key. You need to find the minimum number of times 
// the keys will be pushed to type the string word.
// Return the minimum number of pushes needed to type word 
// after remapping the keys.

// Time: O(n), Space: O(26)
func minimumPushes(_ word: String) -> Int {
    let word = word.reduce(into: [:]) { $0[$1, default: 0] += 1 }.sorted { $0.value > $1.value }
    var result = 0
    var rounds = 0

    for i in 0..<word.count {
        if i % 8 == 0 { rounds += 1 }

        let (key, value) = word[i]
        result += value * rounds
    }

    return result
}

print(minimumPushes("abcde"))
print(minimumPushes("xyzxyzxyzxyz"))
print(minimumPushes("aabbccddeeffgghhiiiiii"))