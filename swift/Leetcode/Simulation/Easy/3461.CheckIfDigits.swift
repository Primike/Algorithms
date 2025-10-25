// You are given a string s consisting of digits. 
// Perform the following operation repeatedly until the string 
// has exactly two digits:
// For each pair of consecutive digits in s, 
// starting from the first digit, calculate a new digit 
// as the sum of the two digits modulo 10.
// Replace s with the sequence of newly calculated digits, 
// maintaining the order in which they are computed.
// Return true if the final two digits in s are the same; 
// otherwise, return false.

// Time: O(n^2), Space: O(n)
func hasSameDigits(_ s: String) -> Bool {
    var current = Array(s).map { String($0) }

    while current.count > 2 {
        var newArray = [String]()

        for i in 1..<current.count {
            let number1 = Int(current[i - 1])!
            let number2 = Int(current[i])!
            let sum = (number1 + number2) % 10
            newArray.append(String(sum))
        }

        current = newArray
    }

    return current[0] == current[1]
}

print(hasSameDigits("3902"))
print(hasSameDigits("34789"))