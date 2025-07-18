// First, convert s into an integer by replacing 
// each letter with its position in the alphabet 
// (i.e., replace 'a' with 1, 'b' with 2, ..., 'z' with 26). 
// Then, transform the integer by replacing it with the sum of its digits. 
// Repeat the transform operation k times in total.
// For example, if s = "zbax" and k = 2, 
// then the resulting integer would be 8 by the following operations:
// Convert: "zbax" ➝ "(26)(2)(1)(24)" ➝ "262124" ➝ 262124
// Transform #1: 262124 ➝ 2 + 6 + 2 + 1 + 2 + 4 ➝ 17
// Transform #2: 17 ➝ 1 + 7 ➝ 8
// Return the resulting integer after performing the operations 
// described above.

// Time: O(n), Space: O(n)
func getLucky(_ s: String, _ k: Int) -> Int {
    var current = Array(s).map { String(Int($0.asciiValue!) - 96) }.joined()
    
    for _ in 0..<k {
        let sum = current.map { Int(String($0))! }.reduce(0, +)
        current = String(sum)
    }

    return Int(current)!
}

print(getLucky("iiii", 1))
print(getLucky("leetcode", 2))
print(getLucky("zbax", 2))


func getLucky2(_ s: String, _ k: Int) -> Int {
    var result = ""

    for char in s {
        result += String(Int(char.asciiValue!) - 96)
    }

    var sum = 0

    for _ in 0..<k {
        for digit in result {
            sum += Int(String(digit)) ?? 0
        }

        result = String(sum)
        sum = 0
    }

    return Int(result) ?? 0
}