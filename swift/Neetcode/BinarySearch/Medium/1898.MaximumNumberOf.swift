// You are given two strings s and p where p is a subsequence of s. 
// You are also given a distinct 0-indexed integer array removable 
// containing a subset of indices of s (s is also 0-indexed).
// Return the maximum k you can choose such that p is still a 
// subsequence of s after the removals.

func maximumRemovals(_ s: String, _ p: String, _ removable: [Int]) -> Int {
    var s = Array(s), p = Array(p)

    func isSubsequence(_ skip: Set<Int>) -> Bool {
        var index = 0

        for (i, number) in s.enumerated() {
            if skip.contains(i) { continue }

            if index < p.count, number == p[index] { index += 1 }

            if index == p.count { break }
        }

        return index == p.count
    }

    var left = 0, right = removable.count - 1
    var result = 0

    while left <= right {
        let mid = (right + left) / 2
        let subsequence = isSubsequence(Set(removable[0...mid]))

        if subsequence {
            result = max(result, mid + 1)
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return result
}

print(maximumRemovals("abcacb", "ab", [3,1,0]))
print(maximumRemovals("abcbddddd", "abcd", [3,2,1,4,5,6]))
print(maximumRemovals("abcab", "abc", [0,1,2,3,4]))