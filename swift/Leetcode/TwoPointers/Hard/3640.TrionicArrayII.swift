class Solution {
    func maxSumTrionic(_ nums: [Int]) -> Int {
        let n = nums.count
        var ans = Int.min
        var i = 0
        
        while i < n {
            var j = i + 1
            
            while j < n && nums[j - 1] < nums[j] {
                j += 1
            }
            let p = j - 1
            
            if p == i {
                i += 1
                continue
            }
            
            var res = nums[p] + nums[p - 1]
            j = p + 1
            while j < n && nums[j - 1] > nums[j] {
                res += nums[j]
                j += 1
            }
            let q = j - 1
            
            if q == p || q == n - 1 || nums[q + 1] <= nums[q] {
                i = q
                continue
            }
            
            res += nums[q + 1]
            
            var maxThirdSum = 0
            var currThirdSum = 0
            var k = q + 2
            while k < n && nums[k] > nums[k - 1] {
                currThirdSum += nums[k]
                maxThirdSum = max(maxThirdSum, currThirdSum)
                k += 1
            }
            res += maxThirdSum
            
            var maxFirstSum = 0
            var currFirstSum = 0
            if p - 2 >= i {
                for k in stride(from: p - 2, through: i, by: -1) {
                    currFirstSum += nums[k]
                    maxFirstSum = max(maxFirstSum, currFirstSum)
                }
            }
            res += maxFirstSum
            
            ans = max(ans, res)
            i = q
        }
        
        return ans == Int.min ? 0 : ans
    }
}