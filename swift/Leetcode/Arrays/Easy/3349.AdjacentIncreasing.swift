class Solution {
    func hasIncreasingSubarrays(_ nums: [Int], _ k: Int) -> Bool {
        let n = nums.count
        var inc = 1
        var prevInc = 0
        var maxLen = 0

        for i in 1..<n {
            if nums[i] > nums[i - 1] {
                inc += 1
            } else {
                prevInc = inc
                inc = 1
            }
            maxLen = max(maxLen, max(inc / 2, min(prevInc, inc)))
            if maxLen >= k {
                return true
            }
        }
        
        return false
    }
}