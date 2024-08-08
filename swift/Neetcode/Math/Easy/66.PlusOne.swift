// Increment the large integer by one and 
// return the resulting array of digits.

// Time: O(n), Space: O(1)
func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    var carry = true

    for i in (0..<digits.count).reversed() {
        if !carry { return digits }

        digits[i] += 1

        if digits[i] == 10 { 
            carry = true 
            digits[i] = 0
        } else {
            carry = false
        }
    }

    if carry { return [1] + digits }
    return digits
}

print(plusOne([1,2,3]))
print(plusOne([4,3,2,1]))
print(plusOne([9]))