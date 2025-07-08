// You are given a string s of length n, and an integer k. 
// You are tasked to find the longest subsequence repeated k times in string s.
// A subsequence seq is repeated k times in the string s if seq * k 
// is a subsequence of s, where seq * k represents a string constructed 
// by concatenating seq k times.
// Return the longest subsequence repeated k times in string s. 
// If multiple such subsequences are found, return the 
// lexicographically largest one. If there is no such subsequence, 
// return an empty string.

func longestSubsequenceRepeatedK(_ s: String, _ k: Int) -> String {
    var dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var validChars = [String]()

    for (key, value) in dict {
        if value >= k { validChars.append(String(key)) }
    }

    validChars.sort { $0 > $1 }
    var queue = validChars
    var result = ""

    while !queue.isEmpty {
        let first = queue.removeFirst()
        if first.count > result.count { result = first }
        
        for char in validChars {
            let next = first + char
            let target = Array(String(repeating: next, count: k))
            var i = 0
            
            for char in s {
                if char == target[i] { i += 1 }
    
                if i == target.count { 
                    queue.append(next)
                    break 
                }
            }
        }
    }
    
    return result
}

print(longestSubsequenceRepeatedK("letsleetcode", 2))
print(longestSubsequenceRepeatedK("bb", 2))
print(longestSubsequenceRepeatedK("ab", 2))