class Solution {
    func minimumDifference(_ nums: [Int]) -> Int {
        let n = nums.count / 3
        
        var part1 = Array(repeating: 0, count: n + 1)
        var total = nums[0..<n].reduce(0, +)
        var ql = Heap(.maxHeap, Array(nums[0..<n]))
        part1[0] = total
        
        for i in n..<(n * 2) {
            total += nums[i]
            ql.push(nums[i])
            total -= ql.pop()!
            part1[i - n + 1] = total
        }
        
        var part2 = nums[(n * 2)...].reduce(0, +)
        var qr = Heap(.minHeap, Array(nums[(n * 2)...]))
        var ans = part1[n] - part2
        
        for i in stride(from: n * 2 - 1, through: n, by: -1) {
            part2 += nums[i]
            qr.push(nums[i])
            part2 -= qr.pop()!
            ans = min(ans, part1[i - n] - part2)
        }
        
        return ans
    }
}