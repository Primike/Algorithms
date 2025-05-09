// Given two non-negative integers, num1 and num2 represented as string, 
// return the sum of num1 and num2 as a string.

// Time: O(n), Space: O(n)
func addStrings(_ num1: String, _ num2: String) -> String {
    let num1 = Array(num1).map { String($0) }
    let num2 = Array(num2).map { String($0) } 
    var result = [Int]()
    var i = num1.count - 1, j = num2.count - 1
    var carry = false

    while i >= 0 || j >= 0 {
        var total = carry ? 1 : 0

        if i >= 0 { total += Int(num1[i])! }
        if j >= 0 { total += Int(num2[j])! }            

        carry = total >= 10 
        result.append(total % 10)
        i -= 1
        j -= 1
    }

    if carry { result.append(1) }
    return result.map { String($0) }.reversed().joined()
}

print(addStrings("11", "123"))
print(addStrings("456", "77"))
print(addStrings("0", "0"))