// Given a string s, reverse the order of characters 
// in each word within a sentence while still preserving 
// whitespace and initial word order.

// Time: O(n), Space: O(n)
func reverseWords(_ s: String) -> String {
    let s = Array(s)
    var result = ""
    var word = ""

    for i in 0..<s.count {
        if s[i] == " " { 
            result += word.reversed() + " " 
            word = ""
        } else {
            word.append(s[i])
        }
    } 

    result += word.reversed()
    return result
}

print(reverseWords("Let's take LeetCode contest"))
print(reverseWords("Mr Ding"))