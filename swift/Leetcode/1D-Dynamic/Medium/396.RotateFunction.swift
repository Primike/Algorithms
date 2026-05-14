class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        let n = nums.count
        var numSum = 0
        var f = 0
        
        for (i, num) in nums.enumerated() {
            numSum += num
            f += i * num
        }
        
        var res = f
        for i in stride(from: n - 1, through: 1, by: -1) {
            f = f + numSum - n * nums[i]
            res = max(res, f)
        }
        
        return res
    }
}