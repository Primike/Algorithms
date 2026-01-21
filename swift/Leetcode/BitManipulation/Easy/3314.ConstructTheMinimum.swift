class Solution {
    func minBitwiseArray(_ nums: [Int]) -> [Int] {
        var result = nums
        for i in 0..<result.count {
            var res = -1
            var d = 1
            while (result[i] & d) != 0 {
                res = result[i] - d
                d <<= 1
            }
            result[i] = res
        }
        return result
    }
}