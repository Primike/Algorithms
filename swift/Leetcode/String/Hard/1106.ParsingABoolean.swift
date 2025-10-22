// 't' that evaluates to true.
// 'f' that evaluates to false.
// '!(subExpr)' that evaluates to the logical NOT of the inner expression subExpr.
// '&(subExpr1, subExpr2, ..., subExprn)' that evaluates to the logical AND 
// of the inner expressions subExpr1, subExpr2, ..., subExprn where n >= 1.
// '|(subExpr1, subExpr2, ..., subExprn)' that evaluates to the logical OR 
// of the inner expressions subExpr1, subExpr2, ..., subExprn where n >= 1.
// Given a string expression that represents a boolean expression, 
// return the evaluation of that expression.

// Time: O(n), Space: O(n)
func parseBoolExpr(_ expression: String) -> Bool {
    var operators: Set<Character> = ["!", "&", "|"]
    var stack = [Character]()
    var operatorStack = [Character]()

    for char in expression {
        if operators.contains(char) {
            operatorStack.append(char)
        } else if char == "," {
            continue 
        } else if char != ")" {
            stack.append(char)
        } else {
            let sign = operatorStack.removeLast()
            var current = stack.last == "t"

            while let last = stack.last, last != "(" {
                stack.removeLast()
                let bool = last == "t"

                if sign == "&" {
                    current = current && bool
                } else if sign == "|" {
                    current = current || bool
                } else {
                    current = !current
                }
            }
            
            stack.removeLast()
            stack.append(current ? "t" : "f")
        }
    }

    return stack.last == "t"
}

print(parseBoolExpr("&(|(f))"))
print(parseBoolExpr("|(f,f,f,t)"))
print(parseBoolExpr("!(&(f,t))"))