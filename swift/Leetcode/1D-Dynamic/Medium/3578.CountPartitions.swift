class Solution {
    func countPartitions(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let mod = 1_000_000_007
        var dp = Array(repeating: 0, count: n + 1)
        var prefix = Array(repeating: 0, count: n + 1)
        var minQ = [Int]()
        var maxQ = [Int]()

        dp[0] = 1
        prefix[0] = 1
        var j = 0

        for i in 0..<n {
            while let last = maxQ.last, nums[last] <= nums[i] {
                maxQ.removeLast()
            }
            maxQ.append(i)

            while let last = minQ.last, nums[last] >= nums[i] {
                minQ.removeLast()
            }
            minQ.append(i)

            while let maxIdx = maxQ.first, let minIdx = minQ.first, nums[maxIdx] - nums[minIdx] > k {
                if maxIdx == j {
                    maxQ.removeFirst()
                }
                if minIdx == j {
                    minQ.removeFirst()
                }
                j += 1
            }

            if j > 0 {
                dp[i + 1] = (prefix[i] - prefix[j - 1] + mod) % mod
            } else {
                dp[i + 1] = prefix[i] % mod
            }
            prefix[i + 1] = (prefix[i] + dp[i + 1]) % mod
        }

        return dp[n]
    }
}