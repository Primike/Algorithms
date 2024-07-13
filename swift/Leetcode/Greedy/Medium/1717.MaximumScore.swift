// You are given a string s and two integers x and y. 
// You can perform two types of operations any number of times.
// Remove substring "ab" and gain x points.
// Remove substring "ba" and gain y points.
// Return the maximum points you can gain after applying the above operations on s.

// Time: O(n), Space: O(n)
func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
    let high = x > y ? "ab" : "ba"
    let low = high == "ab" ? "ba" : "ab"

    func removeSubstring(_ string: String, _ substring: String) -> String {
        var stack = [Character]()
        
        for letter in string {
            if letter == substring.last, stack.last == substring.first {
                stack.removeLast() 
            } else {
                stack.append(letter)
            }
        }
        
        return String(stack)
    }

    var result = 0

    let firstPass = removeSubstring(s, high)
    result += ((s.count - firstPass.count) / 2) * max(x, y)
    let secondPass = removeSubstring(firstPass, low)
    result += ((firstPass.count - secondPass.count) / 2) * min(x, y)
    
    return result
}

print(maximumGain("cdbcbbaaabab", 4, 5))
print(maximumGain("aabbaaxybbaabb", 5, 4))