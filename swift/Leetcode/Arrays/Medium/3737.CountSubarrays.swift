class Solution {
    func countMajoritySubarrays(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        var ans = 0
        
        for i in 0..<n {
            var cnt = 0
            for j in i..<n {
                cnt += (nums[j] == target) ? 1 : -1
                if cnt > 0 {
                    ans += 1
                }
            }
        }
        return ans
    }
}