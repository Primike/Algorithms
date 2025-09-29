class Solution {
    func largestTriangleArea(_ points: [[Int]]) -> Double {
        let n = points.count
        var ans = 0.0
        
        for i in 0..<n {
            for j in (i + 1)..<n {
                for k in (j + 1)..<n {
                    ans = max(ans, area(points[i], points[j], points[k]))
                }
            }
        }
        return ans
    }

    func area(_ P: [Int], _ Q: [Int], _ R: [Int]) -> Double {
        return 0.5 * abs(Double(P[0] * Q[1] + Q[0] * R[1] + R[0] * P[1] - P[1] * Q[0] - Q[1] * R[0] - R[1] * P[0]))
    }
}