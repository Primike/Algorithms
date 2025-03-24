// You are in a city that consists of n intersections numbered 
// from 0 to n - 1 with bi-directional roads between some intersections. 
// The inputs are generated such that you can reach any intersection 
// from any other intersection and that there is at most 
// one road between any two intersections.
// You are given an integer n and a 2D integer array roads 
// where roads[i] = [ui, vi, timei] means that there is a road 
// between intersections ui and vi that takes timei minutes to travel. 
// You want to know in how many ways you can travel from intersection 
// 0 to intersection n - 1 in the shortest amount of time.
// Return the number of ways you can arrive at your destination 
// in the shortest amount of time. Since the answer may be large, 
// return it modulo 109 + 7.

struct Node: Comparable {
    var time: Int
    var node: Int

    static func < (_ l: Node, _ r: Node) -> Bool {
        return l.time < r.time
    }
}

// Time: O((n + e) * log(n)), Space: O(n + e)
func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
    let mod = 1_000_000_007
    var neighbors = Array(repeating: [(Int, Int)](), count: n)

    for road in roads {
        neighbors[road[0]].append((road[1], road[2]))
        neighbors[road[1]].append((road[0], road[2]))
    }

    var heap = Heap<Node>(.minHeap, [Node(time: 0, node: 0)])
    var result = Array(repeating: 0, count: n)
    var memo = Array(repeating: Int.max, count: n)
    result[0] = 1
    memo[0] = 0

    while !heap.isEmpty {
        let first = heap.pop()!
        if first.time > memo[first.node] { continue }

        for (next, time) in neighbors[first.node] {
            let newTime = first.time + time

            if newTime < memo[next] {
                result[next] = result[first.node]
                memo[next] = newTime
                heap.push(Node(time: newTime, node: next))
            } else if newTime == memo[next] {
                result[next] = (result[next] + result[first.node]) % mod
            }
        }
    }

    return result[n - 1]
}

print(countPaths(7, [
    [0,6,7],[0,1,2],[1,2,3],[1,3,3],
    [6,3,3],[3,5,1],[6,5,1],[2,5,1],
    [0,4,5],[4,6,2]]))
print(countPaths(2, [[1,0,10]]))