// Given n points on a 2D plane where points[i] = [xi, yi], 
// Return the widest vertical area between two points such that 
// no points are inside the area.

// Time: O(n * log(n)), Space: O(n)
func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
    let points = points.sorted { $0[0] < $1[0] }
    var result = 0

    for i in 0..<points.count - 1 {
        result = max(result, points[i + 1][0] - points[i][0])
    }

    return result
}

print(maxWidthOfVerticalArea([[8,7],[9,9],[7,4],[9,7]]))
print(maxWidthOfVerticalArea([[3,1],[9,0],[1,0],[1,4],[5,3],[8,8]]))