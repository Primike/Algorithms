// Given two non-negative integers num1 and num2 represented as strings, 
// return the product of num1 and num2, also represented as a string.

// Time: O(n1 * n2), Space: O(n1 * n2)
func multiply(_ num1: String, _ num2: String) -> String {
    let num1 = Array(num1).map { Int(String($0)) ?? 1 }
    let num2 = Array(num2).map { Int(String($0)) ?? 1 }
    var multiplication = [[Int]]()
    var zeros = 0

    for x in num2.reversed() {
        var array = Array(repeating: 0, count: zeros)
        var carry = 0

        for y in num1.reversed() {
            let product = x * y + carry
            array.append(product % 10)
            carry = (product - product % 10) / 10
        }

        zeros += 1
        if carry > 0 { array += Array(String(carry)).map { Int(String($0)) ?? 0 } }
        multiplication.append(array)
    }

    multiplication = multiplication.reversed()
    var result = [Int]()
    var carry = 0

    for col in 0..<multiplication[0].count {
        var sum = carry

        for row in 0..<multiplication.count {
            if col >= multiplication[row].count { break }
            sum += multiplication[row][col]
        }

        result.append(sum % 10)
        carry = (sum - sum % 10) / 10
    }

    if carry > 0 { result += Array(String(carry)).map { Int(String($0)) ?? 0 } }

    let number = result.map { String($0) }.reversed()
    if number.allSatisfy { $0 == "0" } { return "0" }
    
    return number.joined()
}

print(multiply("2", "3"))
print(multiply("123", "456"))