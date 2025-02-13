// You are given a 0-indexed array of strings words and a 2D array of integers queries.
// Each query queries[i] = [li, ri] asks us to find the number of strings present 
// in the range li to ri (both inclusive) of words that start and end with a vowel.
// Return an array ans of size queries.length, 
// where ans[i] is the answer to the ith query.

func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
    let words = words.map { Array($0) }
    var vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    var prefixSum = Array(repeating: (0, false), count: words.count)
    var total = 0

    for i in 0..<words.count {
        var isVowel = false

        if vowels.contains(words[i][0]), vowels.contains(words[i][words[i].count - 1]) {
            total += 1
            isVowel = true
        }

        prefixSum[i] = (total, isVowel)
    }

    var result = [Int]()

    for query in queries {
        var count = prefixSum[query[1]].0 - prefixSum[query[0]].0
        if prefixSum[query[0]].1 { count += 1 }
        result.append(count)
    }

    return result
}

print(vowelStrings(["aba","bcb","ece","aa","e"], [[0,2],[1,4],[1,1]]))
print(vowelStrings(["a","e","i"], [[0,2],[0,1],[2,2]]))