// Implement pow(x, n), which calculates x 
// raised to the power n (i.e., xn).

// Time: O(log(n)), Space: O(1)
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 { return 1 }
    if x == 0 { return 0 }

    var result = 1.0
    var exponent = abs(n)
    var current = x

    while exponent > 0 {
        if exponent % 2 == 1 { result *= current }
        
        current *= current
        exponent /= 2
    }

    return n > 0 ? result : 1 / result
}

print(myPow(2.00000, 10))
print(myPow(2.10000, 3))
print(myPow(2.00000, -2))


// Time: O(log(n)), Space: O(log(n))
func myPow(_ x: Double, _ n: Int) -> Double {
    var memo = [Int: Double]()

    func dp(_ power: Int) -> Double {
        if power == 0 { return 1.0 }
        if power == 1 { return x }
        if let value = memo[power] { return value }

        let firstPower = power / 2
        let secondPower = power - firstPower
        let current = dp(firstPower) * dp(secondPower)

        memo[power] = current
        return current
    }

    let result = dp(abs(n))
    return n < 0 ? 1.0 / result : result
}