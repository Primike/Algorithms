// You are given a string num representing a large integer. 
// An integer is good if it meets the following conditions:
// It is a substring of num with length 3.
// It consists of only one unique digit.
// Return the maximum good integer as a string or an 
// empty string "" if no such integer exists.

// Time: O(n), Space: O(1)
func largestGoodInteger(_ num: String) -> String {
    let num = Array(num)
    var result = ""

    for i in 1..<num.count - 1 {
        if num[i] == num[i - 1], num[i] == num[i + 1] {
            let number = String(repeating: num[i], count: 3)
            result = max(result, number)
        }
    }

    return result
}

print(largestGoodInteger("6777133339"))
print(largestGoodInteger("2300019"))
print(largestGoodInteger("42352338"))