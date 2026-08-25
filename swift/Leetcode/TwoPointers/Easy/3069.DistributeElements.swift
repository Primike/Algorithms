class Solution {
    func resultArray(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var arr = [Int](repeating: 0, count: n)
        arr[0] = nums[0]
        arr[n - 1] = nums[1]
        var idx = 0
        var revIdx = n - 1
        
        for i in 2..<n {
            if arr[idx] > arr[revIdx] {
                idx += 1
                arr[idx] = nums[i]
            } else {
                revIdx -= 1
                arr[revIdx] = nums[i]
            }
        }
        
        var l = revIdx
        var r = n - 1
        while l < r {
            arr.swapAt(l, r)
            l += 1
            r -= 1
        }
        
        return arr
    }
}