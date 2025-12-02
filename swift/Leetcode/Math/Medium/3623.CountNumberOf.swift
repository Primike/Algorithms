class Solution {
    func countTrapezoids(_ points: [[Int]]) -> Int {
        var pointNum = [Int: Int]()
        let mod = 1_000_000_007
        var ans = 0
        var totalSum = 0

        for point in points {
            pointNum[point[1], default: 0] += 1
        }

        for pNum in pointNum.values {
            let edge = pNum * (pNum - 1) / 2
            ans = (ans + edge * totalSum) % mod
            totalSum = (totalSum + edge) % mod
        }

        return ans
    }
}