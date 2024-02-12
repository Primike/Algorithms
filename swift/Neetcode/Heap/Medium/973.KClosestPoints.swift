// Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane 
// and an integer k, return the k closest points to the origin (0, 0).

struct Point: Comparable {
    let x: Int
    let y: Int

    static func < (_ l: Point, _ r: Point) -> Bool {
        let left = l.x * l.x + l.y * l.y
        let right = r.x * r.x + r.y * r.y
        
        return left < right
    }
}

// Time: nlog(k), Space: k
func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var heap = Heap<Point>(.maxHeap)

    for point in points {
        let point = Point(x: point[0], y: point[1])
        
        if heap.count < k {
            heap.push(point)
        } else if let first = heap.peek(), first > point {
            heap.pop()
            heap.push(point)
        }
    }

    var result = [[Int]]()

    while let point = heap.pop() {
        result.append([point.x, point.y])
    }

    return result
}

print(kClosest([[1,3],[-2,2]], 1))
print(kClosest([[3,3],[5,-1],[-2,4]], 2))