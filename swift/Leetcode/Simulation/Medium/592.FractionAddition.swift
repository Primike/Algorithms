// Given a string expression representing an expression of 
// fraction addition and subtraction, return the calculation 
// result in string format.
// The final result should be an irreducible fraction. 
// If your final result is an integer, change it to the format 
// of a fraction that has a denominator 1. 
// So in this case, 2 should be converted to 2/1.

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
    var numerator = 0
    var denominator = 1
    var i = 0

    while i < expression.count {
        var currentNumerator = 0
        var currentDenominator = 0
        var isNegative = false
        
        if expression[i] == "-" || expression[i] == "+" {
            if expression[i] == "-" { isNegative = true }
            i += 1
        }
        
        while i < expression.count, let value = expression[i].wholeNumberValue {
            currentNumerator = currentNumerator * 10 + value
            i += 1
        }
        
        if isNegative { currentNumerator *= -1 }
        
        i += 1
        
        while i < expression.count, let value = expression[i].wholeNumberValue {
            currentDenominator = currentDenominator * 10 + value
            i += 1
        }
        
        numerator = numerator * currentDenominator + currentNumerator * denominator
        denominator = denominator * currentDenominator
    }
    
    let gcd = abs(euclidian(numerator, denominator))
    numerator /= gcd
    denominator /= gcd
    
    return "\(numerator)/\(denominator)"
}

print(fractionAddition("-1/2+1/2"))
print(fractionAddition("-1/2+1/2+1/3"))
print(fractionAddition("1/3-1/2"))