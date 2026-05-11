class Solution {
    func distance(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = Array(repeating: 0, count: n)
        var mp = [Int: [Int]]()

        for (i, v) in nums.enumerated() {
            mp[v, default: []].append(i)
        }

        for pos in mp.values {
            let m = pos.count
            let total = pos.reduce(0, +)
            var leftSum = 0

            for i in 0..<m {
                let p = pos[i]
                let rightSum = total - leftSum - p
                
                let leftDist = (p * i) - leftSum
                let rightDist = rightSum - (p * (m - i - 1))
                
                ans[p] = leftDist + rightDist
                leftSum += p
            }
        }

        return ans
    }
}