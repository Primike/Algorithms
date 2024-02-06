// A confusing number is a number that when rotated 180 degrees 
// becomes a different number with each digit valid.
// We can rotate digits of a number by 180 degrees to form new digits.
// Given an integer n, return the number of confusing numbers 
// in the inclusive range [1, n].

func confusingNumberII(_ n: Int) -> Int {
    var valid: [Int: Int] = [
        0: 0, 1: 1, 6: 9, 8: 8, 9: 6]
    var result = 0

    func isConfusing(_ number: Int) -> Bool {
        var rotated = number
        var result = 0

        while rotated > 0 {
            result = result * 10 + valid[rotated % 10]!
            rotated /= 10
        }
        
        return result != number
    }

    func backtrack(_ number: Int) {
        if number > n { return }
        if isConfusing(number) { result += 1 }

        for digit in valid.keys {
            if number == 0, digit == 0 { continue }
            backtrack(number * 10 + digit)
        }
    }

    backtrack(0)
    return result
}

print(confusingNumberII(20))
print(confusingNumberII(100))