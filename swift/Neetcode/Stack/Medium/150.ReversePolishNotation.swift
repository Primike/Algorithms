//You are given an array of strings tokens that represents an arithmetic expression 
//in a Reverse Polish Notation.
//Evaluate the expression. Return an integer that represents the value of the expression.


func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()

    for token in tokens {
        if let num = Int(token) {
            stack.append(num)
        } else {
            let second = stack.removeLast()
            let first = stack.removeLast()

            switch token {
            case "+":
                stack.append(first + second)
            case "-":
                stack.append(first - second)
            case "*":
                stack.append(first * second)
            case "/":
                stack.append(first / second)
            default:
                break
            }
        }
    }
    
    return stack.last ?? 0
}

print(evalRPN(["2","1","+","3","*"]))
print(evalRPN(["4","13","5","/","+"]))
print(evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))