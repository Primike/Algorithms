class Solution {
    func maxSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = 0
        var maxSum = Int.min
        var kSum = Array(repeating: Int.max / 2, count: k)
        kSum[k - 1] = 0

        for i in 0..<nums.count {
            prefixSum += nums[i]
            let index = i % k
            maxSum = max(maxSum, prefixSum - kSum[index])
            kSum[index] = min(kSum[index], prefixSum)
        }

        return maxSum
    }
}