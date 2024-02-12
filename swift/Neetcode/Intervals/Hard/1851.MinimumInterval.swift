// You are also given an integer array queries. 
// The answer to the jth query is the size of the smallest interval i 
// such that lefti <= queries[j] <= righti. 
// If no such interval exists, the answer is -1.
// Return an array containing the answers to the queries.

struct Interval: Comparable {
    let range: Int
    let end: Int

    static func < (_ l: Interval, _ r: Interval) -> Bool {
        if l.range == r.range { return l.end < r.end }
        return l.range < r.range
    }
}

func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
    let intervals = intervals.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
    var heap = Heap<Interval>(.minHeap)
    var result = [Int: Int]()
    var i = 0

    for query in queries.sorted() {
        while i < intervals.count, intervals[i][0] <= query {
            let range = intervals[i][1] - intervals[i][0] + 1
            heap.push(Interval(range: range, end: intervals[i][1]))
            i += 1
        }

        while let first = heap.peek(), first.end < query {
            heap.pop()
        }

        result[query] = heap.peek()?.range ?? -1
    }

    return queries.map { result[$0, default: -1] }
}

print(minInterval([[1,4],[2,4],[3,6],[4,4]], [2,3,4,5]))
print(minInterval([[2,3],[2,5],[1,8],[20,25]], [2,19,5,22]))