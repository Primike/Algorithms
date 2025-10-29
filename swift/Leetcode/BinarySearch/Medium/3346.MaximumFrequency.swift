class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int, _ numOperations: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }

        let sortedNums = nums.sorted()
        var ans = 0
        var numCount = [Int: Int]()
        var lastNumIndex = 0

        for i in 0..<sortedNums.count {
            if sortedNums[i] != sortedNums[lastNumIndex] {
                let count = i - lastNumIndex
                numCount[sortedNums[lastNumIndex]] = count
                ans = max(ans, count)
                lastNumIndex = i
            }
        }

        let lastCount = sortedNums.count - lastNumIndex
        numCount[sortedNums[lastNumIndex]] = lastCount
        ans = max(ans, lastCount)

        func bisectLeft(_ arr: [Int], _ x: Int) -> Int {
            var low = 0
            var high = arr.count
            while low < high {
                let mid = (low + high) / 2
                if arr[mid] < x {
                    low = mid + 1
                } else {
                    high = mid
                }
            }
            return low
        }

        func bisectRight(_ arr: [Int], _ x: Int) -> Int {
            var low = 0
            var high = arr.count
            while low < high {
                let mid = (low + high) / 2
                if arr[mid] <= x {
                    low = mid + 1
                } else {
                    high = mid
                }
            }
            return low
        }

        if let first = sortedNums.first, let last = sortedNums.last {
            for i in first...last {
                let l = bisectLeft(sortedNums, i - k)
                let r = bisectRight(sortedNums, i + k) - 1
                
                let tempAns: Int
                if let count = numCount[i] {
                    tempAns = min(r - l + 1, count + numOperations)
                } else {
                    tempAns = min(r - l + 1, numOperations)
                }
                ans = max(ans, tempAns)
            }
        }

        return ans
    }
}