class Solution {
    func minRemoval(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let sortedNums = nums.sorted()
        var ans = n
        var right = 0
        
        for left in 0..<n {
            while right < n && sortedNums[right] <= sortedNums[left] * k {
                right += 1
            }
            ans = min(ans, n - (right - left))
        }
        
        return ans
    }
}