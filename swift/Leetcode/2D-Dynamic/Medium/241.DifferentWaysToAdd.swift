// Given a string expression of numbers and operators, 
// return all possible results from computing all the 
// different possible ways to group numbers and operators. 
// You may return the answer in any order.

func diffWaysToCompute(_ expression: String) -> [Int] {
    func tokenize(_ expression: String) -> [String] {
        var tokens = [String]()
        var number = ""

        for char in expression {
            if char.isNumber {
                number.append(char)
            } else {
                if !number.isEmpty {
                    tokens.append(number)
                    number = ""
                }
                tokens.append(String(char))
            }
        }
        if !number.isEmpty { tokens.append(number) }
        return tokens
    }

    let tokens = tokenize(expression)
    var memo = [String: [Int]]()

    func compute(_ tokens: [String], _ start: Int, _ end: Int) -> [Int] {
        let key = "\(start)-\(end)"

        if let value = memo[key] { return value }

        var results = [Int]()

        if start == end {
            if let number = Int(tokens[start]) { results.append(number) }
            memo[key] = results
            return results
        }

        for i in stride(from: start + 1, to: end, by: 2) {
            let op = tokens[i]
            let leftResults = compute(tokens, start, i - 1)
            let rightResults = compute(tokens, i + 1, end)

            for left in leftResults {
                for right in rightResults {
                    if op == "+" {
                        results.append(left + right)
                    } else if op == "-" {
                        results.append(left - right)
                    } else if op == "*" {
                        results.append(left * right)
                    }
                }
            }
        }

        memo[key] = results
        return results
    }

    return compute(tokens, 0, tokens.count - 1)
}

print(diffWaysToCompute("2-1-1"))
print(diffWaysToCompute("2*3-4*5"))