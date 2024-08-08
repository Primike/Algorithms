// You are given a string num, representing a large integer. 
// Return the largest-valued odd integer (as a string) that is a 
// non-empty substring of num, or an empty string "" 
// if no odd integer exists.
// A substring is a contiguous sequence of characters within a string.

// Time: O(n), Space: O(1)
func largestOddNumber(_ num: String) -> String {
    var result = num

    for char in num.reversed() {
        let number = Int(String(char)) ?? 0 

        if number % 2 != 0 { return result }

        result.removeLast()
    }

    return result
}

print(largestOddNumber("52"))
print(largestOddNumber("4206"))
print(largestOddNumber("35427"))