// You are given a string s that consists of 
// lower case English letters and brackets.
// Reverse the strings in each pair of matching parentheses, 
// starting from the innermost one.

// Time: O(n), Space: O(n)
func reverseParentheses(_ s: String) -> String {
    let s = Array(s).map { String($0) } 
    var stack = [String]()

    for char in s {
        if char != ")" {
            stack.append(char)
        } else {
            var string = ""

            while let last = stack.last, last != "(" {
                string += last.reversed()
                stack.removeLast()
            }

            stack.removeLast()
            stack.append(string)
        }
    }

    return stack.joined()
}

print(reverseParentheses("(abcd)"))
print(reverseParentheses("(u(love)i)"))
print(reverseParentheses("(ed(et(oc))el)"))