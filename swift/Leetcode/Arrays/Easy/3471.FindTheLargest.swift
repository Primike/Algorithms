class Solution {
    func largestInteger(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        guard let maxVal = nums.max() else { return -1 }
        
        if n == k {
            return maxVal
        }
        
        var count = Array(repeating: 0, count: 51)
        for x in nums {
            count[x] += 1
        }
        
        if k == 1 {
            for i in stride(from: 50, through: 0, by: -1) {
                if count[i] == 1 {
                    return i
                }
            }
            return -1
        }
        
        var res = -1
        if count[nums[0]] == 1 {
            res = max(res, nums[0])
        }
        if count[nums[n - 1]] == 1 {
            res = max(res, nums[n - 1])
        }
        
        return res
    }
}