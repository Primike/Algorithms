// Given an array of points where points[i] = [xi, yi] 
// represents a point on the X-Y plane, return the 
// maximum number of points that lie on the same straight line.

// Time: O(n * log(n) + n^2), Space: O(n)
func maxPoints(_ points: [[Int]]) -> Int {
    let points = points.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
    var result = 1

    for i in 0..<points.count {
        var slopes = [Double: Int]()

        for j in (i + 1)..<points.count {
            let dx = Double(points[j][0] - points[i][0])
            let dy = Double(points[j][1] - points[i][1])
            let slope = dy / dx

            slopes[slope, default: 0] += 1
            result = max(result, slopes[slope]! + 1)
        }
    }

    return result
}

print(maxPoints([[1,1],[2,2],[3,3]]))
print(maxPoints([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]))