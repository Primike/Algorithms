class Solution {
    private static func bisectRight(_ events: [[Int]], _ target: Int) -> Int {
        var left = 0
        var right = events.count
        while left < right {
            let mid = left + (right - left) / 2
            if events[mid][0] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }

    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        let n = events.count
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
        let sortedEvents = events.sorted { $0[0] < $1[0] }

        for curIndex in (0..<n).reversed() {
            let nextIndex = Solution.bisectRight(sortedEvents, sortedEvents[curIndex][1])
            for count in 1...k {
                let skipCurrentEvent = dp[count][curIndex + 1]
                let attendCurrentEvent = sortedEvents[curIndex][2] + dp[count - 1][nextIndex]
                dp[count][curIndex] = max(skipCurrentEvent, attendCurrentEvent)
            }
        }

        return dp[k][0]
    }
}