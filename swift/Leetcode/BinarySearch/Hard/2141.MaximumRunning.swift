class Solution {
    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        var left = 1
        var right = batteries.reduce(0, +) / n
        
        while left < right {
            let target = right - (right - left) / 2
            
            var extra = 0
            for power in batteries {
                extra += min(power, target)
            }
            
            if extra / n >= target {
                left = target
            } else {
                right = target - 1
            }
        }
        
        return left
    }
}