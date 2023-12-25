// You are given two strings s and p where p is a subsequence of s. 
// You are also given a distinct 0-indexed integer array removable 
// containing a subset of indices of s (s is also 0-indexed).
// Return the maximum k you can choose such that p is still a 
// subsequence of s after the removals.

// right + 1 b/c they want k not index
func maximumRemovals(_ s: String, _ p: String, _ removable: [Int]) -> Int {
    var s = Array(s), p = Array(p)

    func isSubsequence(_ indices: Set<Int>) -> Bool {
        var j = 0

        for (i, number) in s.enumerated() {
            if j == p.count { break }
            if indices.contains(i) { continue }
            if number == p[j] { j += 1 }
        }

        return j == p.count
    }

    var left = 0, right = removable.count - 1

    while left <= right {
        let mid = (right + left) / 2

        if isSubsequence(Set(removable[0...mid])) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return right >= 0 ? right + 1 : 0
}

print(maximumRemovals("abcacb", "ab", [3,1,0]))
print(maximumRemovals("abcbddddd", "abcd", [3,2,1,4,5,6]))
print(maximumRemovals("abcab", "abc", [0,1,2,3,4]))