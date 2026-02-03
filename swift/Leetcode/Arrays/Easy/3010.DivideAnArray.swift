class Solution {
    func minimumCost(_ nums: [Int]) -> Int {
        var result = Int.max

        for i in 1..<nums.count {
            for j in (i + 1)..<nums.count {
                result = min(result, nums[0] + nums[i] + nums[j])
            }
        }

        return result
    }
}