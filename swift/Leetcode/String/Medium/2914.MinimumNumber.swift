// A string is beautiful if it's possible to partition 
// it into one or more substrings such that:
// Each substring has an even length.
// Each substring contains only 1's or only 0's.
// You can change any character in s to 0 or 1.
// Return the minimum number of changes required to make the string s beautiful.

// Time: O(n), Space: O(1)
func minChanges(_ s: String) -> Int {
    if s.count % 2 != 0 { return 0 }

    let s = Array(s)
    var result = 0

    for i in stride(from: 0, to: s.count, by: 2) {
        if s[i] != s[i + 1] { result += 1 }
    }

    return result 
}

print(minChanges("1001"))
print(minChanges("10"))
print(minChanges("0000"))