// You are given an array of strings tokens that represents an arithmetic expression 
// in a Reverse Polish Notation.
// Evaluate the expression. Return an integer that represents the value of the expression.

func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()

    for token in tokens {
        if let number = Int(token) {
            stack.append(number)
        } else {
            let last = stack.removeLast()
            let secondLast = stack.removeLast()

            if token == "+" {
                stack.append(last + secondLast)
            } else if token == "-" {
                stack.append(secondLast - last)
            } else if token == "*" {
                stack.append(last * secondLast)
            } else if token == "/" {
                stack.append(secondLast / last)
            }
        }
    }

    return stack.last ?? 0
}

print(evalRPN(["2","1","+","3","*"]))
print(evalRPN(["4","13","5","/","+"]))
print(evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))