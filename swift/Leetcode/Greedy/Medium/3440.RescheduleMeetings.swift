class Solution {
    func maxFreeTime(_ eventTime: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
        let n = startTime.count
        var res = 0
        var t1 = 0
        var t2 = 0

        for i in 0..<n {
            let left1 = i == 0 ? 0 : endTime[i - 1]
            let right1 = i == n - 1 ? eventTime : startTime[i + 1]
            if endTime[i] - startTime[i] <= t1 {
                res = max(res, right1 - left1)
            }
            t1 = max(t1, startTime[i] - (i == 0 ? 0 : endTime[i - 1]))
            res = max(res, right1 - left1 - (endTime[i] - startTime[i]))

            let left2 = i == n - 1 ? 0 : endTime[n - i - 2]
            let right2 = i == 0 ? eventTime : startTime[n - i]
            if endTime[n - i - 1] - startTime[n - i - 1] <= t2 {
                res = max(res, right2 - left2)
            }
            t2 = max(t2, (i == 0 ? eventTime : startTime[n - i]) - endTime[n - i - 1])
        }
        
        return res
    }
}