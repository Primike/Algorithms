// Given a string s representing a valid expression, 
// implement a basic calculator to evaluate it, and 
// return the result of the evaluation.
// Note: You are not allowed to use any built-in function 
// which evaluates strings as mathematical expressions, such as eval().

// Time: O(n), Space: O(n)
func calculate(_ s: String) -> Int {
    var stack = [Int]()
    var current = 0 
    var number = 0
    var sign = 1 
    
    for char in s {
        if let digit = Int(String(char)) {
            number = 10 * number + digit
        } else if char == "+" || char == "-" {
            current += sign * number
            sign = char == "+" ? 1 : -1
            number = 0
        } else if char == "(" {
            stack.append(current)
            stack.append(sign)
            sign = 1
            current = 0
        } else if char == ")" {
            current += sign * number
            current *= stack.removeLast()
            current += stack.removeLast()
            number = 0
        }
    }
    
    return current + sign * number
}

print(calculate("1 + 1"))
print(calculate(" 2-1 + 2 "))
print(calculate("(1+(4+5+2)-3)+(6+8)"))