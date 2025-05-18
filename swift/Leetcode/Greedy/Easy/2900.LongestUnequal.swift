// You are given a string array words and a 
// binary array groups both of length n.
// A subsequence of words is alternating if for any 
// two consecutive strings in the sequence, 
// their corresponding elements at the same indices 
// in groups are different (that is, there cannot be consecutive 0 or 1).
// Your task is to select the longest alternating subsequence from words.
// Return the selected subsequence. 
// If there are multiple answers, return any of them.
// Note: The elements in words are distinct.

// Time: O(n), Space: O(1)
func getLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
    let words = Array(words)
    var result = [String]()
    var last = groups[0] == 0 ? 1 : 0

    for i in 0..<groups.count {
        if groups[i] != last {
            result.append(String(words[i]))
            last = groups[i]
        }
    }

    return result
}

print(getLongestSubsequence(["e","a","b"], [0,0,1]))
print(getLongestSubsequence(["a","b","c","d"], [1,0,1,1]))