// A digit string is good if the digits (0-indexed) at even indices 
// are even and the digits at odd indices are prime (2, 3, 5, or 7).
// For example, "2582" is good because the digits (2 and 8) at 
// even positions are even and the digits (5 and 2) 
// at odd positions are prime. However, "3245" is not good because 3 
// is at an even index but is not even.
// Given an integer n, return the total number of 
// good digit strings of length n. Since the answer may be large, 
// return it modulo 109 + 7.
// A digit string is a string consisting of digits 0 through 9 
// that may contain leading zeros.

// Time: O(log2(n)), Space: O(1)
func countGoodNumbers(_ n: Int) -> Int {
    let mod = 1_000_000_007

    func fastExponentiation(_ base: Int, _ power: Int) -> Int {
        var result = 1
        var base = base
        var power = power

        while power > 0 {
            if power % 2 == 1 { result = (result * base) % mod }

            base = (base * base) % mod
            power /= 2
        }

        return result
    }

    let even = (n + 1) / 2, odd = n / 2
    let evenCombinations = fastExponentiation(5, even)
    let oddCombinations = fastExponentiation(4, odd)

    return (evenCombinations * oddCombinations) % mod
}

print(countGoodNumbers(1))
print(countGoodNumbers(4))
print(countGoodNumbers(50))