// Given a string num that contains only digits and an integer target, 
// return all possibilities to insert the binary operators '+', '-', 
// and/or '*' between the digits of num so that the resultant expression 
// evaluates to the target value.
// Note that operands in the returned expressions 
// should not contain leading zeros.

// Time: O(4^n * n), Space(n^2)
func addOperators(_ num: String, _ target: Int) -> [String] {
    let num = Array(num).map { String($0) }
    let operators = ["+", "-", "*"]
    var result = [String]()

    func checkExpression(_ expression: String) {
        let expression = expression + "+"
        var total = 0
        var last = 0
        var lastOperator = Character("+")
        var current = 0

        for char in expression {
            if char == " " { continue }

            if char.isNumber {
                current = (current * 10) + (char.wholeNumberValue ?? 0)
                continue 
            } else if lastOperator == "+" {
                total += last
                last = current
            } else if lastOperator == "-" {
                total += last
                last = -current
            } else if lastOperator == "*" {
                last *= current
            }

            lastOperator = char
            current = 0
        }

        if total + last == target { 
            result.append(String(expression.dropLast())) 
        }
    }

    func backtrack(_ i: Int, _ string: String) {
        if i == num.count - 1 {
            checkExpression(string + num[i])
            return
        }

        if !(num[i] == "0" && operators.contains(String(string.last ?? "+"))) {
            backtrack(i + 1, string + num[i]) 
        }

        for sign in operators {
            backtrack(i + 1, string + num[i] + sign)
        }
    }

    backtrack(0, "")
    return result
}

print(addOperators("123", 6))
print(addOperators("232", 8))
print(addOperators("3456237490", 9191))