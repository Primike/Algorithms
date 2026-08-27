class Solution {
    func missingInteger(_ nums: [Int]) -> Int {
        var prefixLen = 1
        let numSet = Set(nums)
        
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] + 1 {
                prefixLen += 1
            } else {
                break
            }
        }
        
        var total = (nums[prefixLen - 1] + nums[0]) * prefixLen / 2
        
        while numSet.contains(total) {
            total += 1
        }
        
        return total
    }
}