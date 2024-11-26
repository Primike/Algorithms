// You are given a 0-indexed string s, and a 2D array of integers queries, 
// where queries[i] = [li, ri] indicates a substring of s starting 
// from the index li and ending at the index ri (both inclusive), i.e. s[li..ri].
// Return an array ans where ans[i] is the number of same-end substrings of queries[i].
// A 0-indexed string t of length n is called same-end 
// if it has the same character at both of its ends, i.e., t[0] == t[n - 1].
// A substring is a contiguous non-empty sequence of characters within a string.

func sameEndSubstringCount(_ s: String, _ queries: [[Int]]) -> [Int] {
    let n = s.count
    var charFreqPrefixSum = Array(repeating: Array(repeating: 0, count: n), count: 26)
    let sArray = Array(s)
    
    for (i, char) in sArray.enumerated() {
        charFreqPrefixSum[Int(char.asciiValue! - Character("a").asciiValue!)][i] += 1
    }
    
    for i in 0..<26 {
        for j in 1..<n {
            charFreqPrefixSum[i][j] += charFreqPrefixSum[i][j - 1]
        }
    }
    
    var results = [Int]()
    
    for query in queries {
        let leftIndex = query[0]
        let rightIndex = query[1]
        var countSameEndSubstrings = 0
        
        for freq in charFreqPrefixSum {
            let leftFreq = leftIndex == 0 ? 0 : freq[leftIndex - 1]
            let rightFreq = freq[rightIndex]
            let frequencyInRange = rightFreq - leftFreq
            
            countSameEndSubstrings += (frequencyInRange * (frequencyInRange + 1)) / 2
        }
        
        results.append(countSameEndSubstrings)
    }
    
    return results
}

print(sameEndSubstringCount("abcaab", [[0,0],[1,4],[2,5],[0,5]]))
print(sameEndSubstringCount("abcd", [[0,3]]))