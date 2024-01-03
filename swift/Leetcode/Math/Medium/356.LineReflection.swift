// Given n points on a 2D plane, find if there is such a line parallel 
// to the y-axis that reflects the given points symmetrically.
// In other words, answer whether or not if there exists a line that after 
// reflecting all points over the given line, the original points' set is 
// the same as the reflected ones. Note that there can be repeated points.

func isReflected(_ points: [[Int]]) -> Bool {
    var yLines = [Int: [Int]]()

    for point in points {
        yLines[point[1], default: []].append(point[0])
    }

    for key in yLines.keys {
        yLines[key] = Array(Set(yLines[key]!)).sorted()
    }

    var line = (Double(yLines[points[0][1]]!.last!) + Double(yLines[points[0][1]]!.first!)) / 2

    for values in yLines.values {
        var left = 0, right = values.count - 1

        while left <= right {
            let mid = Double(values[left] + values[right]) / 2

            if mid == line {
                left += 1
                right -= 1
            } else {
                return false
            }
        }
    }

    return true
}

print(isReflected([[1,1],[-1,1]]))
print(isReflected([[1,1],[-1,-1]]))