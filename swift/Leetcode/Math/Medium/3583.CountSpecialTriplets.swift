class Solution {
    func specialTriplets(_ nums: [Int]) -> Int {
        let mod = 1_000_000_007
        var numCnt = [Int: Int]()
        var numPartialCnt = [Int: Int]()

        for v in nums {
            numCnt[v, default: 0] += 1
        }

        var ans = 0
        for v in nums {
            let target = v * 2
            let lCnt = numPartialCnt[target, default: 0]
            numPartialCnt[v, default: 0] += 1
            let rCnt = numCnt[target, default: 0] - numPartialCnt[target, default: 0]
            ans = (ans + lCnt * rCnt) % mod
        }

        return ans
    }
}