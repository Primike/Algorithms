class Solution {
    func maxTotalValue(_ nums: [Int], _ k: Int) -> Int {
        guard let minVal = nums.min(), let maxVal = nums.max() else {
            return 0
        }
        return (maxVal - minVal) * k
    }
}