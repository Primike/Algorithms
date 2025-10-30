class Solution {
    func countValidSelections(_ nums: [Int]) -> Int {
        let n = nums.count
        var ans = 0
        let s = nums.reduce(0, +)
        var left = 0
        var right = s
        
        for i in 0..<n {
            if nums[i] == 0 {
                if 0 <= left - right && left - right <= 1 {
                    ans += 1
                }
                if 0 <= right - left && right - left <= 1 {
                    ans += 1
                }
            } else {
                left += nums[i]
                right -= nums[i]
            }
        }
        return ans
    }
}