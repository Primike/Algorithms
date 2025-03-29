// You are given a positive integer n which is the number of nodes 
// of a 0-indexed directed weighted graph and a 0-indexed 
// 2D array edges where edges[i] = [ui, vi, wi] indicates 
// that there is an edge from node ui to node vi with weight wi.
// You are also given a node s and a node array marked; 
// your task is to find the minimum distance from s to any of the nodes in marked.
// Return an integer denoting the minimum distance from s to any 
// node in marked or -1 if there are no paths from s to any of the marked nodes.

struct Node: Comparable {
    let n: Int
    let weight: Int

    static func < (_ l: Node, _ r: Node) -> Bool {
        return l.weight < r.weight
    }
}

func minimumDistance(_ n: Int, _ edges: [[Int]], _ s: Int, _ marked: [Int]) -> Int {
    var paths = Array(repeating: [(Int, Int)](), count: n)

    for edge in edges {
        paths[edge[0]].append((edge[1], edge[2]))
    }

    let marked = Set(marked)
    var heap = Heap<Node>(.minHeap, [Node(n: s, weight: 0)])
    var visited = Set<Int>()

    while !heap.isEmpty {
        let first = heap.pop()!

        if marked.contains(first.n) { return first.weight }
        if visited.contains(first.n) { continue }

        visited.insert(first.n)

        for (next, weight) in paths[first.n] {
            if visited.contains(next) { continue }
            heap.push(Node(n: next, weight: first.weight + weight))
        }
    }

    return -1
}

print(minimumDistance(4, [[0,1,1],[1,2,3],[2,3,2],[0,3,4]], 0, [2,3]))
print(minimumDistance(5, [[0,1,2],[0,2,4],[1,3,1],[2,3,3],[3,4,2]], 1, [0,4]))
print(minimumDistance(4, [[0,1,1],[1,2,3],[2,3,2]], 3, [0,1]))