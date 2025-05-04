// A parentheses string is valid if and only if:
// It is the empty string,
// It can be written as AB (A concatenated with B), 
// where A and B are valid strings, or
// It can be written as (A), where A is a valid string.
// You are given a parentheses string s. 
// In one move, you can insert a parenthesis at any position of the string.
// Return the minimum number of moves required to make s valid.

// Time: O(n), Space: O(1)
func minAddToMakeValid(_ s: String) -> Int {
    var result = 0
    var opened = 0

    for bracket in s {
        if bracket == "(" {
            opened += 1
        } else {
            opened -= 1
        }

        if opened < 0 {
            result += 1
            opened = 0
        }
    }

    return result + opened
}

print(minAddToMakeValid("())"))
print(minAddToMakeValid("((("))