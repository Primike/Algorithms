// Given a string s, remove duplicate letters so that every letter 
// appears once and only once. You must make sure your result is
// the smallest in lexicographical order among all possible results.

// Time: O(n), Space: O(n)
func removeDuplicateLetters(_ s: String) -> String {
    var sDict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var addedLetters = Set<Character>()
    var stack = [Character]()

    for letter in s {
        sDict[letter, default: 0] -= 1

        if addedLetters.contains(letter) { continue }

        while let last = stack.last, sDict[last, default: 0] > 0, last > letter {
            stack.removeLast()
            addedLetters.remove(last)
        }

        stack.append(letter)
        addedLetters.insert(letter)
    }

    return String(stack)
}

print(removeDuplicateLetters("bcabc"))
print(removeDuplicateLetters("cbacdcbc"))