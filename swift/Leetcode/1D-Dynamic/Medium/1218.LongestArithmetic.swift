// Given an integer array arr and an integer difference, 
// return the length of the longest subsequence in arr which is an 
// arithmetic sequence such that the difference between 
// adjacent elements in the subsequence equals difference.

// Time: O(n), Space: O(n)
func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
    var tab = [Int: Int]()

    for i in 0..<arr.count {
        if let value = tab[arr[i] - difference] {
            tab[arr[i]] = value + 1
        } else {
            tab[arr[i]] = 1
        }
    }

    return tab.values.max() ?? 0
}

print(longestSubsequence([1,2,3,4], 1))
print(longestSubsequence([1,3,5,7], 1))
print(longestSubsequence([1,5,7,8,5,3,4,2,1], -2))