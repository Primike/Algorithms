class Solution {
    func findKDistantIndices(_ nums: [Int], _ key: Int, _ k: Int) -> [Int] {
        var res: [Int] = []
        let n = nums.count
        
        for i in 0..<n {
            for j in 0..<n {
                if nums[j] == key && abs(i - j) <= k {
                    res.append(i)
                    break
                }
            }
        }
        return res
    }
}