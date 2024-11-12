// Given a string expression of numbers and operators, 
// return all possible results from computing all the 
// different possible ways to group numbers and operators. 
// You may return the answer in any order.

// Time: O(n * 2^n), Space: O(n^2 * 2^n)
func diffWaysToCompute(_ expression: String) -> [Int] {
    func createExpression(_ expression: String) -> [String] {
        var array = [String]()
        var number = ""

        for char in expression {
            if char.isNumber {
                number.append(char)
            } else {
                array.append(number)
                number = ""
                array.append(String(char))
            }
        }

        array.append(number)
        return array
    }

    let expression = createExpression(expression)
    var memo = [String: [Int]]()

    func dp(_ start: Int, _ end: Int) -> [Int] {
        let key = "\(start),\(end)"

        if start == end { return [Int(expression[start]) ?? 0] }
        if let value = memo[key] { return value }

        var result = [Int]()

        for i in stride(from: start + 1, to: end, by: 2) {
            let leftResults = dp(start, i - 1)
            let rightResults = dp(i + 1, end)

            for num1 in leftResults {
                for num2 in rightResults {
                    if expression[i] == "+" {
                        result.append(num1 + num2)
                    } else if expression[i] == "-" {
                        result.append(num1 - num2)
                    } else if expression[i] == "*" {
                        result.append(num1 * num2)
                    }
                }
            }
        }

        memo[key] = result
        return result
    }

    return dp(0, expression.count - 1)
}

print(diffWaysToCompute("2-1-1"))
print(diffWaysToCompute("2*3-4*5"))