// Given the binary representation of an integer as a string s, 
// return the number of steps to reduce it to 1 under the following rules:
// If the current number is even, you have to divide it by 2.
// If the current number is odd, you have to add 1 to it.
// It is guaranteed that you can always reach one for all test cases.

func numSteps(_ s: String) -> Int {
    let sArray = Array(s)
    var operations = 0
    var carry = 0

    for i in stride(from: s.count - 1, to: 0, by: -1) {
        let digit = Int(String(sArray[i]))! + carry

        if digit % 2 == 1 {
            operations += 2
            carry = 1
        } else {
            operations += 1
        }
    }
    
    return operations + carry
}

print(numSteps("1101"))
print(numSteps("10"))
print(numSteps("1"))