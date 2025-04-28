// Given n points on a 2D plane, find if there is such a line parallel 
// to the y-axis that reflects the given points symmetrically.
// In other words, answer whether or not if there exists a line that after 
// reflecting all points over the given line, the original points' set is 
// the same as the reflected ones. Note that there can be repeated points.

// Time: O(n * log(n)), Space: O(n)
func isReflected(_ points: [[Int]]) -> Bool {
    var points = Array(Set(points)).map { [Double($0[0]), Double($0[1])] }
    points.sort { $0[0] < $1[0] }
    var yLines = [Double: [Double]]()

    for point in points {
        yLines[point[1], default: []].append(point[0])
    }
    
    let leftPoint = yLines[points[0][1]]!.first!
    let rightPoint = yLines[points[0][1]]!.last!
    var midPoint = (leftPoint + rightPoint) / 2

    for values in yLines.values {
        var left = 0, right = values.count - 1

        while left <= right {
            if (values[left] + values[right]) / 2 != midPoint { 
                return false 
            }

            left += 1
            right -= 1
        }
    }

    return true
}

print(isReflected([[1,1],[-1,1]]))
print(isReflected([[1,1],[-1,-1]]))