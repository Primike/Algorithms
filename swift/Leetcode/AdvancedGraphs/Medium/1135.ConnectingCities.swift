struct Edge: Comparable {
    let u: Int
    let v: Int
    let w: Int
    static func < (lhs: Edge, rhs: Edge) -> Bool { lhs.w < rhs.w }
}

class Solution {
    var parent: [Int] = []
    var cnt = 0
    
    private func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    private func union(_ x: Int, _ y: Int) {
        let px = find(x), py = find(y)
        if px != py {
            parent[px] = py
            cnt -= 1
        }
        _ = px; _ = py
    }
    
    func minimumCost(_ N: Int, _ connections: [[Int]]) -> Int {
        parent = Array(0...N)
        cnt = N
        var heap = Heap<Edge>(.minHeap)
        for c in connections { heap.push(Edge(u: c[0], v: c[1], w: c[2])) }
        var res = 0
        while !heap.isEmpty && cnt > 1 {
            if let e = heap.pop() {
                if find(e.u) != find(e.v) {
                    res += e.w
                    union(e.u, e.v)
                }
            }
        }
        return cnt == 1 ? res : -1
    }
}