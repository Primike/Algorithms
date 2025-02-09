// Given a string s that contains parentheses and letters, 
// remove the minimum number of invalid parentheses to make the input string valid.
// Return a list of unique strings that are valid with the minimum number of removals. 
// You may return the answer in any order.

// Time: O(2^n), Space: O(n)
func removeInvalidParentheses(_ s: String) -> [String] {
    let s = Array(s)
    var countRight = Array(repeating: 0, count: s.count + 1)

    for i in (0..<s.count).reversed() {
        countRight[i] = countRight[i + 1] + (s[i] == ")" ? 1 : 0)
    }
    
    var result = Set<String>()
    var current = [Character]()
    var minimum = Int.max
    
    func backtrack(_ i: Int, _ opened: Int, _ removed: Int) {
        if opened < 0 { return }
        if removed > minimum { return }
        if i < s.count, countRight[i] < opened { return }
        
        if i == s.count {
            if opened != 0 { return }
            if removed < minimum {
                result = []
                minimum = removed
            }
            
            result.insert(String(current))
            return
        }
        
        current.append(s[i])

        if s[i].isLetter {
            backtrack(i + 1, opened, removed)
        } else if s[i] == ")" {
            backtrack(i + 1, opened - 1, removed)
        } else if s[i] == "(" {
            backtrack(i + 1, opened + 1, removed)
        }
        current.removeLast()
        
        backtrack(i + 1, opened, removed + 1)
    }
    
    backtrack(0, 0, 0)
    return Array(result)
}

print(removeInvalidParentheses("()())()"))
print(removeInvalidParentheses("(a)())()"))
print(removeInvalidParentheses(")("))