class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        var ans = 0
        for i in 0..<points.count - 1 {
            let currX = points[i][0]
            let currY = points[i][1]
            let targetX = points[i + 1][0]
            let targetY = points[i + 1][1]
            
            ans += max(abs(targetX - currX), abs(targetY - currY))
        }
        
        return ans
    }
}