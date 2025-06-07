class Solution {
    func robotWithString(_ s: String) -> String {
        var counts: [Character: Int] = [:]
        for char in s {
            counts[char, default: 0] += 1
        }

        var stack: [Character] = []
        var result: [Character] = []
        var minCharacter: Character = "a"

        for char in s {
            stack.append(char)
            counts[char, default: 0] -= 1

            while minCharacter < "z" && counts[minCharacter, default: 0] == 0 {
                let nextUnicode = minCharacter.unicodeScalars.first!.value + 1
                minCharacter = Character(UnicodeScalar(nextUnicode)!)
            }

            while let topOfStack = stack.last, topOfStack <= minCharacter {
                result.append(stack.removeLast())
            }
        }

        result.append(contentsOf: stack.reversed())

        return String(result)
    }
}