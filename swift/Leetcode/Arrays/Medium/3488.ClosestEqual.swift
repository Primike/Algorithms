class Solution {
    func solveQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let n = nums.count
        var left = Array(repeating: 0, count: n)
        var right = Array(repeating: 0, count: n)
        var pos = [Int: Int]()
        var results = queries

        for i in -n..<n {
            if i >= 0 {
                left[i] = pos[nums[i]] ?? 0
            }
            pos[nums[(i + n) % n]] = i
        }

        pos.removeAll()
        for i in stride(from: 2 * n - 1, through: 0, by: -1) {
            if i < n {
                right[i] = pos[nums[i]] ?? 0
            }
            pos[nums[i % n]] = i
        }

        for i in 0..<results.count {
            let x = results[i]
            let distLeft = x - left[x]
            let distRight = right[x] - x
            
            if distLeft == n {
                results[i] = -1
            } else {
                results[i] = min(distLeft, distRight)
            }
        }

        return results
    }
}