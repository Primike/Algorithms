class Solution {
    func minMoves(_ nums: [Int], _ limit: Int) -> Int {
        let n = nums.count
        var sumCount = [Int: Int]()
        var minArr = [Int]()
        var maxArr = [Int]()
        
        for i in 0..<(n / 2) {
            let a = min(nums[i], nums[n - 1 - i])
            let b = max(nums[i], nums[n - 1 - i])
            
            sumCount[a + b, default: 0] += 1
            minArr.append(a)
            maxArr.append(b)
        }
        
        minArr.sort()
        maxArr.sort()
        
        var minOps = n
        
        for c in 2...(2 * limit) {
            let addLeft = (n / 2) - bisectLeft(minArr, c)
            let addRight = bisectLeft(maxArr, c - limit)
            
            let currentOps = (n / 2) + addLeft + addRight - (sumCount[c] ?? 0)
            minOps = min(minOps, currentOps)
        }
        
        return minOps
    }
    
    private func bisectLeft(_ array: [Int], _ value: Int) -> Int {
        var low = 0
        var high = array.count
        while low < high {
            let mid = low + (high - low) / 2
            if array[mid] < value {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}