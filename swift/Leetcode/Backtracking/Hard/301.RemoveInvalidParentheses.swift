// Given a string s that contains parentheses and letters, 
// remove the minimum number of invalid parentheses to make the input string valid.
// Return a list of unique strings that are valid with the minimum number of removals. 
// You may return the answer in any order.

func removeInvalidParentheses(_ s: String) -> [String] {
    let s = Array(s)
    var validStrings = Set<String>()
    var current = [Character]()
    var minimum = Int.max

    func backtrack(_ i: Int, _ opened: Int, _ closed: Int, _ removed: Int) {
        if i == s.count {
            if opened == closed, removed <= minimum {
                if removed < minimum {
                    validStrings = []
                    minimum = removed
                }

                validStrings.insert(String(current))
            }
        } else {
            if s[i] != "(", s[i] != ")" {
                current.append(s[i])
                backtrack(i + 1, opened, closed, removed)
            } else {
                backtrack(i + 1, opened, closed, removed + 1)
                current.append(s[i])

                if s[i] == "(" {
                    backtrack(i + 1, opened + 1, closed, removed)
                } else if closed < opened {
                    backtrack(i + 1, opened, closed + 1, removed)
                }
            }

            current.removeLast()
        }
    }

    backtrack(0, 0, 0, 0)
    return Array(validStrings)
}

print(removeInvalidParentheses("()())()"))
print(removeInvalidParentheses("(a)())()"))
print(removeInvalidParentheses(")("))