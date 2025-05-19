func calculate(_ s: String) -> Int {
    let s = Array(s + "+")
    var lastOperation: Character = "+"
    var result = 0
    var current = 0
    var last = 0

    for i in 0..<s.count {
        if s[i] == " " { continue }

        if s[i].isNumber {
            current = current * 10 + Int(String(s[i]))!
            continue
        } else if lastOperation == "+" {
            result += last
            last = current
        } else if lastOperation == "-" {
            result += last
            last = -current
        } else if lastOperation == "*" {
            last *= current
        } else if lastOperation == "/" {
            last /= current
        }

        lastOperation = s[i]
        current = 0
    }

    result += last 
    return result
}

func calculate(_ s: String) -> Int {
    let s = Array("+" + s).filter { $0 != " " }
    let operators: Set<Character> = ["*", "/"]
    var result = 0
    var i = 0

    while i < s.count {
        let isNegative = s[i] == "-"
        var lastOperator: Character?
        var total = 0
        var number = 0
        i += 1

        while i < s.count, (operators.contains(s[i]) || s[i].isNumber) {
            if s[i].isNumber {
                number = number * 10 + Int(String(s[i]))!
            } else if let char = lastOperator {
                if char == "*" {
                    total *= number
                } else {
                    total /= number
                }

                lastOperator = s[i]
                number = 0
            } else {
                total = number
                lastOperator = s[i]
                number = 0
            }

            i += 1
        }

        if let char = lastOperator {
            if char == "*" {
                total *= number
            } else {
                total /= number
            }
        } else {
            total = number
        }

        result += isNegative ? -total : total
    }

    return result
}