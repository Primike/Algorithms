struct Query: Comparable {
    let maxHeight: Int
    let queryIndex: Int

    static func < (lhs: Query, rhs: Query) -> Bool {
        return lhs.maxHeight < rhs.maxHeight || (lhs.maxHeight == rhs.maxHeight && lhs.queryIndex < rhs.queryIndex)
    }
} 

func leftmostBuildingQueries(_ heights: [Int], _ queries: [[Int]]) -> [Int] {
    var maxIdx = Heap<Query>(.minHeap)
    var results = Array(repeating: -1, count: queries.count)
    var storeQueries = Array(repeating: [Query](), count: heights.count)

    for (idx, query) in queries.enumerated() {
        let a = query[0]
        let b = query[1]

        if a < b && heights[a] < heights[b] {
            results[idx] = b
        } else if a > b && heights[a] > heights[b] {
            results[idx] = a
        } else if a == b {
            results[idx] = a
        } else {
            storeQueries[max(a, b)].append(Query(maxHeight: max(heights[a], heights[b]), queryIndex: idx))
        }
    }

    for (idx, height) in heights.enumerated() {
        while let top = maxIdx.peek(), top.maxHeight < height {
            _ = maxIdx.pop()
            results[top.queryIndex] = idx
        }

        for element in storeQueries[idx] {
            maxIdx.push(element)
        }
    }

    return results
}

print(leftmostBuildingQueries([6,4,8,5,2,7], [[0,1],[0,3],[2,4],[3,4],[2,2]]))
print(leftmostBuildingQueries([5,3,8,2,6,1,4,6], [[0,7],[3,5],[5,2],[3,0],[1,6]]))