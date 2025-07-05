// You are given a 0-indexed array of strings words and a 2D array of integers queries.
// Each query queries[i] = [li, ri] asks us to find the number of strings present 
// in the range li to ri (both inclusive) of words that start and end with a vowel.
// Return an array ans of size queries.length, 
// where ans[i] is the answer to the ith query.

// Time: O(n), Space: O(n)
func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    var prefixSum = Array(repeating: (0, false), count: words.count)
    var count = 0

    for (i, word) in words.enumerated() {
        let isValid = vowels.contains(word.first!) && vowels.contains(word.last!)
        if isValid { count += 1 }

        prefixSum[i] = (count, isValid)
    }

    var result = Array(repeating: 0, count: queries.count)

    for (i, query) in queries.enumerated() {
        result[i] = prefixSum[query[1]].0 - prefixSum[query[0]].0
        if prefixSum[query[0]].1 { result[i] += 1 } 
    }

    return result
}

print(vowelStrings(["aba","bcb","ece","aa","e"], [[0,2],[1,4],[1,1]]))
print(vowelStrings(["a","e","i"], [[0,2],[0,1],[2,2]]))