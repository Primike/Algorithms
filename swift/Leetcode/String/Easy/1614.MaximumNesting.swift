// For example, "", "()()", and "()(()())" are VPS's 
// (with nesting depths 0, 1, and 2), and ")(" and "(()" are not VPS's.
// Given a VPS represented as string s, return the nesting depth of s.

// Time: O(n), Space: O(1)
func maxDepth(_ s: String) -> Int {
    var result = 0
    var opened = 0

    for letter in s {
        if letter == "(" { opened += 1 }
        if letter == ")" { opened -= 1 }

        result = max(result, opened)
    }

    return result
}

print(maxDepth("(1+(2*3)+((8)/4))+1"))
print(maxDepth("(1)+((2))+(((3)))"))