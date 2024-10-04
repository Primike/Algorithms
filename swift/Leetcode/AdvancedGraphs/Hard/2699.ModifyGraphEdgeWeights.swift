
struct Node: Comparable {
    let distance: Int
    let vertex: Int

    static func < (_ lhs: Node, _ rhs: Node) -> Bool {
        return lhs.distance < rhs.distance
    }
}

func modifiedGraphEdges(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int, _ target: Int) -> [[Int]] {
    let INF = Int(2e9)
    var graph = Array(repeating: [(Int, Int)](), count: n)
    var edges = edges

    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        let w = edge[2]
        
        if w != -1 {
            graph[u].append((v, w))
            graph[v].append((u, w))
        }
    }

    func dijkstra(_ graph: [[(Int, Int)]], _ src: Int, _ dest: Int) -> Int {
        var minDistance = Array(repeating: Int.max, count: graph.count)
        minDistance[src] = 0
        var minHeap = Heap<Node>(.minHeap)
        minHeap.push(Node(distance: 0, vertex: src))

        while !minHeap.isEmpty {
            let node = minHeap.pop()!
            let u = node.vertex
            let d = node.distance

            if d > minDistance[u] { continue }

            for (v, w) in graph[u] {
                if d + w < minDistance[v] {
                    minDistance[v] = d + w
                    minHeap.push(Node(distance: minDistance[v], vertex: v))
                }
            }
        }

        return minDistance[dest]
    }

    var currentShortestDistance = dijkstra(graph, source, destination)
    if currentShortestDistance < target { return [] }

    if currentShortestDistance == target {
        for i in 0..<edges.count {
            if edges[i][2] == -1 { edges[i][2] = INF }
        }

        return edges
    }

    for i in 0..<edges.count {
        let u = edges[i][0]
        let v = edges[i][1]
        let w = edges[i][2]

        if w != -1 { continue }

        edges[i][2] = 1
        graph[u].append((v, 1))
        graph[v].append((u, 1))
        currentShortestDistance = dijkstra(graph, source, destination)

        if currentShortestDistance <= target {
            edges[i][2] += target - currentShortestDistance
            
            for j in (i + 1)..<edges.count {
                if edges[j][2] == -1 { edges[j][2] = INF }
            }

            return edges
        }
    }

    return []
}

print(modifiedGraphEdges(5, [[4,1,-1],[2,0,-1],[0,3,-1],[4,3,-1]], 0, 1, 5))
print(modifiedGraphEdges(3, [[0,1,-1],[0,2,5]], 0, 2, 6))
print(modifiedGraphEdges(4, [[1,0,4],[1,2,3],[2,3,5],[0,3,-1]], 0, 2, 6))