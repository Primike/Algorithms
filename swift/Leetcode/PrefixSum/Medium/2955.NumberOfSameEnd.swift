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
    var lettersCount = Array(repeating: Array(repeating: (0, false), count: s.count), count: 26)

    for i in 0..<s.count {
        let ascii = Int(s[i].asciiValue!) - 97

        for j in 0..<26 {
            let bool = ascii == j
            lettersCount[j][i].1 = bool

            if bool { lettersCount[j][i].0 += 1 }
            if i > 0 { lettersCount[j][i].0 += lettersCount[j][i - 1].0 }
        }
    }

    var result = [Int]()

    for query in queries {
        let l = query[0], r = query[1]
        var total = 0

        for i in 0..<26 {
            var count = lettersCount[i][r].0 - lettersCount[i][l].0
            count += lettersCount[i][l].1 ? 1 : 0
            total += count * (count - 1) / 2 + count
        }

        result.append(total)
    }

    return result
}

print(sameEndSubstringCount("abcaab", [[0,0],[1,4],[2,5],[0,5]]))
print(sameEndSubstringCount("abcd", [[0,3]]))