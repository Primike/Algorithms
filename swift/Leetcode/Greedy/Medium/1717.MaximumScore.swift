// You are given a string s and two integers x and y. 
// You can perform two types of operations any number of times.
// Remove substring "ab" and gain x points.
// Remove substring "ba" and gain y points.
// Return the maximum points you can gain after applying the above operations on s.

// Time: O(n), Space: O(n)
func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
    let s = Array(s).map { String($0) }
    var leading = x > y ? "a" : "b", trailing = x > y ? "b" : "a"
    var maxVal = x > y ? x : y, minVal = x > y ? y : x
    var result = 0
    var leadingStack = [String]()

    for letter in s {
        if let last = leadingStack.last, last == leading, letter == trailing {
            leadingStack.removeLast()
            result += maxVal
        } else {
            leadingStack.append(letter)
        }
    }

    var trailingStack = [String]()
    
    for letter in leadingStack {
        if let last = trailingStack.last, last == trailing, letter == leading {
            trailingStack.removeLast()
            result += minVal
        } else {
            trailingStack.append(letter)
        }
    }
    
    return result
}

print(maximumGain("cdbcbbaaabab", 4, 5))
print(maximumGain("aabbaaxybbaabb", 5, 4))