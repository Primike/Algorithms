// You are given a 0-indexed string s, and a 2D array of integers queries, 
// where queries[i] = [li, ri] indicates a substring of s starting 
// from the index li and ending at the index ri (both inclusive), i.e. s[li..ri].
// Return an array ans where ans[i] is the number of same-end substrings of queries[i].
// A 0-indexed string t of length n is called same-end 
// if it has the same character at both of its ends, i.e., t[0] == t[n - 1].
// A substring is a contiguous non-empty sequence of characters within a string.

// Time: O(n + q), Space: O(n)
func sameEndSubstringCount(_ s: String, _ queries: [[Int]]) -> [Int] {
    let s = Array(s)
    var letterCounts = Array(repeating: Array(repeating: 0, count: s.count), count: 26)
    
    for (i, letter) in s.enumerated() {
        letterCounts[Int(letter.asciiValue!) - 97][i] += 1
    }
    
    for i in 0..<26 {
        for j in 1..<s.count {
            letterCounts[i][j] += letterCounts[i][j - 1]
        }
    }
    
    var results = [Int]()
    
    for query in queries {
        let l = query[0], r = query[1]
        var substrings = 0
        
        for count in letterCounts {
            let leftCount = l == 0 ? 0 : count[l - 1]
            let rightCount = count[r]
            let total = rightCount - leftCount
            
            substrings += (total * (total + 1)) / 2
        }
        
        results.append(substrings)
    }
    
    return results
}

print(sameEndSubstringCount("abcaab", [[0,0],[1,4],[2,5],[0,5]]))
print(sameEndSubstringCount("abcd", [[0,3]]))