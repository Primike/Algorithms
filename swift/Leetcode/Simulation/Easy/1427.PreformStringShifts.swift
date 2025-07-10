// You are given a string s containing lowercase English letters, 
// and a matrix shift, where shift[i] = [directioni, amounti]:
// directioni can be 0 (for left shift) or 1 (for right shift).
// amounti is the amount by which string s is to be shifted.
// A left shift by 1 means remove the first character of s 
// and append it to the end.
// Similarly, a right shift by 1 means remove the last character 
// of s and add it to the beginning.
// Return the final string after all operations.

// Time: O(n), Space: O(n)
func stringShift(_ s: String, _ shift: [[Int]]) -> String {
    var total = 0

    for i in 0..<shift.count {
        total += shift[i][0] == 0 ? -shift[i][1] : shift[i][1]
    }

    let s = Array(s)
    var result = Array(s)

    for i in 0..<s.count {
        let index = ((i + total) % s.count + s.count) % s.count
        result[index] = s[i]
    }

    return String(result)
}

print(stringShift("abc", [[0,1],[1,2]]))
print(stringShift("abcdefg", [[1,1],[1,1],[0,2],[1,3]]))