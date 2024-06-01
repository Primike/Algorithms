// A string is good if it can be formed by characters from chars 
// (each character can only be used once).
// Return the sum of lengths of all good strings in words.

// Time: O(m * n), Space: O(n)
func countCharacters(_ words: [String], _ chars: String) -> Int {
    var dict = chars.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0

    for word in words {
        let wordDict = word.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        var valid = true 

        for (key, value) in wordDict {
            if let count = dict[key], count >= value {
                continue 
            } else {
                valid = false
                break
            }
        }

        result += valid ? word.count : 0
    }

    return result
}

print(countCharacters(["cat","bt","hat","tree"], "atach"))
print(countCharacters(["hello","world","leetcode"], "welldonehoneyr"))