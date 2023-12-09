// Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane 
// and an integer k, return the k closest points to the origin (0, 0).

struct PointMagnitude: Comparable {
    let point: [Int]
    let magnitude: Int

    static func <(left: PointMagnitude, right: PointMagnitude) -> Bool {
        return left.magnitude < right.magnitude
    }
}

// Time: nlog(k), Space: k
func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var heap = Heap<PointMagnitude>(type: .maxHeap)

    for point in points {
        let magnitude = point[0] * point[0] + point[1] * point[1]
        let pointMagnitude = PointMagnitude(point: point, magnitude: magnitude)
        if heap.count < k {
            heap.push(pointMagnitude)
        } else if let first = heap.peek(), pointMagnitude < first {
            heap.pop()
            heap.push(pointMagnitude)
        }
    }

    var result = [[Int]]()

    while let popped = heap.pop() {
        result.append(popped.point)
    }

    return result
}

print(kClosest([[1,3],[-2,2]], 1))
print(kClosest([[3,3],[5,-1],[-2,4]], 2))