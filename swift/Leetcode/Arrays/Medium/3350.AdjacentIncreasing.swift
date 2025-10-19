class Solution {
    func maxIncreasingSubarrays(_ nums: [Int]) -> Int {
        let n = nums.count
        var cnt = 1
        var precnt = 0
        var ans = 0

        for i in 1..<n {
            if nums[i] > nums[i - 1] {
                cnt += 1
            } else {
                precnt = cnt
                cnt = 1
            }
            ans = max(ans, min(precnt, cnt))
            ans = max(ans, cnt / 2)
        }
        
        return ans
    }
}