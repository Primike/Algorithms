class Solution {
    func longestSubsequence(_ nums: [Int]) -> Int {
        let n = nums.count
        var totalXor = 0
        var allZero = true

        for x in nums {
            totalXor ^= x
            if x > 0 {
                allZero = false
            }
        }

        if totalXor > 0 {
            return n
        }
        return !allZero ? n - 1 : 0
    }
}