class Solution {
    func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
        var result = 0

        for number in nums {
            if number == target { result += 1 }
        }

        return result > (nums.count / 2)
    }
}