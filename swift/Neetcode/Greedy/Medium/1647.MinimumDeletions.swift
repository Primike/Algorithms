// A string s is called good if there are no two different characters 
// in s that have the same frequency.
// Given a string s, return the minimum number of characters you need 
// to delete to make s good.

// Time: O(n * logn), Space: O(26)
func minDeletions(_ s: String) -> Int {
    let dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var sorted = Array(dict.map { $0.value }).sorted(by: >)
    var result = 0

    for i in 1..<sorted.count {
        if sorted[i] >= sorted[i - 1] {
            let deletionsNeeded = sorted[i] - max(0, sorted[i - 1] - 1)
            result += deletionsNeeded
            sorted[i] -= deletionsNeeded
        }
    }

    return result
}

print(minDeletions("aab"))
print(minDeletions("aaabbbcc"))
print(minDeletions("ceabaacb"))