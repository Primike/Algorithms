// You are given a string s consisting of lowercase English letters. 
// A duplicate removal consists of choosing two adjacent and 
// equal letters and removing them.
// We repeatedly make duplicate removals on s until we no longer can.
// Return the final string after all such duplicate removals have been made. 
// It can be proven that the answer is unique.

// Time: O(n), Space: O(n)
func removeDuplicates(_ s: String) -> String {
    var stack = [Character]()

    for char in s {
        if let last = stack.last, last == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }

    return String(stack)
}

print(removeDuplicates("abbaca"))
print(removeDuplicates("azxxzy"))