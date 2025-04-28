// Given a balanced parentheses string s, return the score of the string.
// The score of a balanced parentheses string is based on the following rule:
// "()" has score 1.
// AB has score A + B, where A and B are balanced parentheses strings.
// (A) has score 2 * A, where A is a balanced parentheses string.

// Time: O(n), Space: O(1)
func scoreOfParentheses(_ s: String) -> Int {
    let s = Array(s)
    var opened = 0
    var result = 0

    for (i, bracket) in s.enumerated() {
        if bracket == "(" {
            opened += 1
        } else {
            opened -= 1
            
            if i > 0, s[i - 1] == "(" {
                result += Int(pow(2.0, Double(opened)))
            }                
        }
    }

    return result
}

print(scoreOfParentheses("()"))
print(scoreOfParentheses("(())"))
print(scoreOfParentheses("()()"))