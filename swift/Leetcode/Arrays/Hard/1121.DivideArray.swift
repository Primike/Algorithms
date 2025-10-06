class Solution {
    func canDivideIntoSubsequences(_ nums: [Int], _ K: Int) -> Bool {
        guard !nums.isEmpty else {
            return true
        }

        var counts = [Int: Int]()
        for num in nums {
            counts[num, default: 0] += 1
        }

        guard let maxFreq = counts.values.max() else {
            return true 
        }

        return nums.count >= maxFreq * K
    }
}