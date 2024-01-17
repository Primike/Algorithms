// You are given a network of n nodes, labeled from 1 to n. 
// You are also given times, a list of travel times as directed edges 
// times[i] = (ui, vi, wi), where ui is the source node, 
// vi is the target node, and wi is the time it takes for a signal 
// to travel from source to target.
// We will send a signal from a given node k. Return the minimum time it takes 
// for all the n nodes to receive the signal. 
// If it is impossible for all the n nodes to receive the signal, return -1.

struct Node: Comparable {
    let i: Int
    var time: Int

    static func < (_ l: Node, _ r: Node) -> Bool {
        return l.time < r.time
    }
}

// Time: O(e * logn), Space: O(n + e)
func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    var paths = Array(repeating: [Node](), count: n + 1)

    for time in times {
        paths[time[0]].append(Node(i: time[1], time: time[2]))
    }

    var heap = Heap<Node>(.minHeap, paths[k])
    var visited = Set([k])
    var result = 0

    while !heap.isEmpty {
        let shortest = heap.pop()!
        if visited.contains(shortest.i) { continue }

        visited.insert(shortest.i)
        result = max(result, shortest.time)

        for node in paths[shortest.i] {
            if visited.contains(node.i) { continue }

            var updated = node
            updated.time += shortest.time
            heap.push(updated)
        }
    }

    return visited.count == n ? result : -1
}

print(networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4, 2))
print(networkDelayTime([[1,2,1]], 2, 1))
print(networkDelayTime([[1,2,1]], 2, 2))