class Solution {
    func countMajoritySubarrays(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        var pre = Array(repeating: 0, count: n * 2 + 1)
        pre[n] = 1
        
        var cnt = n
        var ans = 0
        var presum = 0
        
        for i in 0..<n {
            if nums[i] == target {
                presum += pre[cnt]
                cnt += 1
                pre[cnt] += 1
            } else {
                cnt -= 1
                presum -= pre[cnt]
                pre[cnt] += 1
            }
            ans += presum
        }
        
        return ans
    }
}