// Given a string expression representing an expression of 
// fraction addition and subtraction, return the calculation 
// result in string format.
// The final result should be an irreducible fraction. 
// If your final result is an integer, change it to the format 
// of a fraction that has a denominator 1. 
// So in this case, 2 should be converted to 2/1.

// Time: O(n), Space: O(n)
func fractionAddition(_ expression: String) -> String {
    func euclidian(_ x: Int, _ y: Int) -> Int {
        var x = x, y = y
        
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        
        return x
    }

    let expression = Array(expression)
    var last = (0, 1)
    var i = 0

    while i < expression.count {
        var numerator = 0
        var denominator = 0
        var isNegative = false
        
        if expression[i] == "-" || expression[i] == "+" {
            if expression[i] == "-" { isNegative = true }
            i += 1
        }
        
        while i < expression.count, let value = expression[i].wholeNumberValue {
            numerator = numerator * 10 + value
            i += 1
        }
        
        if isNegative { numerator *= -1 }
        i += 1
        
        while i < expression.count, let value = expression[i].wholeNumberValue {
            denominator = denominator * 10 + value
            i += 1
        }
        
        let nextNumerator = last.0 * denominator + numerator * last.1
        let nextDenominator = last.1 * denominator
        last = (nextNumerator, nextDenominator)
    }
    
    let gcd = abs(euclidian(last.0, last.1))
    let numerator = last.0 / gcd
    let denominator = last.1 / gcd
    
    return "\(numerator)/\(denominator)"
}

print(fractionAddition("-1/2+1/2"))
print(fractionAddition("-1/2+1/2+1/3"))
print(fractionAddition("1/3-1/2"))