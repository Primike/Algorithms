class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 {
            return "0"
        }

        var fraction: [String] = []
        if (numerator < 0) != (denominator < 0) {
            fraction.append("-")
        }

        var dividend = abs(numerator)
        let divisor = abs(denominator)

        fraction.append(String(dividend / divisor))
        var remainder = dividend % divisor
        if remainder == 0 {
            return fraction.joined()
        }

        fraction.append(".")
        var lookup: [Int: Int] = [:]
        while remainder != 0 {
            if let index = lookup[remainder] {
                fraction.insert("(", at: index)
                fraction.append(")")
                break
            }

            lookup[remainder] = fraction.count
            remainder *= 10
            fraction.append(String(remainder / divisor))
            remainder %= divisor
        }

        return fraction.joined()
    }
}