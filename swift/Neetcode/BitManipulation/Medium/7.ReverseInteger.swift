// Given a signed 32-bit integer x, return x with its digits reversed. 
// If reversing x causes the value to go outside the signed 32-bit integer range 
// [-231, 231 - 1], then return 0.

// Time: O(log10(n)), Space: O(1)
func reverse(_ x: Int) -> Int {
    let isPositive = x > 0
    var x = abs(x)
    var result = 0

    while x > 0 {
        let lastDigit = x % 10
        x /= 10
        result *= 10
        result += lastDigit
    }
    
    result *= isPositive ? 1 : -1

    if result > Int32.max || result < Int32.min { return 0 }
    return result
}

print(reverse(123))
print(reverse(-123))
print(reverse(120))