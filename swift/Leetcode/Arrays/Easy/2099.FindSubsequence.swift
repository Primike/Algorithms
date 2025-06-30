// You are given an integer array nums and an integer k. 
// You want to find a subsequence of nums of length k that has the largest sum.
// Return any such subsequence as an integer array of length k.

// Time: O(n * log(n)), Space: O(n)
func maxSubsequence(_ nums: [Int], _ k: Int) -> [Int] {
    let nums = nums.enumerated().map { ($0.offset, $0.element) }.sorted { $0.1 < $1.1 }
    var numbers = Array(nums[(nums.count - k)..<nums.count]).sorted { $0.0 < $1.0 }
    return numbers.map { $0.1 }
}

print(maxSubsequence([2,1,3,3], 2))
print(maxSubsequence([-1,-2,3,4], 3))
print(maxSubsequence([3,4,3,3], 2))