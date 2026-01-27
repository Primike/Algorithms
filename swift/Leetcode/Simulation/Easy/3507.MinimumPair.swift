class Solution {
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        var mutableNums = nums
        var count = 0

        while mutableNums.count > 1 {
            var isAscending = true
            var minSum = Int.max
            var targetIndex = -1

            for i in 0..<(mutableNums.count - 1) {
                let pairSum = mutableNums[i] + mutableNums[i + 1]

                if mutableNums[i] > mutableNums[i + 1] {
                    isAscending = false
                }

                if pairSum < minSum {
                    minSum = pairSum
                    targetIndex = i
                }
            }

            if isAscending {
                break
            }

            count += 1
            mutableNums[targetIndex] = minSum
            mutableNums.remove(at: targetIndex + 1)
        }

        return count
    }
}