class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int, _ numOperations: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }

        let sortedNums = nums.sorted()
        var ans = 0
        var numCount = [Int: Int]()
        var modes = Set<Int>()
        
        guard let firstNum = sortedNums.first, let lastNum = sortedNums.last else {
            return 0
        }

        func addMode(_ value: Int) {
            modes.insert(value)
            if value - k >= firstNum {
                modes.insert(value - k)
            }
            if value + k <= lastNum {
                modes.insert(value + k)
            }
        }

        var lastNumIndex = 0
        for i in 0..<sortedNums.count {
            if sortedNums[i] != sortedNums[lastNumIndex] {
                let count = i - lastNumIndex
                numCount[sortedNums[lastNumIndex]] = count
                ans = max(ans, count)
                addMode(sortedNums[lastNumIndex])
                lastNumIndex = i
            }
        }

        let lastCount = sortedNums.count - lastNumIndex
        numCount[sortedNums[lastNumIndex]] = lastCount
        ans = max(ans, lastCount)
        addMode(sortedNums[lastNumIndex])

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

        for mode in modes.sorted() {
            let l = bisectLeft(sortedNums, mode - k)
            let r = bisectRight(sortedNums, mode + k) - 1
            
            let tempAns: Int
            if let count = numCount[mode] {
                tempAns = min(r - l + 1, count + numOperations)
            } else {
                tempAns = min(r - l + 1, numOperations)
            }
            ans = max(ans, tempAns)
        }

        return ans
    }
}