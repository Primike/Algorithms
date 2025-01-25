// You can perform the following process on s any number of times:
// Choose an index i in the string such that there is at least 
// one character to the left of index i that is equal to s[i], 
// and at least one character to the right that is also equal to s[i].
// Delete the closest character to the left of index i that is equal to s[i].
// Delete the closest character to the right of index i that is equal to s[i].
// Return the minimum length of the final string s that you can achieve.

// Time: O(n), Space: O(26)
func minimumLength(_ s: String) -> Int {
    let dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0

    for (key, value) in dict {
        if value < 3 {
            result += value
        } else if value % 2 == 0 {
            result += 2
        } else {
            result += 1
        }
    }

    return result
}

print(minimumLength("abaacbcbb"))
print(minimumLength("aa"))