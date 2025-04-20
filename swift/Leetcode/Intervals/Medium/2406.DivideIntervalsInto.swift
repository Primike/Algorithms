// You have to divide the intervals into one or more groups 
// such that each interval is in exactly one group, 
// and no two intervals that are in the same group intersect each other.
// Return the minimum number of groups you need to make.

// Time: O(n * log(n)), Space: O(n)
func minGroups(_ intervals: [[Int]]) -> Int {
    var edgePoints = [(Int, Int)]()

    for interval in intervals {
        edgePoints.append((interval[0], 1))
        edgePoints.append((interval[1] + 1, -1))
    }

    edgePoints.sort { ($0.0, $0.1) < ($1.0, $1.1) }

    var result = 0
    var currentIntervals = 0

    for edge in edgePoints {
        currentIntervals += edge.1
        result = max(result, currentIntervals)
    }

    return result
}

print(minGroups([[5,10],[6,8],[1,5],[2,3],[1,10]]))
print(minGroups([[1,3],[5,6],[8,10],[11,13]]))


func minGroups2(_ intervals: [[Int]]) -> Int {
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var heap = Heap<Int>(.minHeap)
    var result = 0

    for interval in intervals {
        while let first = heap.peek(), first < interval[0] {
            heap.pop()
        }

        heap.push(interval[1])
        result = max(result, heap.count)
    }

    return result
}