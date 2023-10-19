// Return the minimum cost to make all points connected. All points are connected 
// if there is exactly one simple path between any two points.

struct Cost: Comparable {
    let cost: Int
    let vertex: Int

    static func <(left: Cost, right: Cost) -> Bool {
        return left.cost < right.cost
    }
}

func minCostConnectPoints(_ points: [[Int]]) -> Int {
    let points = points.map { ($0[0], $0[1]) }
    var heap = Heap<Cost>(type: .minHeap)
    var visited = Set<Int>()
    var result = 0

    func manhattanDistance(_ a: (Int, Int), _ b: (Int, Int)) -> Int {
        return abs(a.0 - b.0) + abs(a.1 - b.1)
    }

    visited.insert(0)
    
    for i in 1..<points.count {
        let cost = manhattanDistance(points[0], points[i])
        heap.push(Cost(cost: cost, vertex: i))
    }

    while !heap.isEmpty, visited.count < points.count {
        let first = heap.pop()!
        if visited.contains(first.vertex) { continue }

        result += first.cost
        visited.insert(first.vertex)

        for i in 0..<points.count {
            if !visited.contains(i) {
                let newCost = manhattanDistance(points[first.vertex], points[i])
                heap.push(Cost(cost: newCost, vertex: i))
            }
        }
    }
    
    return result
}

print(minCostConnectPoints([[0,0],[2,2],[3,10],[5,2],[7,0]]))
print(minCostConnectPoints([[3,12],[-2,5],[-4,1]]))