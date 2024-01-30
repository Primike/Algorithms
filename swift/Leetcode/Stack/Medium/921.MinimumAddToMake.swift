// A parentheses string is valid if and only if:
// It is the empty string,
// It can be written as AB (A concatenated with B), 
// where A and B are valid strings, or
// It can be written as (A), where A is a valid string.
// You are given a parentheses string s. 
// In one move, you can insert a parenthesis at any position of the string.
// Return the minimum number of moves required to make s valid.

// Time: O(n), Space: O(n)
func minAddToMakeValid(_ s: String) -> Int {
    var stack = [Character]()
    
    for letter in s {
        if let last = stack.last, letter == ")", last == "(" {
            stack.removeLast()  
        } else {
            stack.append(letter)
        }
    }

    return stack.count
}

print(minAddToMakeValid("())"))
print(minAddToMakeValid("((("))