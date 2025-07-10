class Solution {
    func maxFreeTime(_ eventTime: Int, _ k: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
        let n = startTime.count
        var res = 0
        var t = 0
        
        for i in 0..<n {
            t += endTime[i] - startTime[i]
            
            let left = i <= k - 1 ? 0 : endTime[i - k]
            let right = i == n - 1 ? eventTime : startTime[i + 1]
            
            res = max(res, right - left - t)
            
            if i >= k - 1 {
                t -= endTime[i - k + 1] - startTime[i - k + 1]
            }
        }
        
        return res
    }
}