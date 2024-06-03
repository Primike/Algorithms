// An integer has sequential digits if and only if each digit in 
// the number is one more than the previous digit.
// Return a sorted list of all the integers in the range [low, high] 
// inclusive that have sequential digits.

func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
    var result = [Int]()

    for startDigit in 1...9 {
        var num = startDigit
        var nextDigit = startDigit + 1

        while nextDigit <= 9 {
            num = num * 10 + nextDigit
            if num >= low && num <= high { result.append(num) }
            nextDigit += 1
        }
    }

    return result.sorted()
}

print(sequentialDigits(100, 300))
print(sequentialDigits(1000, 13000))