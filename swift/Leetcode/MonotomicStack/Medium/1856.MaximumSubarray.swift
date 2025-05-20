class Solution {
    func maxSumMinProduct(_ nums: [Int]) -> Int {
        let n = nums.count
        let MOD = 1_000_000_007

        var prefixSum: [Int64] = Array(repeating: 0, count: n + 1)
        for i in 0..<n {
            prefixSum[i + 1] = prefixSum[i] + Int64(nums[i])
        }

        var left: [Int] = Array(repeating: -1, count: n)
        var stackPle: [Int] = []
        for i in 0..<n {
            while let lastIndex = stackPle.last, nums[lastIndex] >= nums[i] {
                stackPle.removeLast()
            }
            if let lastIndex = stackPle.last {
                left[i] = lastIndex
            }
            stackPle.append(i)
        }

        var right: [Int] = Array(repeating: n, count: n)
        var stackNle: [Int] = []
        for i in stride(from: n - 1, through: 0, by: -1) {
             while let lastIndex = stackNle.last, nums[lastIndex] >= nums[i] {
                stackNle.removeLast()
             }
             if let lastIndex = stackNle.last {
                 right[i] = lastIndex
             }
             stackNle.append(i)
        }

        var maxProduct: Int64 = 0
        for i in 0..<n {
            let lBoundExclusive = left[i]
            let rBoundExclusive = right[i]
            
            let currentSum: Int64 = prefixSum[rBoundExclusive] - prefixSum[lBoundExclusive + 1]
            let currentProduct: Int64 = Int64(nums[i]) * currentSum
            maxProduct = max(maxProduct, currentProduct)
        }

        return Int(maxProduct % Int64(MOD))
    }
}