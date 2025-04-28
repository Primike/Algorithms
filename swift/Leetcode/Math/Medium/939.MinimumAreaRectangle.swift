// You are given an array of points in the X-Y 
// plane points where points[i] = [xi, yi].
// Return the minimum area of a rectangle formed from these points, 
// with sides parallel to the X and Y axes. 
// If there is not any such rectangle, return 0.

// Time: O(n^2), Space: O(n)
func minAreaRect(_ points: [[Int]]) -> Int {
    var cols = [Int: [Int]]()
    
    for point in points {
        cols[point[0], default: []].append(point[1])
    }

    var visited = [[Int]: Int]()
    var result = Int.max

    for x in cols.keys.sorted() {
        let yValues = cols[x, default: []].sorted()

        for i in 0..<yValues.count {
            for j in (i + 1)..<yValues.count {
                let key = [yValues[i], yValues[j]]

                if let index = visited[key] {
                    let height = yValues[j] - yValues[i]
                    let width = x - index
                    result = min(result, width * height)
                }

                visited[key] = x
            }
        }
    }

    return result == Int.max ? 0 : result
}

print(minAreaRect([[1,1],[1,3],[3,1],[3,3],[2,2]]))
print(minAreaRect([[1,1],[1,3],[3,1],[3,3],[4,1],[4,3]]))