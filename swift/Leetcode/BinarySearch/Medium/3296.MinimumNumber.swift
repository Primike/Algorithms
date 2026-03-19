class Solution {
    func minNumberOfSeconds(_ mountainHeight: Int, _ workerTimes: [Int]) -> Int {
        let maxWorkerTime = workerTimes.max() ?? 0
        var l = 1
        var r = maxWorkerTime * mountainHeight * (mountainHeight + 1) / 2
        var ans = 0
        let eps = 1e-7

        while l <= r {
            let mid = l + (r - l) / 2
            var cnt = 0
            
            for t in workerTimes {
                let work = mid / t
                let k = Int((-1.0 + sqrt(Double(1 + 8 * work))) / 2.0 + eps)
                cnt += k
                if cnt >= mountainHeight { break }
            }
            
            if cnt >= mountainHeight {
                ans = mid
                r = mid - 1
            } else {
                l = mid + 1
            }
        }

        return ans
    }
}