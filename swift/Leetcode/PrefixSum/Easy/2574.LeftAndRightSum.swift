class Solution {
    func leftRightDifference(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = Array(repeating: 0, count: n)

        var leftSum = 0
        for i in 0..<n {
            ans[i] = leftSum
            leftSum += nums[i]
        }

        var rightSum = 0
        for i in stride(from: n - 1, through: 0, by: -1) {
            ans[i] = abs(ans[i] - rightSum)
            rightSum += nums[i]
        }

        return ans
    }
}