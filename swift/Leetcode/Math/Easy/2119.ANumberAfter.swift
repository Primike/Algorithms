// Reversing an integer means to reverse all its digits.
// For example, reversing 2021 gives 1202. 
// Reversing 12300 gives 321 as the leading zeros are not retained.
// Given an integer num, reverse num to get reversed1, 
// then reverse reversed1 to get reversed2. 
// Return true if reversed2 equals num. Otherwise return false.

// Time: O(log10(n)), Space: O(1)
func isSameAfterReversals(_ num: Int) -> Bool {
    var current = num
    var reversed = 0

    while current > 0 {
        let lastDigit = current % 10
        reversed = (reversed * 10) + lastDigit
        current /= 10
    }

    var result = 0

    while reversed > 0 {
        let lastDigit = reversed % 10
        result = (result * 10) + lastDigit
        reversed /= 10
    }

    return result == num
}

print(isSameAfterReversals(526))
print(isSameAfterReversals(1800))
print(isSameAfterReversals(0))