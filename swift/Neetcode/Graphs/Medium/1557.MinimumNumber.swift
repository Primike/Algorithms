// Find the smallest set of vertices from which all nodes in the graph are reachable. 
// It's guaranteed that a unique solution exists.

func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var neighbors = Array(repeating: [Int](), count: n)

    for edge in edges {
        neighbors[edge[1]].append(edge[0])
    }

    var result = [Int]()

    for (n, incoming) in neighbors.enumerated() {
        if incoming.isEmpty { result.append(n) }
    }

    return result
}

print(findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]]))
print(findSmallestSetOfVertices(5, [[0,1],[2,1],[3,1],[1,4],[2,4]]))