// Return the minimum cost to make all points connected. All points are connected 
// if there is exactly one simple path between any two points.

struct Point: Comparable {
    let n: Int
    let cost: Int

    static func < (_ l: Point, _ r: Point) -> Bool {
        return l.cost < r.cost
    }
}

// Time: O(n^2 * logn), Space: O(n^2)
func minCostConnectPoints(_ points: [[Int]]) -> Int {
    let points = points.map { ($0[0], $0[1]) }
    var heap = Heap<Point>(.minHeap)
    var visited = Set([0])
    var result = 0

    for i in 1..<points.count {
        let cost = abs(points[0].0 - points[i].0) + abs(points[0].1 - points[i].1)
        heap.push(Point(n: i, cost: cost))
    }

    while !heap.isEmpty, visited.count < points.count {
        let closest = heap.pop()!
        if visited.contains(closest.n) { continue }

        result += closest.cost
        visited.insert(closest.n)
        let n = closest.n

        for i in 0..<points.count {
            if visited.contains(i) { continue }

            let cost = abs(points[n].0 - points[i].0) + abs(points[n].1 - points[i].1)
            heap.push(Point(n: i, cost: cost))
        }
    }

    return result
}

print(minCostConnectPoints([[0,0],[2,2],[3,10],[5,2],[7,0]]))
print(minCostConnectPoints([[3,12],[-2,5],[-4,1]]))