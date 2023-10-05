// Increment the large integer by one and return the resulting array of digits.

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    digits[digits.count - 1] += 1

    for i in stride(from: digits.count - 1, to: -1, by: -1) {
        if digits[i] == 10, i > 0 {
            digits[i - 1] += 1
            digits[i] = 0
        }
    }

    if digits[0] == 10 {
        digits[0] = 0
        digits = [1] + digits
    }

    return digits
}

print(plusOne([1,2,3]))
print(plusOne([4,3,2,1]))
print(plusOne([9]))