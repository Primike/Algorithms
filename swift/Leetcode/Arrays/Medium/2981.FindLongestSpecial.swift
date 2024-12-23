// You are given a string s that consists of lowercase English letters.
// A string is called special if it is made up of only a single character. 
// For example, the string "abc" is not special, whereas the strings "ddd", 
// "zz", and "f" are special.
// Return the length of the longest special substring of s which occurs 
// at least thrice, or -1 if no special substring occurs at least thrice.
// A substring is a contiguous non-empty sequence of characters 
// within a string.

func maximumLength(_ s: String) -> Int {
    var count: [String: Int] = [:]
    var countStrings = 0
    let characters = Array(s)
    
    for start in 0..<characters.count {
        let character = characters[start]
        var substringLength = 0
        
        for end in start..<characters.count {
            if character == characters[end] {
                substringLength += 1
                let key = "\(character)-\(substringLength)"
                count[key, default: 0] += 1
            } else {
                break
            }
        }
    }
    
    var result = 0

    for (key, value) in count {
        let components = key.split(separator: "-")
        let length = Int(components[1]) ?? 0
        if value >= 3, length > result { result = length }
    }
    
    return result == 0 ? -1 : result
}

print(maximumLength("aaaa"))
print(maximumLength("abcdef"))
print(maximumLength("abcaba"))