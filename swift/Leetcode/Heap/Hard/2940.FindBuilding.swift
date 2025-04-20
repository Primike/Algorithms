// You are given a 0-indexed array heights of positive integers, 
// where heights[i] represents the height of the ith building.
// If a person is in building i, they can move to any other building j 
// if and only if i < j and heights[i] < heights[j].
// You are also given another array queries where queries[i] = [ai, bi]. 
// On the ith query, Alice is in building ai while Bob is in building bi.
// Return an array ans where ans[i] is the index of the leftmost building 
// where Alice and Bob can meet on the ith query. 
// If Alice and Bob cannot move to a common building on query i, set ans[i] to -1.

struct Query: Comparable {
    let i: Int
    let height: Int

    static func < (_ l: Query, _ r: Query) -> Bool {
        if l.height == r.height { return l.i < r.i }
        return l.height < r.height
    }
} 

// Time: O(n * log(q)), Space: O(n + q)
func leftmostBuildingQueries(_ heights: [Int], _ queries: [[Int]]) -> [Int] {
    var newQueries = Array(repeating: [Query](), count: heights.count)
    var result = Array(repeating: -1, count: queries.count)

    for (i, query) in queries.enumerated() {
        let alice = query[0]
        let bob = query[1]

        if alice < bob, heights[alice] < heights[bob] {
            result[i] = bob
        } else if alice > bob, heights[alice] > heights[bob] {
            result[i] = alice
        } else if alice == bob {
            result[i] = alice
        } else {
            let query = Query(i: i, height: max(heights[alice], heights[bob]))
            newQueries[max(alice, bob)].append(query)
        }
    }

    var heap = Heap<Query>(.minHeap)

    for (i, height) in heights.enumerated() {
        while let shortest = heap.peek(), shortest.height < height {
            heap.pop()
            result[shortest.i] = i
        }

        for query in newQueries[i] {
            heap.push(query)
        }
    }

    return result
}

print(leftmostBuildingQueries([6,4,8,5,2,7], [[0,1],[0,3],[2,4],[3,4],[2,2]]))
print(leftmostBuildingQueries([5,3,8,2,6,1,4,6], [[0,7],[3,5],[5,2],[3,0],[1,6]]))


func leftmostBuildingQueries(_ heights: [Int], _ queries: [[Int]]) -> [Int] {
    var result = Array(repeating: -1, count: queries.count)
    var bobQueries = Array(repeating: [(Int, Int)](), count: heights.count)

    for i in 0..<queries.count {
        var alice = min(queries[i][0], queries[i][1])
        var bob = max(queries[i][0], queries[i][1])
        
        if alice == bob || heights[bob] > heights[alice] {
            result[i] = bob
        } else {
            bobQueries[bob].append((heights[alice], i))
        }
    }

    var monotomic = [(Int, Int)]()

    for j in (0..<heights.count).reversed() {
        for (aliceHeight, queryIndex) in bobQueries[j] {
            var left = 0, right = monotomic.count - 1
            var index = -1

            while left <= right {
                let mid = (right + left) / 2

                if monotomic[mid].0 > aliceHeight {
                    index = max(index, mid)
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            if index != -1 { result[queryIndex] = monotomic[index].1 }
        }

        while let last = monotomic.last, last.0 <= heights[j] {
            monotomic.removeLast()
        }
        
        monotomic.append((heights[j], j))
    }

    return result
}