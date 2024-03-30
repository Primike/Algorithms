// You are given a network of n nodes, labeled from 1 to n. 
// You are also given times, a list of travel times as directed edges 
// times[i] = (ui, vi, wi), where ui is the source node, 
// vi is the target node, and wi is the time it takes for a signal 
// to travel from source to target.
// We will send a signal from a given node k. Return the minimum time it takes 
// for all the n nodes to receive the signal. 
// If it is impossible for all the n nodes to receive the signal, return -1.

struct Node: Comparable {
    let n: Int
    let time: Int

    static func < (_ l: Node, _ r: Node) -> Bool {
        return l.time < r.time
    }
}

// Time: O(e * logn), Space: O(n + e)
func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    var paths = Array(repeating: [(Int, Int)](), count: n + 1)
    var heap = Heap<Node>(.minHeap)

    for path in times {
        paths[path[0]].append((path[1], path[2]))
        if path[0] == k { heap.push(Node(n: path[1], time: path[2])) }
    }

    var visited = Set([k])
    var time = 0
    
    while !heap.isEmpty, visited.count != n {
        let closest = heap.pop()!
        if visited.contains(closest.n) { continue }

        time = closest.time
        visited.insert(closest.n)

        for node in paths[closest.n] {
            if visited.contains(node.0) { continue }
            heap.push(Node(n: node.0, time: closest.time + node.1))
        }
    }

    return visited.count == n ? time : -1
}

print(networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4, 2))
print(networkDelayTime([[1,2,1]], 2, 1))
print(networkDelayTime([[1,2,1]], 2, 2))