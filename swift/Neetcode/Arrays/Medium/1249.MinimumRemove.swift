// Given a string s of '(' , ')' and lowercase English characters.
// Your task is to remove the minimum number of parentheses 
// ( '(' or ')', in any positions ) so that the resulting parentheses string 
// is valid and return any valid string.

// Time: O(n), Space: O(n)
func minRemoveToMakeValid(_ s: String) -> String {
    let s = Array(s)
    var stack = [Int]()

    for i in 0..<s.count {
        if s[i].isLetter { continue }

        if let last = stack.last, s[last] == "(", s[i] == ")" {
            stack.removeLast()
        } else {
            stack.append(i)
        }
    }

    var indexToRemove = Set(stack)
    var result = ""

    for i in 0..<s.count {
        if !indexToRemove.contains(i) { result += String(s[i]) }
    }

    return result
}