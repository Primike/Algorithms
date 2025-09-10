// Given a string s which represents an expression, 
// evaluate this expression and return its value. 
// The integer division should truncate toward zero.
// You may assume that the given expression is always valid. 
// All intermediate results will be in the range of [-231, 231 - 1].

// Time: O(n), Space: O(1)
func calculate(_ s: String) -> Int {
    let s = s + "+"
    var result = 0
    var last = 0
    var lastOperator = Character("+")
    var current = 0

    for char in s {
        if char == " " { continue }

        if char.isNumber {
            current = (current * 10) + (char.wholeNumberValue ?? 0)
            continue 
        } else if lastOperator == "+" {
            result += last
            last = current
        } else if lastOperator == "-" {
            result += last
            last = -current
        } else if lastOperator == "*" {
            last *= current
        } else if lastOperator == "/" {
            last /= current
        }

        lastOperator = char
        current = 0
    }

    return result + last
}

print(calculate("3+2*2"))
print(calculate(" 3/2 "))
print(calculate(" 3+5 / 2 "))


func calculate2(_ s: String) -> Int {
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