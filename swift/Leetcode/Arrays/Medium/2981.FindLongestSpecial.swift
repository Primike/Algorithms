// You are given a string s that consists of lowercase English letters.
// A string is called special if it is made up of only a single character. 
// For example, the string "abc" is not special, whereas the strings "ddd", 
// "zz", and "f" are special.
// Return the length of the longest special substring of s which occurs 
// at least thrice, or -1 if no special substring occurs at least thrice.
// A substring is a contiguous non-empty sequence of characters 
// within a string.

// Time: O(n^2), Space: O(n^2)
func maximumLength(_ s: String) -> Int {
    let s = Array(s)
    var substrings = [String: Int]()
    
    for i in 0..<s.count {
        let letter = s[i]
        var j = i

        while j < s.count, s[i] == s[j] {
            j += 1
            let key = "\(letter),\(j - i)"
            substrings[key, default: 0] += 1
        }
    }
    
    var result = 0

    for (key, value) in substrings {
        let components = key.split(separator: ",")
        let length = Int(components[1]) ?? 0
        
        if value >= 3 { result = max(result, length) }
    }
    
    return result == 0 ? -1 : result
}

print(maximumLength("aaaa"))
print(maximumLength("abcdef"))
print(maximumLength("abcaba"))