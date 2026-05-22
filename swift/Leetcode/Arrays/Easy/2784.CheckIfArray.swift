class Solution {
    func isGood(_ nums: [Int]) -> Bool {
        let n = nums.count
        var count = Array(repeating: 0, count: n)
        
        for a in nums {
            if a >= n {
                return false
            }
            if a < n - 1 && count[a] > 0 {
                return false
            }
            if a == n - 1 && count[a] > 1 {
                return false
            }
            count[a] += 1
        }
        
        return true
    }
}