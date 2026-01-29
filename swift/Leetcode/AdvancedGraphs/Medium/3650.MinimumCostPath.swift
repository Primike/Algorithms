struct NodeState: Comparable {
    let dist: Int
    let node: Int
    
    static func < (lhs: NodeState, rhs: NodeState) -> Bool {
        return lhs.dist < rhs.dist
    }
}

class Solution {
    func minCost(_ n: Int, _ edges: [[Int]]) -> Int {
        var g = Array(repeating: [(to: Int, weight: Int)](), count: n)
        for edge in edges {
            let x = edge[0], y = edge[1], w = edge[2]
            g[x].append((y, w))
            g[y].append((x, 2 * w))
        }

        var dist = Array(repeating: Int.max, count: n)
        var visited = Array(repeating: false, count: n)
        dist[0] = 0
        
        var heap = Heap<NodeState>(.minHeap)
        heap.push(NodeState(dist: 0, node: 0))

        while let current = heap.pop() {
            let x = current.node
            let curDist = current.dist

            if x == n - 1 {
                return curDist
            }

            if visited[x] {
                continue
            }
            visited[x] = true

            for neighbor in g[x] {
                let y = neighbor.to
                let w = neighbor.weight
                let newDist = curDist + w
                
                if newDist < dist[y] {
                    dist[y] = newDist
                    heap.push(NodeState(dist: newDist, node: y))
                }
            }
        }

        return -1
    }
}