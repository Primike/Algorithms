class Solution {
    func findMissingElements(_ nums: [Int]) -> [Int] {
        guard let mn = nums.min(), let mx = nums.max() else {
            return []
        }
        
        let st = Set(nums)
        var result = [Int]()
        
        if mn + 1 < mx {
            for x in (mn + 1)..<mx {
                if !st.contains(x) {
                    result.append(x)
                }
            }
        }
        
        return result
    }
}