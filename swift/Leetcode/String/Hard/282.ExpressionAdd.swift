    func addOperators(_ num: String, _ target: Int) -> [String] {
        let num = Array(num).map { String($0) }
        let operators = ["+", "-", "*"]

        func backtrack(_ index: Int, _ current: String) {
            if index >= num.count {
                checkValid(String(current.dropLast()))
                return 
            }

            if index == num.count - 1 {
                backtrack(index + 1, current + num[index] + operators[0])
            } else if num[index] == "0" {
                for sign in operators {
                    backtrack(index + 1, current + num[index] + sign)
                }
            } else {
                var string = ""

                for i in index..<num.count {
                    string += num[i]

                    if i == num.count - 1 {
                        backtrack(i + 1, current + string + operators[0])
                    } else {
                        for sign in operators {
                            backtrack(i + 1, current + string + sign)
                        }
                    }
                }
            }
        } 

        var result = [String]()

        func checkValid(_ expression: String) {
            let string = Array(expression + "+")
            var total = 0
            var number = 0
            var lastNumber = 0
            var lastOperator = Character("+")

            for i in 0..<string.count {
                if string[i].isNumber {
                    let digit = Int(String(string[i]))!
                    number = number * 10 + digit
                    continue
                } else if lastOperator == "+" {
                    total += lastNumber
                    lastNumber = number
                } else if lastOperator == "-" {
                    total += lastNumber
                    lastNumber = -number
                } else if lastOperator == "*" {
                    lastNumber *= number
                }

                lastOperator = string[i]
                number = 0
            }

            total += lastNumber
            if total == target { result.append(expression) }
        }

        backtrack(0, "")
        return result
    }