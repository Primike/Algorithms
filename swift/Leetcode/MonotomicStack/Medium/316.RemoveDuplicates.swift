// Given a string s, remove duplicate letters so that every letter 
// appears once and only once. You must make sure your result is
// the smallest in lexicographical order among all possible results.

// Time: O(n), Space: O(n)
func removeDuplicateLetters(_ s: String) -> String {
    var dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var monotomic = [Character]()
    var visited = Set<Character>()

    for letter in s {
        dict[letter, default: 1] -= 1

        if dict[letter] == 0 { dict[letter] = nil }
        if visited.contains(letter) { continue }

        while let last = monotomic.last, last > letter, dict.keys.contains(last) {
            monotomic.removeLast()
            visited.remove(last)
        }

        monotomic.append(letter)
        visited.insert(letter)
    }

    return String(monotomic)
}

print(removeDuplicateLetters("bcabc"))
print(removeDuplicateLetters("cbacdcbc"))