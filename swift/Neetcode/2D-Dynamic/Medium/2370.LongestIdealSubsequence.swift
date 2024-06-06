// You are given a string s consisting of lowercase letters and an integer k. 
// We call a string t ideal if the following conditions are satisfied:
// t is a subsequence of the string s.
// The absolute difference in the alphabet order of every two adjacent 
// letters in t is less than or equal to k.
// Return the length of the longest ideal string.

// Time: O(n * 26), Space: O(26)
func longestIdealString(_ s: String, _ k: Int) -> Int {
    let s = Array(s)
    var tab = Array(repeating: 0, count: 26)
    var result = 0
    
    for i in 0..<s.count {
        let ascii1 = Int(s[i].asciiValue! - 97)
        var longest = 0

        for ascii2 in 0..<26 {
            if abs(ascii1 - ascii2) <= k { longest = max(longest, tab[ascii2]) }
        }

        tab[ascii1] = max(tab[ascii1], longest + 1)
        result = max(result, tab[ascii1])
    }
    
    return result
}

print(longestIdealString("acfgbd", 2))
print(longestIdealString("abcd", 3))