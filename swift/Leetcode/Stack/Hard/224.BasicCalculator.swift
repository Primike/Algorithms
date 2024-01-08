

func calculate(_ s: String) -> Int {
    var stack = [Int]()
    var currentNumber = 0
    var result = 0 
    var sign = 1 
    
    for char in s {
        if let number = char.wholeNumberValue {
            currentNumber = 10 * currentNumber + number
        } else if char == "+" {
            result += sign * currentNumber
            sign = 1
            currentNumber = 0
        } else if char == "-" {
            result += sign * currentNumber
            sign = -1
            currentNumber = 0
        } else if char == "(" {
            stack.append(result)
            stack.append(sign)
            sign = 1
            result = 0
        } else if char == ")" {
            result += sign * currentNumber
            result *= stack.removeLast()
            result += stack.removeLast()
            currentNumber = 0
        }
    }
    
    return result + sign * currentNumber
}
